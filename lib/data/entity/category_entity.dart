import 'package:flutter/material.dart';

class CategoryEntity {
  int? categoryId;
  String name;
  IconData icon;
  Color color;

  CategoryEntity({
    this.categoryId,
    required this.name,
    required this.icon,
    required this.color,
  });

  factory CategoryEntity.fromMap(Map<String, dynamic> map) {
    return CategoryEntity(
      categoryId: map['category_id'],
      name: map['name'],
      icon: IconData(
        int.parse(map['icon']),
        fontFamily: 'MaterialIcons',
      ),
      color: Color(map['color']),
    );
  }
}
