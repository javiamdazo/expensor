import 'package:expensor/budgets/mock/budget_mock.dart';
import 'package:expensor/pages/kpis/categories/categories_kpi.dart';
import 'package:expensor/accounts/kpi/account_kpi.dart';
import 'package:expensor/pages/kpis/resume/resume_kpi.dart';
import 'package:expensor/pages/kpis/transactions/transactions_list_kpi.dart';
import 'package:expensor/pages/transaction/transaction_page.dart';
import 'package:expensor/budgets/model/budget.dart';
import 'package:expensor/utils/ux_colors.dart';
import 'package:expensor/widgets/bottom_modal.dart';
import 'package:expensor/widgets/budget_dropdown_selector.dart';
import 'package:expensor/common/widgets/space.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  final Function(int) changeTab; // Pass a function to change tabs
  const DashboardPage({super.key, required this.changeTab});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  bool hideData = false;
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
        scrolledUnderElevation: 0,
        leading: IconButton(
            onPressed: () => {},
            icon: Icon(
              Icons.settings,
              color: Theme.of(context).iconTheme.color,
            )),
        title: BudgetDropdownWidget(
          selectedBudget: _selectedBudget,
          onBudgetSelector: onBudgetSelector,
        ),
        actions: [
          IconButton(
            onPressed: () => {
              setState(() {
                hideData = !hideData;
              })
            },
            icon: Icon(
              Icons.remove_red_eye,
              color: Theme.of(context).iconTheme.color,
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          BottomModal.showBottomModal(
              context,
              const TransactionPage(
                firstIndex: 1,
              ))
        },
        backgroundColor: Theme.of(context).colorScheme.primary,
        child: Icon(
          Icons.add,
          color: UxColors.clouds.value,
        ),
      ),
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: MediaQuery.of(context).size.height * 0.4,
            child: Container(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.4,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              color: Theme.of(context).colorScheme.surface,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.02,
            ),
            child: ListView(
              children: [
                const Space(),
                ResumeKpi(
                  hideData: hideData,
                ),
                const Space(spaceSize: SpaceSize.simple),
                CategoriesKpi(
                  changeTab: widget.changeTab,
                ),
                const Space(spaceSize: SpaceSize.triple),
                const TransactionsListKpi(),
                const Space(spaceSize: SpaceSize.triple),
                AccountsKpi(
                  hideData: hideData,
                  changeTab: widget.changeTab,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
