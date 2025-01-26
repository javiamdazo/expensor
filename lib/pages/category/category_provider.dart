import 'package:expensor/model/category.dart';
import 'package:flutter/material.dart';

class CategoryProvider {
  // List of categories using the Category object
  static List<Category> categories = [
    Category(name: 'Salario', icon: Icons.work, color: Colors.green),
    Category(name: 'Comida', icon: Icons.fastfood, color: Colors.red),
    Category(name: 'Servicios', icon: Icons.lightbulb, color: Colors.blue),
    Category(name: 'Freelance', icon: Icons.person, color: Colors.purple),
    Category(name: 'Venta', icon: Icons.shopping_cart, color: Colors.orange),
    Category(name: 'Venta', icon: Icons.shopping_cart, color: Colors.orange),
    Category(name: 'Venta', icon: Icons.shopping_cart, color: Colors.orange),
    Category(name: 'Venta', icon: Icons.shopping_cart, color: Colors.orange),
    Category(name: 'Venta', icon: Icons.shopping_cart, color: Colors.orange),
  ];

  // Method to get all categories
  static List<Category> getCategories() {
    return categories;
  }

  // Method to add a new category
  static void addCategory(Category category) {
    categories.add(category);
  }

  // Method to remove a category by index
  static void removeCategory(int index) {
    categories.removeAt(index);
  }

  // Method to update an existing category
  static void updateCategory(int index, Category updatedCategory) {
    categories[index] = updatedCategory;
  }
}
