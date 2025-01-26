import 'package:expensor/model/budget.dart';
import 'package:expensor/model/category.dart';
import 'package:expensor/pages/category/category_provider.dart';

class BudgetProvider {
  
  static final Category food = CategoryProvider.getCategories()[0];
  static final Category transportation = CategoryProvider.getCategories()[1];
  static final Category entertainment = CategoryProvider.getCategories()[2];
  static final Category shopping = CategoryProvider.getCategories()[3];
  static final Category utilities = CategoryProvider.getCategories()[4];

  static final Budget budgetOne = Budget(
    categoriesBudget: {
      food: 300,             
      transportation: 150,   
      entertainment: 100,    
      shopping: 200,         
      utilities: 250,        
    },
  );
}