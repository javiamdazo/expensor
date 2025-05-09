import 'package:expensor/data/entity/category_entity.dart';

class BudgetEntity {
  Map<CategoryEntity, num> categoriesBudget;

  BudgetEntity({required this.categoriesBudget});
}
