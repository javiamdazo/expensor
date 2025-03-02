import 'package:expensor/budgets/model/enum/category_budget_type.dart';
import 'package:expensor/common/widgets/space.dart';
import 'package:expensor/widgets/formatted_number.dart';
import 'package:flutter/material.dart';

class BudgetTitle extends StatelessWidget {
  final CategoryBudgetType categoryBudgetType;
  const BudgetTitle({super.key, required this.categoryBudgetType});

  String capitalizeFirstLetter(String text) {
    if (text.isEmpty) return text;
    return text[0].toUpperCase() + text.substring(1).toLowerCase();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            capitalizeFirstLetter(categoryBudgetType.name.toString()),
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        FormattedNumber(
          number: 200,
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
                color: Colors.white,
              ),
          numberType: NumberType.currency,
        ),
        const Space(
          spaceType: SpaceType.width,
        ),
        Text(
          "/",
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
                color: Colors.white,
              ),
        ),
        const Space(
          spaceType: SpaceType.width,
          spaceSize: SpaceSize.double,
        ),
        FormattedNumber(
          number: 2345,
          style: Theme.of(context).textTheme.displaySmall!.copyWith(
                color: Colors.white,
              ),
          numberType: NumberType.currency,
        ),
      ],
    );
  }
}
