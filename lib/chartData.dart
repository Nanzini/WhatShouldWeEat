import 'package:flutter/material.dart';

class ChartData {
  ChartData(this.x, this.y, [this.color]);
  final String x;
  final double y;
  final Color color;
}

final List<ChartData> chartData = [
  ChartData('까사아', 5),
  ChartData('킹콩부대찌개', 5),
  ChartData('밥도둑', 5),
  ChartData('고릴라김밥', 5),
  ChartData('소담', 5),
];
