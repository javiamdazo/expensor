// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:expensor/budgets/model/category_budget.dart';
import 'package:expensor/budgets/model/enum/category_budget_type.dart';

class Budget {
  String name;
  String budgetType;
  IconData icon;
  Color color;
  Map<CategoryBudgetType, List<CategoryBudget>> budgets;

  Budget({
    required this.name,
    required this.budgetType,
    required this.icon,
    required this.color,
    required this.budgets,
  });

  Budget copyWith({
    String? name,
    String? budgetType,
    IconData? icon,
    Color? color,
    Map<CategoryBudgetType, List<CategoryBudget>>? budgets,
  }) {
    return Budget(
      name: name ?? this.name,
      budgetType: budgetType ?? this.budgetType,
      icon: icon ?? this.icon,
      color: color ?? this.color,
      budgets: budgets ?? this.budgets,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'budgetType': budgetType,
      'icon': icon.codePoint,
      'color': color.value,
      'budgets': budgets,
    };
  }

  factory Budget.fromMap(Map<String, dynamic> map) {
    return Budget(
        name: map['name'] as String,
        budgetType: map['budgetType'] as String,
        icon: IconData(map['icon'] as int, fontFamily: 'MaterialIcons'),
        color: Color(map['color'] as int),
        budgets: Map<CategoryBudgetType, List<CategoryBudget>>.from(
          (map['budgets'] as Map<CategoryBudgetType, List<CategoryBudget>>),
        ));
  }

  String toJson() => json.encode(toMap());

  factory Budget.fromJson(String source) =>
      Budget.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Budget(name: $name, budgetType: $budgetType, icon: $icon, color: $color, budgets: $budgets)';
  }

  @override
  bool operator ==(covariant Budget other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.budgetType == budgetType &&
        other.icon == icon &&
        other.color == color &&
        mapEquals(other.budgets, budgets);
  }

  @override
  int get hashCode {
    return name.hashCode ^
        budgetType.hashCode ^
        icon.hashCode ^
        color.hashCode ^
        budgets.hashCode;
  }
}
