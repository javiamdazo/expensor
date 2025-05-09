// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';

class CategoryChartData {
  String label;
  final String? xData;
  final num yData;
  Color? color;

  CategoryChartData({
    required this.label,
    this.xData,
    required this.yData,
    this.color,
  });

  CategoryChartData copyWith({
    String? label,
    String? xData,
    num? yData,
    Color? color,
  }) {
    return CategoryChartData(
      label: label ?? this.label,
      xData: xData ?? this.xData,
      yData: yData ?? this.yData,
      color: color ?? this.color,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'label': label,
      'xData': xData,
      'yData': yData,
      'color': color?.value,
    };
  }

  factory CategoryChartData.fromMap(Map<String, dynamic> map) {
    return CategoryChartData(
      label: map['label'] as String,
      xData: map['xData'] != null ? map['xData'] as String : null,
      yData: map['yData'] as num,
      color: map['color'] != null ? Color(map['color'] as int) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoryChartData.fromJson(String source) =>
      CategoryChartData.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CategoryChartData(label: $label, xData: $xData, yData: $yData, color: $color)';
  }

  @override
  bool operator ==(covariant CategoryChartData other) {
    if (identical(this, other)) return true;

    return other.label == label &&
        other.xData == xData &&
        other.yData == yData &&
        other.color == color;
  }

  @override
  int get hashCode {
    return label.hashCode ^ xData.hashCode ^ yData.hashCode ^ color.hashCode;
  }
}
