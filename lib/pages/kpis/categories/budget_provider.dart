import 'package:expensor/budgets/entity/budget_entity.dart';
import 'package:expensor/data/entity/category_entity.dart';
import 'package:expensor/pages/category/category_provider.dart';

class BudgetProvider {
  static final CategoryEntity food = CategoryProvider.getCategories()[0];
  static final CategoryEntity transportation =
      CategoryProvider.getCategories()[1];
  static final CategoryEntity entertainment =
      CategoryProvider.getCategories()[2];
  static final CategoryEntity shopping = CategoryProvider.getCategories()[3];
  static final CategoryEntity utilities = CategoryProvider.getCategories()[4];

  static final BudgetEntity budgetOne = BudgetEntity(
    categoriesBudget: {
      food: 300,
      transportation: 150,
      entertainment: 100,
      shopping: 200,
      utilities: 250,
    },
  );
}
