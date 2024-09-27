import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';


class DataPoint {
  final double x;
  final double y; 
  DataPoint({required this.x, required this.y});
}

List<DataPoint> get dataPoints{
  final data = <double>[2,3,6,11,3,6,4];
  return data
    .mapIndexed(
      ((index, element) => DataPoint(x: index.toDouble(), y: element)))
    .toList();
}

class LineChartWidget extends StatelessWidget {
  final List<DataPoint> data;

  const LineChartWidget(this.data, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2,
    child: LineChart(LineChartData(lineBarsData: [
      LineChartBarData(
      spots: data.map((data) => FlSpot(data.x, data.y)).toList(),
      isCurved: false,
      dotData: FlDotData(show: true))
      ])),
    );
  }
}
