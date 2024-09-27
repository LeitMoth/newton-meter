import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class DataPoint {
  final double x;
  final double y;
  DataPoint({required this.x, required this.y});
}

class LineChartWidget extends StatelessWidget {
  final List<DataPoint> data;

  const LineChartWidget(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2,
      child: LineChart(LineChartData(
      titlesData: const FlTitlesData(leftTitles: AxisTitles(axisNameWidget: Text("Velocity (m/s)")),
      bottomTitles: AxisTitles(axisNameWidget: Text("Samples (at 50hz)")),
      ),
      lineBarsData: [
        LineChartBarData(
            spots: data.map((data) => FlSpot(data.x, data.y)).toList(),
            isCurved: false,
            dotData: const FlDotData(show: true))
      ])),
    );
  }
}
