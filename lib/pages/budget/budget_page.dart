import 'package:expensor/data/mock/budget_mock.dart';
import 'package:expensor/provider/model/budget.dart';
import 'package:expensor/provider/model/category_budget.dart';
import 'package:expensor/provider/model/category_budget_type.dart';
import 'package:expensor/widgets/budget_doughut_chart.dart';
import 'package:expensor/widgets/budget_dropdown_selector.dart';
import 'package:expensor/widgets/formatted_number.dart';
import 'package:expensor/widgets/space.dart';
import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

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
          selectedBudget: _selectedBudget,
          onBudgetSelector: onBudgetSelector,
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
              backgroundColor: Theme.of(context).colorScheme.primary,
              expandedHeight: MediaQuery.of(context).size.height * 0.30,
              flexibleSpace: FlexibleSpaceBar(
                background: Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: BudgetChart(selectedBudget: _selectedBudget),
                ),
              )),
          SliverPersistentHeader(
            pinned: true,
            delegate: _FixedHeaderDelegate(
              child: Container(
                color: Theme.of(context).colorScheme.primary,
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.keyboard_arrow_left_outlined),
                    ),
                    Text(
                      "January",
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.keyboard_arrow_right_outlined),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                childCount: _selectedBudget.budgets.length, (context, index) {
              final CategoryBudgetType entry =
                  _selectedBudget.budgets.keys.elementAt(index);
              final List<CategoryBudget> categories =
                  _selectedBudget.budgets[entry]!;

              return Card(
                margin: const EdgeInsets.all(10),
                color: Theme.of(context).colorScheme.secondary,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BudgetTitle(
                        categoryBudgetType: entry,
                      ),
                      const Divider(
                        color: Colors.white,
                        thickness: 0.2,
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: categories.length,
                        itemBuilder: (context, catIndex) {
                          final CategoryBudget category = categories[catIndex];

                          final double budget = category.budget;
                          final double spent = category.spent;

                          return BudgetListCategories(
                              category: category, budget: budget, spent: spent);
                        },
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}

class _FixedHeaderDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;
  _FixedHeaderDelegate({required this.child});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return child;
  }

  @override
  double get maxExtent => 60; // Adjust height as needed
  @override
  double get minExtent => 60; // Keeps it fixed
  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}

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
                space: SpaceEnum.double,
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
            space: SpaceEnum.double,
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
          space: SpaceEnum.double,
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
        BudgetDoughutChart(budget: selectedBudget),
      ],
    );
  }
}
