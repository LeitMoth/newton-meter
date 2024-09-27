import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';

class SensorTestPage extends StatefulWidget {
  const SensorTestPage({super.key});

  @override
  State<SensorTestPage> createState() => _SensorTestPageState();
}

class Vec3Time {
  Vec3Time(
      {required this.x,
      required this.y,
      required this.z,
      required this.seconds});
  double x = 0, y = 0, z = 0, seconds = 0;
}

/*
For the first Vec3Time, its time component is discarded,
and its values are used as the initial condition.
For our purposes, we always want the first Vec3Time
to be the zero vector
*/
List<Vec3Time> integrate(List<Vec3Time> vs) {
  List<Vec3Time> integrated = List.of(vs);

  for (int i = 1; i < vs.length; ++i) {
    var dt = vs[i].seconds - vs[i - 1].seconds;
    integrated[i].x = integrated[i - 1].x + integrated[i].x * dt;
    integrated[i].y = integrated[i - 1].y + integrated[i].y * dt;
    integrated[i].z = integrated[i - 1].z + integrated[i].z * dt;
  }

  return integrated;
}

List<double> scalarize(List<Vec3Time> vs) {
  return vs.map((e) => sqrt(e.x * e.x + e.y * e.y + e.z * e.z)).toList();
}

class _SensorTestPageState extends State<SensorTestPage> {
  StreamSubscription<UserAccelerometerEvent>? userAccelSubscription;

  bool thing = false;
  // DateTime? lastTime;
  List<Vec3Time> acceleration = [];

  double px = 0, py = 0, pz = 0;

  double maxa = 0;

  // bool shouldStart = false;
  bool running = false;
  DateTime? recordStart;

  void record() {
    if (!running) {
      running = true;
      recordStart = null;
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
    }

    acceleration.clear();
    velocity.clear();
    position.clear();
    s_velocity.clear();
    s_position.clear();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Column(children: [
        FloatingActionButton(
            child: const Text("hi"),
            onPressed: () {
              setState(record);
            }),
        Text(px.toStringAsPrecision(5)),
        Text(py.toStringAsPrecision(5)),
        Text(pz.toStringAsPrecision(5)),
        Text("Max Accel: ${maxa.toStringAsPrecision(3)}"),
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
