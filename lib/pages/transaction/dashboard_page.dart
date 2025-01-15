import 'package:expensor/pages/transaction/widget/resume/resume_kpi.dart';
import 'package:expensor/pages/transaction/widget/transactions/transactions_list_kpi.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [ResumeKpi(), SizedBox(height: 20), TransactionsListKpi()],
    );
  }
}
