import 'package:expensor/model/chart_data.dart';
import 'package:expensor/utils/ux_colors.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class DoughutChart extends StatelessWidget {
  const DoughutChart(
      {super.key,
      required this.budget,
      required this.spent,
      required this.categoryColor});

  final num budget;
  final double spent;
  final Color categoryColor;

  @override
  Widget build(BuildContext context) {
    List<ChartData> data = [
      ChartData('Spent', spent, categoryColor),
      ChartData('Budget', budget, UxColors.darkLightSmooth.value),
    ];

    return SfCircularChart(
        margin: const EdgeInsets.all(0),
        series: <DoughnutSeries<ChartData, String>>[
          DoughnutSeries<ChartData, String>(
              innerRadius: '65%',
              dataSource: data,
              pointColorMapper: (datum, index) => datum.color?.withAlpha(100),
              xValueMapper: (ChartData data, _) => '',
              yValueMapper: (ChartData data, _) => data.yData,
              dataLabelMapper: (ChartData data, _) => data.label,
              dataLabelSettings: const DataLabelSettings(isVisible: false)),
        ]);
  }
}
