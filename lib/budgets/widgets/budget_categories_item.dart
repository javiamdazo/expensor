import 'package:expensor/budgets/model/category_budget.dart';
import 'package:expensor/budgets/model/enum/category_budget_type.dart';
import 'package:expensor/budgets/widgets/budget_list_categories.dart';
import 'package:expensor/budgets/widgets/budget_title.dart';
import 'package:flutter/material.dart';

class BudgetCategoriesItem extends StatelessWidget {
  const BudgetCategoriesItem({
    super.key,
    required this.entry,
    required this.categories,
  });

  final CategoryBudgetType entry;
  final List<CategoryBudget> categories;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      color: Theme.of(context).colorScheme.secondary,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BudgetTitle(
              categoryBudgetType: entry,
            ),
            const Divider(
              color: Colors.white,
              thickness: 0.2,
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: categories.length,
              itemBuilder: (context, catIndex) {
                final CategoryBudget category = categories[catIndex];

                final double budget = category.budget;
                final double spent = category.spent;

                return BudgetListCategories(
                    category: category, budget: budget, spent: spent);
              },
            ),
          ],
        ),
      ),
    );
  }
}
