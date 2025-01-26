import 'package:expensor/pages/kpis/widget/resume/budget_title.dart';
import 'package:expensor/pages/kpis/widget/resume/income_expense.dart';
import 'package:expensor/pages/kpis/widget/resume/left_to_spend.dart';
import 'package:expensor/pages/kpis/widget/resume/resume_categories_budget.dart';
import 'package:expensor/widgets/space.dart';
import 'package:flutter/material.dart';

class ResumeKpi extends StatefulWidget {
  const ResumeKpi({super.key});

  @override
  ResumeKpiState createState() => ResumeKpiState();
}

class ResumeKpiState extends State<ResumeKpi> {
  bool droppedDown = true;

  void toggleDropdown() {
    setState(() {
      droppedDown = !droppedDown;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BudgetTitle(droppedDown: droppedDown, onToggle: toggleDropdown),
          Space(),
          const LeftToSpend(),
          Space(),
          const IncomeExpense(),
          Space(),
          AnimatedCrossFade(
            firstChild: Container(),
            secondChild: const ResumeCategoriesBudget(),
            crossFadeState: droppedDown
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst,
            duration: const Duration(milliseconds: 300),
          ),
        ],
      ),
    ));
  }
}
