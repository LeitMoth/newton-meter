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

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }

  @override
  void initState() {
    super.initState();
    userAccelSubscription =
        userAccelerometerEventStream().listen((UserAccelerometerEvent event) {
      print(event);
    });
  }

  @override
  void dispose() {
    userAccelSubscription?.cancel();
    super.dispose();
  }
}
