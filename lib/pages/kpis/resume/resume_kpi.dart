import 'package:expensor/pages/kpis/resume/income_expense.dart';
import 'package:expensor/pages/kpis/resume/left_to_spend.dart';
import 'package:expensor/common/widgets/space.dart';
import 'package:flutter/material.dart';

class ResumeKpi extends StatelessWidget {
  final bool hideData;
  const ResumeKpi({super.key, required this.hideData});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          LeftToSpend(hideData: hideData),
          Space(spaceSize: SpaceSize.double),
          IncomeExpense(hideData: hideData),
        ],
      ),
    );
  }
}
