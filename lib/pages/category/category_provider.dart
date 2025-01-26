import 'package:expensor/model/category.dart';
import 'package:expensor/utils/ux_colors.dart';
import 'package:flutter/material.dart';

class CategoryProvider {
  // List of categories using the Category object
  static List<Category> categories = [
    Category(name: 'Salario', icon: Icons.work, color: UxColors.alizarin.value),
    Category(name: 'Comida', icon: Icons.fastfood, color: UxColors.amethyst.value),
    Category(name: 'Servicios', icon: Icons.lightbulb, color: UxColors.carrot.value),
    Category(name: 'Freelance', icon: Icons.person, color: UxColors.greenSea.value),
    Category(name: 'Venta', icon: Icons.shopping_cart, color: UxColors.alizarin.value),
    Category(name: 'Venta', icon: Icons.shopping_cart, color: UxColors.asbestos.value),
    Category(name: 'Venta', icon: Icons.shopping_cart, color: UxColors.alizarin.value),
    Category(name: 'Venta', icon: Icons.shopping_cart, color: UxColors.concrete.value),
    Category(name: 'Venta', icon: Icons.shopping_cart, color: UxColors.alizarin.value),
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
