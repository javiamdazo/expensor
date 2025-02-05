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

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: MediaQuery.of(context).size.height * 0.4,
            child: Container(
              color: Theme.of(context).primaryColor,
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.4,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              color: UxColors.darkLight.value,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.02,
            ),
            child: ListView(
              children: [
                const ResumeKpi(),
                Space(space: SpaceEnum.simple),
                const CategoriesKpi(),
                Space(space: SpaceEnum.triple),
                const TransactionsListKpi(),
                Space(space: SpaceEnum.triple),
                const InversionKpi(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
