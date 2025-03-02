import 'package:expensor/budgets/model/budget.dart';
import 'package:flutter/material.dart';

class BudgetSelectorItem extends StatelessWidget {
  final GestureTapCallback onTap;
  final Budget budget;
  final bool isCurrent;

  const BudgetSelectorItem({
    super.key,
    required this.onTap,
    required this.budget,
    required this.isCurrent,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.1,
        child: Center(
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: ListTile(
                onTap: onTap,
                leading: Icon(
                  budget.icon,
                  size: 30,
                ),
                title: Text(
                  budget.name,
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                subtitle: isCurrent
                    ? Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(budget.budgetType.toUpperCase(),
                              style: Theme.of(context).textTheme.displaySmall),
                          Text(
                            "CURRENT BUDGET",
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall!
                                .copyWith(
                                  color: Theme.of(context).colorScheme.primary,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ],
                      )
                    : Text(
                        budget.budgetType.toUpperCase(),
                      ),
                trailing: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.settings),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
