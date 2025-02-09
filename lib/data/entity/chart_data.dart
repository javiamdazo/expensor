import 'package:flutter/material.dart';

class ChartData {
  ChartData(this.label, this.yData, [this.color, this.xData]);

  String label;
  final String? xData;
  final num yData;
  Color? color;
}
