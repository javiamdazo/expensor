import 'package:expensor/pages/dashboard/dashboard_background.dart';
import 'package:expensor/pages/kpis/categories/categories_kpi.dart';
import 'package:expensor/pages/kpis/inversion/inversion_kpi.dart';
import 'package:expensor/pages/kpis/resume/resume_kpi.dart';
import 'package:expensor/pages/kpis/transactions/transactions_list_kpi.dart';
import 'package:expensor/utils/ux_colors.dart';
import 'package:expensor/widgets/space.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage>{
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () => {},
        child: Icon(Icons.add, color: Theme.of(context).iconTheme.color,),
      ),
      body: Stack(
        children: [
          const DashboardBackground(),
          ListView(
            children: [
              const ResumeKpi(),
              Space(),
              Container(
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  color: UxColors.dark.value,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)
                  )
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      const CategoriesKpi(),
                      Space(
                        space: SpaceEnum.triple,
                      ),
                      const TransactionsListKpi(),
                      Space(
                        space: SpaceEnum.triple,
                      ),
                      const InversionKpi(),
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
