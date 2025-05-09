import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:expensor/provider/model/category.dart';

class BudgetChartData {
  Category category;
  final String? xData;
  final num yData;
  Color? color;

  BudgetChartData({
    required this.category,
    this.xData,
    required this.yData,
    this.color,
  });

  BudgetChartData copyWith({
    Category? category,
    String? xData,
    num? yData,
    Color? color,
  }) {
    return BudgetChartData(
      category: category ?? this.category,
      xData: xData ?? this.xData,
      yData: yData ?? this.yData,
      color: color ?? this.color,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'category': category.toMap(),
      'xData': xData,
      'yData': yData,
      'color': color?.value,
    };
  }

  factory BudgetChartData.fromMap(Map<String, dynamic> map) {
    return BudgetChartData(
      category: Category.fromMap(map['category'] as Map<String, dynamic>),
      xData: map['xData'] != null ? map['xData'] as String : null,
      yData: map['yData'] as num,
      color: map['color'] != null ? Color(map['color'] as int) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory BudgetChartData.fromJson(String source) =>
      BudgetChartData.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ChartData(category: $category, xData: $xData, yData: $yData, color: $color)';
  }

  @override
  bool operator ==(covariant BudgetChartData other) {
    if (identical(this, other)) return true;

    return other.category == category &&
        other.xData == xData &&
        other.yData == yData &&
        other.color == color;
  }

  @override
  int get hashCode {
    return category.hashCode ^ xData.hashCode ^ yData.hashCode ^ color.hashCode;
  }
}
