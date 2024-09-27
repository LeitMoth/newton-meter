// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:newton_meter/ChartData.dart';
import 'package:newton_meter/dataDisplay.dart';



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

  List<DataPoint> get dataPoints{
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
 class _MyGraphPageState extends State<MyGraphPage>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Newton-Meter"),
      ),

      body: Center(
        child: SingleChildScrollView(
        child: Column(
          children: [
          LineChartWidget(dataPoints),
           const textData(),
          ],
        ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: null,
          tooltip: 'Start',
          child: const Icon(Icons.start)),

    ); // This trailing comma makes auto-formatting nicer for build methods.
    
  }
 }
