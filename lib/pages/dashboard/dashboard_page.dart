import 'package:expensor/pages/kpis/categories/categories_kpi.dart';
import 'package:expensor/pages/kpis/accounts/accounts_kpi.dart';
import 'package:expensor/pages/kpis/resume/resume_kpi.dart';
import 'package:expensor/pages/kpis/transactions/transactions_list_kpi.dart';
import 'package:expensor/pages/transaction/transaction_page.dart';
import 'package:expensor/utils/ux_colors.dart';
import 'package:expensor/widgets/bottom_modal.dart';
import 'package:expensor/widgets/space.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  final Function(int) changeTab; // Pass a function to change tabs
  const DashboardPage({Key? key, required this.changeTab});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  bool hideData = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        leadingWidth: MediaQuery.of(context).size.width * 0.4,
        leading: TextButton.icon(
          autofocus: true,
          icon: Icon(Icons.arrow_drop_down_sharp,
              color: Theme.of(context).iconTheme.color, size: 20),
          iconAlignment: IconAlignment.end,
          onPressed: () => {},
          label:
              Text("Globalcaja", style: Theme.of(context).textTheme.titleSmall),
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
          //TODO overflows con el teclado sacado
          BottomModal.showBottomModal(
              context,
              TransactionPage(
                tabIndex: 1,
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
                Space(),
                ResumeKpi(
                  hideData: hideData,
                ),
                Space(space: SpaceEnum.simple),
                const CategoriesKpi(),
                Space(space: SpaceEnum.triple),
                const TransactionsListKpi(),
                Space(space: SpaceEnum.triple),
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
