import 'dart:async';
import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';

import 'package:newton_meter/math/accel_math.dart';

class SensorTestPage extends StatefulWidget {
  const SensorTestPage({super.key});

  @override
  State<SensorTestPage> createState() => _SensorTestPageState();
}

class _SensorTestPageState extends State<SensorTestPage> {
  StreamSubscription<UserAccelerometerEvent>? userAccelSubscription;

  bool thing = false;
  // DateTime? lastTime;
  List<Vec3Time> acceleration = [];

  double px = 0, py = 0, pz = 0;
  double vx = 0, vy = 0, vz = 0;

  double maxa = 0;

  // bool shouldStart = false;
  bool running = false;
  DateTime? recordStart;

  void record() {
    if (!running) {
      running = true;
      recordStart = null;
      maxa = 0;
    } else {
      running = false;
      recordStart = null;
      finishRecording();
    }
  }

  void finishRecording() {
    var velocity = integrate(acceleration);
    var position = integrate(velocity);

    var s_acceleration = scalarize(acceleration);
    var s_velocity = scalarize(velocity);
    var s_position = scalarize(position);

    maxa = s_acceleration[0];
    for (double a in s_acceleration) {
      if (a > maxa) {
        maxa = a;
      }
    }

    print("Stopping!");
    if (s_position.isEmpty) {
      print("s_position was empty!");
      print(
          "lens ${position.length}, ${velocity.length}, ${acceleration.length}");
    } else {
      print(s_position.last);

      px = position.last.x;
      py = position.last.y;
      pz = position.last.z;

      vx = velocity.last.x;
      vy = velocity.last.y;
      vz = velocity.last.z;
    }

    acceleration.clear();
    velocity.clear();
    position.clear();
    s_velocity.clear();
    s_position.clear();
  }

  @override
  Widget build(BuildContext context) {
    var text = "Press Me";
    if (running) {
      text = "Recording...";
    }
    return MaterialApp(
      home: Column(children: [
        Text("Padding"),
        FloatingActionButton(
            child: Text(text),
            onPressed: () {
              setState(record);
            }),
        Text(px.toStringAsPrecision(5)),
        Text(py.toStringAsPrecision(5)),
        Text(pz.toStringAsPrecision(5)),
        Text("Max Accel: ${maxa.toStringAsPrecision(3)}"),
        Text(vx.toStringAsPrecision(5)),
        Text(vy.toStringAsPrecision(5)),
        Text(vz.toStringAsPrecision(5)),
      ]),
    );
  }

  @override
  void initState() {
    super.initState();
    userAccelSubscription =
        userAccelerometerEventStream().listen((UserAccelerometerEvent event) {
      if (running && recordStart == null) {
        recordStart = event.timestamp;
        acceleration = [Vec3Time(x: 0, y: 0, z: 0, seconds: 0)];
        print("Resetting start time!");
      }

      if (recordStart case DateTime start) {
        double elapsed =
            event.timestamp.difference(start).inMicroseconds * 0.000001;
        acceleration.add(
            Vec3Time(x: event.x, y: event.y, z: event.z, seconds: elapsed));
        // print("Added $elapsed");
      }
    });
  }

  @override
  void dispose() {
    userAccelSubscription?.cancel();
    super.dispose();
  }
}
