import 'package:expensor/data/entity/category_entity.dart';
import 'package:expensor/services/database_service.dart';
import 'package:flutter/material.dart';

class CategoriesRepository {
  static final CategoriesRepository instance = CategoriesRepository._constructor();
  CategoriesRepository._constructor();

  static const _tableName = 'categories';

  Future<List<CategoryEntity>> list() async {
    final db = await DatabaseService.instance.getDatabase();
    final categories = await db.query(_tableName);
    return categories.map((category) => CategoryEntity.fromMap(category)).toList();
  }

  void add(String name, IconData icon, Color color) async {
    final db = await DatabaseService.instance.getDatabase();
    db.insert(_tableName, {
      'name': name,
      'icon': icon.codePoint.toString(),
      'color': color.value
    });
  }

  void delete(int categoryId) async {
    final db = await DatabaseService.instance.getDatabase();
    db.delete(_tableName, where: 'category_id = ?', whereArgs: [categoryId]);
  }

  void update(int categoryId, String name, IconData icon, Color color) async {
    final db = await DatabaseService.instance.getDatabase();
    db.update(_tableName, {
      'name': name,
      'icon': icon.codePoint.toString(),
      'color': color.value
    }, where: 'category_id = ?', whereArgs: [categoryId]);
  }

  Future<CategoryEntity?> get(int categoryId) async {
    final db = await DatabaseService.instance.getDatabase();
    final categories = await db.query(_tableName, where: 'category_id = ?', whereArgs: [categoryId]);
    if (categories.isEmpty) {
      return null;
    }
    return CategoryEntity.fromMap(categories.first);
  }
}