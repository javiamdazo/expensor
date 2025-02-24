import 'package:expensor/data/entity/budget_chart_data.dart';
import 'package:expensor/provider/model/budget.dart';
import 'package:expensor/provider/model/category_budget.dart';
import 'package:expensor/widgets/formatted_number.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class BudgetDoughutChart extends StatelessWidget {
  final Budget budget;
  const BudgetDoughutChart({
    super.key,
    required this.budget,
  });

  @override
  Widget build(BuildContext context) {
    final List<BudgetChartData> data = budget.budgets.entries.map((entry) {
      CategoryBudget categoryBudget = entry.value.first;
      return BudgetChartData(
        category: categoryBudget.category,
        yData: categoryBudget.spent,
        color: categoryBudget.category.color,
      );
    }).toList();

    return SfCircularChart(
      margin: const EdgeInsets.all(0),
      series: <DoughnutSeries<BudgetChartData, String>>[
        DoughnutSeries<BudgetChartData, String>(
            animationDuration: 1000,
            explode: false,
            innerRadius: '90%',
            dataSource: data,
            enableTooltip: true,
            pointColorMapper: (datum, index) => datum.color?.withAlpha(180),
            xValueMapper: (BudgetChartData data, _) =>
                data.category.categoryId.toString(),
            yValueMapper: (BudgetChartData data, _) => data.yData,
            dataLabelMapper: (BudgetChartData data, _) => data.category.name,
            dataLabelSettings: DataLabelSettings(
              isVisible: true,
              labelPosition: ChartDataLabelPosition.outside,
              overflowMode: OverflowMode.trim,
              builder: (dynamic data, dynamic point, dynamic series,
                  int pointIndex, int seriesIndex) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FormattedNumber(
                      number: data.yData,
                      style: Theme.of(context)
                          .textTheme
                          .displaySmall!
                          .copyWith(color: Colors.white),
                      numberType: NumberType.currency,
                    ),
                    Text(data.category.name,
                        style: Theme.of(context)
                            .textTheme
                            .labelSmall!
                            .copyWith(color: Colors.grey[300])),
                  ],
                );
              },
            ))
      ],
    );
  }
}
