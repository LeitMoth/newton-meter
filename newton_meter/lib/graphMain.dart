import 'dart:async';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:newton_meter/ChartData.dart';
import 'package:newton_meter/dataDisplay.dart';
import 'package:newton_meter/math/results.dart';

import 'package:sensors_plus/sensors_plus.dart';
import 'package:newton_meter/math/accel_math.dart';

class MyGraph extends StatelessWidget {
  const MyGraph({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Newton Meter',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyGraphPage(title: 'Newton Meter Home Page'),
    );
  }
}

class MyGraphPage extends StatefulWidget {
  const MyGraphPage({super.key, required this.title});

  List<DataPoint> get dataPoints {
    final data = <double>[];
    return data
        .mapIndexed(
            ((index, element) => DataPoint(x: index.toDouble(), y: element)))
        .toList();
  }

  final String title;

  @override
  State<MyGraphPage> createState() => _MyGraphPageState();
}

class _MyGraphPageState extends State<MyGraphPage> {
  StreamSubscription<UserAccelerometerEvent>? userAccelSubscription;
  List<Vec3Time> acceleration = [];
  bool recording = false;
  DateTime? recordStart;
  NewtonResults? recordResults;

  void record() {
    if (!recording) {
      recording = true;
      recordStart = null;
    } else {
      recording = false;
      recordResults = NewtonResults.build(acceleration);
      print(acceleration.last.x);
    }
  }

  @override
  void initState() {
    super.initState();
    userAccelSubscription = userAccelerometerEventStream(
            samplingPeriod: const Duration(milliseconds: 20))
        .listen((UserAccelerometerEvent event) {
      if (recording && recordStart == null) {
        recordStart = event.timestamp;
        acceleration = [Vec3Time(x: 0, y: 0, z: 0, seconds: 0)];
      }

      if (recordStart case DateTime start) {
        double elapsed =
            event.timestamp.difference(start).inMicroseconds * 0.000001;
        acceleration.add(
            Vec3Time(x: event.x, y: event.y, z: event.z, seconds: elapsed));
      }
    });
  }

  @override
  void dispose() {
    userAccelSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Newton-Meter"),
      ),
      body: Center(
        child: Column(
          children: [
            const LineChartWidget(<DataPoint>[]),
            const textData(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: record, tooltip: 'Start', child: const Icon(Icons.stop_circle)),
    ); // This trailing comma makes auto-formatting nicer for build methods.
  }
}
