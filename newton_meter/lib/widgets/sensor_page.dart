import 'dart:async';
import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';

class SensorTestPage extends StatefulWidget {
  const SensorTestPage({super.key});

  @override
  State<SensorTestPage> createState() => _SensorTestPageState();
}

class _SensorTestPageState extends State<SensorTestPage> {
  StreamSubscription<UserAccelerometerEvent>? userAccelSubscription;

  DateTime? lastTime;
  double x = 0, y = 0, z = 0;
  List<UserAccelerometerEvent> data = [];

  // bool shouldStart = false;
  bool running = false;
  // DateTime? recordStart;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Column(children: [
        FloatingActionButton(
            child: const Text("hi"),
            onPressed: () {
              setState(() {
                print("Button ${running}!");
                if (!running) {
                  print("Starting!");
                  running = true;
                  x = 0;
                  y = 0;
                  z = 0;
                }
                else {
                  print("Stopping!");
                  running = false;
                  lastTime = null;
                  print("$x, $y, $z");
                }
              });
            })
      ]),
    );
  }

  @override
  void initState() {
    super.initState();
    userAccelSubscription =
        userAccelerometerEventStream().listen((UserAccelerometerEvent event) {
      if (running && lastTime == null) {
        // recordStart = event.timestamp;
        lastTime = event.timestamp;
      }

      // if (recordStart case DateTime start) {
      //   data.add(event);
      // }

      // https://dart.dev/language/patterns
      if (lastTime case DateTime last) {
        var dt = event.timestamp.difference(last).inMicroseconds * 0.000001;
        x += 0.5 * event.x * event.x * dt;
        y += 0.5 * event.y * event.y * dt;
        z += 0.5 * event.z * event.z * dt;

        // print(x);
      }
    });
  }

  @override
  void dispose() {
    userAccelSubscription?.cancel();
    super.dispose();
  }
}
