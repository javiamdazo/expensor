// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'package:expensor/provider/model/category.dart';

class CategoryBudget {
  final Category category;
  final double budget;
  final double spent;
  CategoryBudget({
    required this.category,
    required this.budget,
    required this.spent,
  });

  CategoryBudget copyWith({
    Category? category,
    double? budget,
    double? spent,
  }) {
    return CategoryBudget(
      category: category ?? this.category,
      budget: budget ?? this.budget,
      spent: spent ?? this.spent,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'category': category.toMap(),
      'budget': budget,
      'spent': spent,
    };
  }

  factory CategoryBudget.fromMap(Map<String, dynamic> map) {
    return CategoryBudget(
      category: Category.fromMap(map['category'] as Map<String, dynamic>),
      budget: map['budget'] as double,
      spent: map['spent'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoryBudget.fromJson(String source) =>
      CategoryBudget.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'CategoryBudget(category: $category, budget: $budget, spent: $spent)';

  @override
  bool operator ==(covariant CategoryBudget other) {
    if (identical(this, other)) return true;

    return other.category == category &&
        other.budget == budget &&
        other.spent == spent;
  }

  @override
  int get hashCode => category.hashCode ^ budget.hashCode ^ spent.hashCode;
}
