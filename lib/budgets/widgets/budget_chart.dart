import 'package:expensor/budgets/model/budget.dart';
import 'package:expensor/common/widgets/space.dart';
import 'package:expensor/widgets/budget_doughut_chart.dart';
import 'package:expensor/widgets/formatted_number.dart';
import 'package:flutter/material.dart';

class BudgetChart extends StatelessWidget {
  const BudgetChart({
    super.key,
    required Budget selectedBudget,
  }) : _selectedBudget = selectedBudget;

  final Budget _selectedBudget;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        expandedHeight: MediaQuery.of(context).size.height * 0.30,
        flexibleSpace: FlexibleSpaceBar(
          background: Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      _selectedBudget.icon,
                      size: 60,
                      color: Colors.white,
                    ),
                    const Space(spaceType: SpaceType.height),
                    FormattedNumber(
                      number: 1200,
                      style: Theme.of(context)
                          .textTheme
                          .displayLarge!
                          .copyWith(color: Colors.white),
                      numberType: NumberType.currency,
                    ),
                    Text(
                      "Left to spend",
                      style: Theme.of(context)
                          .textTheme
                          .labelMedium!
                          .copyWith(color: Colors.white),
                    ),
                  ],
                ),
                BudgetDoughutChart(budget: _selectedBudget),
              ],
            ),
          ),
        ));
  }
}
