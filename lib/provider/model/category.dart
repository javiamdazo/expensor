import 'package:expensor/data/entity/category_entity.dart';
import 'package:flutter/material.dart';

class Category {
  int categoryId;
  String name;
  IconData icon;
  Color color;

  Category({
    required this.categoryId,
    required this.name,
    required this.icon,
    required this.color,
  });

  factory Category.fromMap(CategoryEntity category) {
    return Category(
      categoryId: category.categoryId!,
      name: category.name,
      icon: category.icon,
      color: category.color,
    );
  }
}
