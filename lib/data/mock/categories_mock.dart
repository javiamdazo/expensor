import 'package:expensor/provider/model/category.dart';
import 'package:flutter/material.dart';

class CategoriesMock {
  static final List<Category> categories = [
    Category(
      categoryId: 1,
      name: "Food",
      icon: Icons.fastfood,
      color: Colors.orange,
    ),
    Category(
      categoryId: 2,
      name: "Transport",
      icon: Icons.directions_bus,
      color: Colors.blue,
    ),
    Category(
      categoryId: 3,
      name: "Shopping",
      icon: Icons.shopping_cart,
      color: Colors.purple,
    ),
    Category(
      categoryId: 4,
      name: "Health",
      icon: Icons.local_hospital,
      color: Colors.red,
    ),
    Category(
      categoryId: 5,
      name: "Entertainment",
      icon: Icons.movie,
      color: Colors.green,
    ),
    Category(
      categoryId: 6,
      name: "Bills",
      icon: Icons.receipt,
      color: Colors.brown,
    ),
    Category(
      categoryId: 7,
      name: "Salary",
      icon: Icons.attach_money,
      color: Colors.teal,
    ),
    Category(
      categoryId: 8,
      name: "Education",
      icon: Icons.school,
      color: Colors.indigo,
    ),
    Category(
      categoryId: 9,
      name: "Travel",
      icon: Icons.airplanemode_active,
      color: Colors.pink,
    ),
    Category(
      categoryId: 10,
      name: "Others",
      icon: Icons.category,
      color: Colors.grey,
    ),
  ];

  /// Agrega una nueva categoría
  static void add(String name, IconData icon, Color color) {
    int newId = categories.isNotEmpty ? categories.last.categoryId + 1 : 1;
    categories.add(
      Category(
        categoryId: newId,
        name: name,
        icon: icon,
        color: color,
      ),
    );
  }

  /// Elimina una categoría por ID
  static void remove(int categoryId) {
    categories.removeWhere((category) => category.categoryId == categoryId);
  }

  /// Actualiza una categoría existente
  static void update(int categoryId, {String? name, IconData? icon, Color? color}) {
    for (var category in categories) {
      if (category.categoryId == categoryId) {
        category.name = name ?? category.name;
        category.icon = icon ?? category.icon;
        category.color = color ?? category.color;
        break;
      }
    }
  }

  /// Obtiene una categoría por ID
  static Category? getById(int categoryId) {
    return categories.firstWhere((category) => category.categoryId == categoryId, orElse: () => throw Exception());
  }

  /// Obtiene todas las categorías
  static List<Category> getAll() {
    return List.from(categories);
  }
}