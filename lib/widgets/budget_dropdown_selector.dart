import 'package:expensor/pages/budget/budget_selector.dart';
import 'package:expensor/provider/model/budget.dart';
import 'package:expensor/widgets/bottom_modal.dart';
import 'package:expensor/widgets/space.dart';
import 'package:flutter/material.dart';

class BudgetDropdownWidget extends StatelessWidget {
  final Budget selectedBudget;
  final Function onBudgetSelector;

  const BudgetDropdownWidget(
      {super.key,
      required this.selectedBudget,
      required this.onBudgetSelector});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => {
              BottomModal.showBottomModal(
                  context,
                  BudgetSelector(
                      currentBudget: selectedBudget,
                      onBudgetSelector: onBudgetSelector))
            },
        child: Row(
          children: [
            Text(
              selectedBudget.name,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const Space(
              spaceType: SpaceType.width,
            ),
            Icon(
              Icons.keyboard_arrow_down_sharp,
              color: Theme.of(context).iconTheme.color,
            )
          ],
        ));
  }
}
