import 'package:expensor/data/mock/categories_mock.dart';
import 'package:expensor/provider/model/budget.dart';
import 'package:expensor/provider/model/budget_type.dart';
import 'package:expensor/provider/model/category_budget.dart';
import 'package:expensor/provider/model/category_budget_type.dart';
import 'package:flutter/material.dart';

class BudgetMock {
  static List<Budget> get budgets => [
        Budget(
          name: "Monthly Budget",
          budgetType: BudgetType.personal.name,
          icon: Icons.person,
          color: Colors.blue, // Added color
          budgets: {
            CategoryBudgetType.lifestyle: [
              CategoryBudget(
                  category: CategoriesMock.categories[1],
                  budget: 500.0,
                  spent: 234.0),
              CategoryBudget(
                  category: CategoriesMock.categories[3],
                  budget: 957.0,
                  spent: 33.0),
              CategoryBudget(
                  category: CategoriesMock.categories[6],
                  budget: 567.0,
                  spent: 200.0),
              CategoryBudget(
                  category: CategoriesMock.categories[2],
                  budget: 899.0,
                  spent: 554.0)
            ],
            CategoryBudgetType.housing: [
              CategoryBudget(
                  category: CategoriesMock.categories[2],
                  budget: 1200.0,
                  spent: 800.0)
            ],
            CategoryBudgetType.investment: [
              CategoryBudget(
                  category: CategoriesMock.categories[3],
                  budget: 300.0,
                  spent: 50.0)
            ],
            CategoryBudgetType.transportation: [
              CategoryBudget(
                  category: CategoriesMock.categories[0],
                  budget: 150.0,
                  spent: 100.0)
            ],
            CategoryBudgetType.groceries: [
              CategoryBudget(
                  category: CategoriesMock.categories[4],
                  budget: 400.0,
                  spent: 250.0)
            ],
          },
        ),
        Budget(
          name: "Company Budget",
          budgetType: BudgetType.business.name,
          icon: Icons.business_center,
          color: Colors.green, // Added color
          budgets: {
            CategoryBudgetType.lifestyle: [
              CategoryBudget(
                  category: CategoriesMock.categories[1],
                  budget: 2000.0,
                  spent: 500.0)
            ],
            CategoryBudgetType.housing: [
              CategoryBudget(
                  category: CategoriesMock.categories[2],
                  budget: 5000.0,
                  spent: 2500.0)
            ],
            CategoryBudgetType.investment: [
              CategoryBudget(
                  category: CategoriesMock.categories[3],
                  budget: 10000.0,
                  spent: 4000.0)
            ],
            CategoryBudgetType.transportation: [
              CategoryBudget(
                  category: CategoriesMock.categories[0],
                  budget: 800.0,
                  spent: 300.0)
            ],
            CategoryBudgetType.groceries: [
              CategoryBudget(
                  category: CategoriesMock.categories[4],
                  budget: 2500.0,
                  spent: 1200.0)
            ],
            CategoryBudgetType.healthcare: [
              CategoryBudget(
                  category: CategoriesMock.categories[5],
                  budget: 3000.0,
                  spent: 1800.0)
            ],
            CategoryBudgetType.entertainment: [
              CategoryBudget(
                  category: CategoriesMock.categories[6],
                  budget: 1500.0,
                  spent: 700.0)
            ],
            CategoryBudgetType.education: [
              CategoryBudget(
                  category: CategoriesMock.categories[7],
                  budget: 4000.0,
                  spent: 2500.0)
            ],
            CategoryBudgetType.savings: [
              CategoryBudget(
                  category: CategoriesMock.categories[8],
                  budget: 5000.0,
                  spent: 2000.0)
            ],
            CategoryBudgetType.others: [
              CategoryBudget(
                  category: CategoriesMock.categories[9],
                  budget: 1000.0,
                  spent: 300.0),
            ]
          },
        ),
      ];
}
