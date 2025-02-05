import 'dart:math';

import 'package:expensor/model/budget.dart';
import 'package:expensor/model/category.dart';
import 'package:expensor/pages/kpis/categories/budget_provider.dart';
import 'package:expensor/widgets/doughut_chart.dart';
import 'package:expensor/widgets/formatted_number.dart';
import 'package:expensor/widgets/space.dart';
import 'package:flutter/material.dart';

class ResumeCategoriesBudget extends StatelessWidget {
  const ResumeCategoriesBudget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // Access the budget and categories from the BudgetProvider
    final Budget budget = BudgetProvider.budgetOne;

    // Convert the Map<Category, num> into a list for ListView
    final List<MapEntry<Category, num>> budgetEntries =
        budget.categoriesBudget.entries.toList();

    double height = MediaQuery.of(context).size.height * 0.20;
    double width = MediaQuery.of(context).size.width;

    return SizedBox(
      height: height,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: budgetEntries.length,
        itemBuilder: (context, index) {
          final Category category = budgetEntries[index].key;
          final num budgetAmount = budgetEntries[index].value;

          return ResumeCategoriesItem(
            width: width,
            height: height,
            category: category,
            budget: budgetAmount,
          );
        },
      ),
    );
  }
}

class ResumeCategoriesItem extends StatelessWidget {
  const ResumeCategoriesItem(
      {super.key,
      required this.category,
      required this.height,
      required this.width,
      required this.budget});

  final Category category;
  final num budget;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: width * 0.02),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              CircleAvatar(
                backgroundColor: category.color,
                radius: height * 0.15,
                child: Icon(category.icon, size: height * 0.15, color: Theme.of(context).iconTheme.color,)
              ),
              SizedBox(
                width: width * 0.30,
                height: height * 0.6,
                child: DoughutChart(
                    categoryColor: category.color,
                    budget: budget,
                    spent: budget / Random().nextDouble()),
              )
            ],
          ),
          Space(),
          FormattedNumber(
              number: 15,
              style: Theme.of(context).textTheme.labelLarge,
              numberType: NumberType.currency),
          Text(
            category.name,
            style: Theme.of(context)
                .textTheme
                .labelMedium!
                .copyWith(color: Colors.grey[400]),
          )
        ],
      ),
    );
  }
}
