import 'package:expensor/budgets/mock/budget_mock.dart';
import 'package:expensor/budgets/model/budget.dart';
import 'package:expensor/budgets/model/category_budget.dart';
import 'package:expensor/budgets/model/enum/category_budget_type.dart';
import 'package:expensor/budgets/widgets/budget_appbar.dart';
import 'package:expensor/budgets/widgets/budget_categories_item.dart';
import 'package:expensor/budgets/widgets/budget_chart.dart';
import 'package:expensor/budgets/widgets/budget_persistent_appbar.dart';
import 'package:flutter/material.dart';

class BudgetPage extends StatefulWidget {
  const BudgetPage({super.key});

  @override
  State<BudgetPage> createState() => _BudgetPageState();
}

class _BudgetPageState extends State<BudgetPage> {
  Budget _selectedBudget = BudgetMock.budgets[0];

  void onBudgetSelector(final Budget newBudget) {
    setState(() {
      _selectedBudget = newBudget;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BudgetAppbar(
          budget: _selectedBudget, onSelectedBudget: onBudgetSelector),
      body: CustomScrollView(
        slivers: [
          BudgetChart(selectedBudget: _selectedBudget),
          const BudgetPersistentAppBar(),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                childCount: _selectedBudget.budgets.length, (context, index) {
              final CategoryBudgetType entry =
                  _selectedBudget.budgets.keys.elementAt(index);
              final List<CategoryBudget> categories =
                  _selectedBudget.budgets[entry]!;

              return BudgetCategoriesItem(entry: entry, categories: categories);
            }),
          ),
        ],
      ),
    );
  }
}
