import 'package:expensor/data/entity/category_entity.dart';
import 'package:expensor/utils/ux_colors.dart';
import 'package:flutter/material.dart';

class CategoryProvider {
  // List of categories using the Category object
  static List<CategoryEntity> categories = [
    CategoryEntity(name: 'Salario', icon: Icons.work, color: UxColors.alizarin.value),
    CategoryEntity(name: 'Comida', icon: Icons.fastfood, color: UxColors.amethyst.value),
    CategoryEntity(name: 'Servicios', icon: Icons.lightbulb, color: UxColors.carrot.value),
    CategoryEntity(name: 'Freelance', icon: Icons.person, color: UxColors.greenSea.value),
    CategoryEntity(name: 'Venta', icon: Icons.shopping_cart, color: UxColors.alizarin.value),
    CategoryEntity(name: 'Venta', icon: Icons.shopping_cart, color: UxColors.asbestos.value),
    CategoryEntity(name: 'Venta', icon: Icons.shopping_cart, color: UxColors.alizarin.value),
    CategoryEntity(name: 'Venta', icon: Icons.shopping_cart, color: UxColors.concrete.value),
    CategoryEntity(name: 'Venta', icon: Icons.shopping_cart, color: UxColors.alizarin.value),
  ];

  // Method to get all categories
  static List<CategoryEntity> getCategories() {
    return categories;
  }

  // Method to add a new category
  static void addCategory(CategoryEntity category) {
    categories.add(category);
  }

  // Method to remove a category by index
  static void removeCategory(int index) {
    categories.removeAt(index);
  }

  // Method to update an existing category
  static void updateCategory(int index, CategoryEntity updatedCategory) {
    categories[index] = updatedCategory;
  }
}
