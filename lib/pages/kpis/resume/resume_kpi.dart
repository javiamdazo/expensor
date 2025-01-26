import 'package:expensor/pages/kpis/resume/income_expense.dart';
import 'package:expensor/pages/kpis/resume/left_to_spend.dart';
import 'package:expensor/widgets/linear_chart.dart';
import 'package:expensor/widgets/space.dart';
import 'package:flutter/material.dart';

class ResumeKpi extends StatefulWidget {
  final double currentPosition;
  const ResumeKpi({super.key, required this.currentPosition});

  @override
  ResumeKpiState createState() => ResumeKpiState();
}

class ResumeKpiState extends State<ResumeKpi> {
  @override
  Widget build(BuildContext context) {
    print(widget.currentPosition);

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

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
                          .titleSmall!
                          .copyWith(color: Colors.grey[300])),
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
          Space(space: SpaceEnum.triple),
          AnimatedOpacity(
            opacity: widget.currentPosition < 0.73 ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 500),
            child: SizedBox(
              height: height * 0.2,
              width: width,
              child: const LinearChart(),
            ),
          )
        ],
      ),
    );
  }
}
