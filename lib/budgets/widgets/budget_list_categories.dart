import 'package:expensor/budgets/model/category_budget.dart';
import 'package:expensor/common/widgets/space.dart';
import 'package:expensor/widgets/formatted_number.dart';
import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class BudgetListCategories extends StatelessWidget {
  const BudgetListCategories({
    super.key,
    required this.category,
    required this.budget,
    required this.spent,
  });

  final CategoryBudget category;
  final double budget;
  final double spent;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 20,
                backgroundColor: category.category.color.withAlpha(150),
                child: Icon(
                  category.category.icon,
                  color: Theme.of(context).iconTheme.color,
                ),
              ),
              const Space(
                spaceType: SpaceType.width,
                spaceSize: SpaceSize.double,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      category.category.name,
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium!
                          .copyWith(color: Colors.white),
                    ),
                    Text(
                      'View details',
                      style: Theme.of(context)
                          .textTheme
                          .displaySmall!
                          .copyWith(color: Colors.grey[300]),
                    )
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: category.category.color.withAlpha(100),
                  borderRadius: BorderRadius.circular(6),
                ),
                alignment: Alignment.center,
                child: const Padding(
                  padding: EdgeInsets.all(8),
                  child: Icon(Icons.add, size: 25),
                ),
              ),
            ],
          ),
          const Space(
            spaceSize: SpaceSize.double,
          ),
          StepProgressIndicator(
            totalSteps: budget.toInt(),
            currentStep: spent.toInt(),
            selectedColor: category.category.color,
            size: 8,
            padding: 0,
            unselectedColor: category.category.color.withAlpha(70),
            roundedEdges: const Radius.circular(10),
          ),
          const Space(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FormattedNumber(
                  number: spent,
                  style: Theme.of(context).textTheme.displayMedium!.copyWith(
                      color: Colors.white, fontWeight: FontWeight.w600),
                  numberType: NumberType.currency),
              FormattedNumber(
                  number: budget,
                  style: Theme.of(context)
                      .textTheme
                      .displayMedium!
                      .copyWith(color: Colors.white),
                  numberType: NumberType.currency)
            ],
          )
        ],
      ),
    );
  }
}
