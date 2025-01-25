import 'package:expensor/pages/dashboard/dashboard_background.dart';
import 'package:expensor/pages/kpis/widget/inversion/inversion_kpi.dart';
import 'package:expensor/pages/kpis/widget/resume/resume_kpi.dart';
import 'package:expensor/pages/kpis/widget/transactions/transactions_list_kpi.dart';
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
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        leading: IconButton(
            onPressed: () => {},
            icon: const Icon(Icons.settings, color: Colors.white)),
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Account:",
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.normal,
                  ),
            ),
            const SizedBox(width: 5),
            Text("Globalcaja", style: Theme.of(context).textTheme.titleMedium),
            IconButton(
                onPressed: () => {},
                icon: const Icon(
                  Icons.arrow_drop_down_sharp,
                  color: Colors.white,
                )),
          ],
        ),
      ),
      body: Stack(
        children: [
          const DashboardBackground(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: ListView(
              children: const [
                ResumeKpi(),
                InversiontKpi(),
                TransactionsListKpi()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
