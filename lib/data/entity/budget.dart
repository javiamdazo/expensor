import 'package:expensor/data/entity/category_entity.dart';

class Budget {
  Map<CategoryEntity, num> categoriesBudget;

  Budget({required this.categoriesBudget});
}