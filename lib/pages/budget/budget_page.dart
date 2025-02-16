import 'package:expensor/data/mock/budget_mock.dart';
import 'package:expensor/provider/model/budget.dart';
import 'package:expensor/provider/model/category_budget.dart';
import 'package:expensor/provider/model/category_budget_type.dart';
import 'package:expensor/widgets/budget_doughut_chart.dart';
import 'package:expensor/widgets/budget_dropdown_selector.dart';
import 'package:expensor/widgets/formatted_number.dart';
import 'package:expensor/widgets/space.dart';
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
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.settings),
        ),
        title: BudgetDropdownWidget(
          selectedBudget: _selectedBudget,
          onBudgetSelector: onBudgetSelector,
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
              backgroundColor: Theme.of(context).colorScheme.primary,
              expandedHeight: MediaQuery.of(context).size.height * 0.25,
              flexibleSpace: FlexibleSpaceBar(
                background: SizedBox(
                    child: BudgetChart(selectedBudget: _selectedBudget)),
              )),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final CategoryBudgetType entry =
                    _selectedBudget.budgets.keys.elementAt(index);
                final List<CategoryBudget> categories =
                    _selectedBudget.budgets[entry]!;

                return Card(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          entry.name
                              .toString()
                              .toUpperCase(), // Ensure `entry` is convertible to String
                          style: Theme.of(context).textTheme.titleMedium,
                        ), // Replace Expanded
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: categories.length,
                          itemBuilder: (context, catIndex) {
                            return Row(
                              children: [
                                Text(categories[catIndex].category.name),
                                Text(categories[catIndex].budget.toString()),
                                Text(categories[catIndex].spent.toString())
                              ],
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
              childCount: _selectedBudget.budgets.length,
            ),
          ),
        ],
      ),
    );
  }
}

class BudgetChart extends StatelessWidget {
  const BudgetChart({
    super.key,
    required this.selectedBudget,
  });

  final Budget selectedBudget;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              selectedBudget.icon,
              size: 50,
              color: Colors.white,
            ),
            const Space(spaceType: SpaceType.height),
            FormattedNumber(
              number: 1200,
              style: Theme.of(context)
                  .textTheme
                  .displayMedium!
                  .copyWith(color: Colors.white),
              numberType: NumberType.currency,
            ),
            Text(
              "Left to spend",
              style: Theme.of(context)
                  .textTheme
                  .labelSmall!
                  .copyWith(color: Colors.white),
            ),
          ],
        ),
        BudgetDoughutChart(budget: selectedBudget),
      ],
    );
  }
}
