import 'package:expensor/pages/kpis/resume/income_expense.dart';
import 'package:expensor/pages/kpis/resume/left_to_spend.dart';
import 'package:expensor/widgets/space.dart';
import 'package:flutter/material.dart';

class ResumeKpi extends StatefulWidget {
  const ResumeKpi({super.key});

  @override
  ResumeKpiState createState() => ResumeKpiState();
}

class ResumeKpiState extends State<ResumeKpi> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Header Section with button and icon
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: TextButton.icon(
                  autofocus: true,
                  icon: Icon(
                    Icons.arrow_drop_down_sharp,
                    color: Theme.of(context).iconTheme.color,
                    size: 20,
                  ),
                  iconAlignment: IconAlignment.end,
                  onPressed: () => {},
                  label: Text("Globalcaja",
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall),
                ),
              ),
              IconButton(
                onPressed: () => {},
                icon: Icon(
                  Icons.remove_red_eye,
                  color: Theme.of(context).iconTheme.color,
                ),
              ),
            ],
          ),
          Space(),
          const LeftToSpend(),
          Space(space: SpaceEnum.double),
          const IncomeExpense(),
        ],
      ),
    );
  }
}
