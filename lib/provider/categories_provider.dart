import 'package:expensor/data/entity/category_entity.dart';
import 'package:expensor/data/repositories/categories_repository.dart';
import 'package:expensor/provider/model/category.dart';
import 'package:flutter/material.dart';

class CategoriesProvider extends ChangeNotifier {
  final CategoriesRepository _categoriesRepository =
      CategoriesRepository.instance;
  List<Category> _categories = [];

  CategoriesProvider() {
    loadCategories();
  }

  List<Category> get categoriesList => _categories;

  Future<void> loadCategories() async {
    final categories = await _categoriesRepository.list();

    _categories = [];
    categories.forEach((account) {
      _categories.add(Category.fromMap(account));
    });

    notifyListeners();
  }

  void add(String name, IconData icon, Color color) {
    _categoriesRepository.add(name, icon, color);
    loadCategories();
  }

  void delete(int categoryId) {
    _categoriesRepository.delete(categoryId);
    loadCategories();
  }

  void update(int categoryId, String name, IconData icon, Color color) {
    _categoriesRepository.update(categoryId, name, icon, color);
    loadCategories();
  }

  Future<Category> read(int categoryId) async {
    CategoryEntity? category = await _categoriesRepository.get(categoryId);
    if(category == null){
      throw Exception();
    }

    return Category.fromMap(category);
  }
}
