import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/src/chart/line_chart/line_chart.dart';

class _MyHomePageState extends State<MyHomePage> {
  void _start(){

  }


  widget build(BuildContext){
    return Scaffold
    appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Newton-Meter'),
      ),
      body: Center(
      
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _start,
        tooltip: 'Start',
        child: const Icon(Icons.start),
      ),
  }
}
  

classLineChartWidgent extends StatelessWidget {
  final List<Color> gradientColors = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a),
  ];

  @override
  Widget build(BuildContext context) => LineChart(
    LineChartData(
      minX: 0,
      minX: 11,
    )
  );
}
