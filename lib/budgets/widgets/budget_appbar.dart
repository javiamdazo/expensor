import 'package:expensor/budgets/model/budget.dart';
import 'package:expensor/widgets/budget_dropdown_selector.dart';
import 'package:flutter/material.dart';

class BudgetAppbar extends StatelessWidget implements PreferredSizeWidget {
  final Budget budget;
  final Function onSelectedBudget;
  const BudgetAppbar(
      {super.key, required this.budget, required this.onSelectedBudget});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: 0,
      backgroundColor: Theme.of(context).colorScheme.primary,
      leading: IconButton(
        onPressed: () {},
        icon: Icon(
          Icons.settings,
          color: Theme.of(context).iconTheme.color,
        ),
      ),
      title: BudgetDropdownWidget(
        selectedBudget: budget,
        onBudgetSelector: onSelectedBudget,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
