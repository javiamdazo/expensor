import 'package:expensor/data/mock/budget_mock.dart';
import 'package:expensor/pages/budget/budget_selector_item.dart';
import 'package:expensor/provider/model/budget.dart';
import 'package:expensor/widgets/space.dart';
import 'package:flutter/material.dart';

class BudgetSelector extends StatefulWidget {
  final Budget currentBudget;
  final Function onBudgetSelector;

  const BudgetSelector(
      {super.key, required this.currentBudget, required this.onBudgetSelector});

  @override
  State<BudgetSelector> createState() => _BudgetSelectorState();
}

class _BudgetSelectorState extends State<BudgetSelector> {
  @override
  Widget build(BuildContext context) {
    List<Budget> budgets = BudgetMock.budgets;
    int? currentIndex = budgets.indexOf(widget.currentBudget);

    return Container(
      height: MediaQuery.of(context).size.height * 0.4,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            const Icon(Icons.remove),
            Text(
              "Budgets",
              style: Theme.of(context).textTheme.displayLarge,
            ),
            const Space(),
            const Divider(),
            Expanded(
                child: ListView.builder(
                    itemCount: budgets.length,
                    itemBuilder: (context, index) {
                      final Budget budget = budgets[index];
                      return BudgetSelectorItem(
                        budget: budget,
                        onTap: () => {
                          setState(() {
                            widget.onBudgetSelector(budget);
                            currentIndex = index;
                            Navigator.of(context).pop();
                          })
                        },
                        isCurrent: currentIndex == index,
                      );
                    })),
            Padding(
              padding: const EdgeInsets.all(10),
              child: SizedBox(
                width: double.infinity,
                child: TextButton(
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 12), // Adjust padding
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(20), // Rounded corners
                      ),
                      backgroundColor: Theme.of(context)
                          .colorScheme
                          .primary
                          .withAlpha(50), // Optional background
                    ),
                    onPressed: () => {},
                    child: Text(
                      "New Budget",
                      style: Theme.of(context).textTheme.displayMedium,
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
