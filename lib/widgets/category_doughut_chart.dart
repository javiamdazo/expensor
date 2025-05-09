import 'package:expensor/data/entity/category_chart_data.dart';
import 'package:expensor/utils/ux_colors.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CategoryDoughutChart extends StatelessWidget {
  const CategoryDoughutChart(
      {super.key,
      required this.budget,
      required this.spent,
      required this.categoryColor});

  final num budget;
  final double spent;
  final Color categoryColor;

  @override
  Widget build(BuildContext context) {
    List<CategoryChartData> data = [
      CategoryChartData(label: 'Spent', yData: spent, color: categoryColor),
      CategoryChartData(
          label: 'Budget',
          yData: budget,
          color: UxColors.darkLightSmooth.value),
    ];

    return SfCircularChart(
        margin: const EdgeInsets.all(0),
        series: <DoughnutSeries<CategoryChartData, String>>[
          DoughnutSeries<CategoryChartData, String>(
              innerRadius: '65%',
              dataSource: data,
              pointColorMapper: (datum, index) => datum.color?.withAlpha(120),
              xValueMapper: (CategoryChartData data, _) => '',
              yValueMapper: (CategoryChartData data, _) => data.yData,
              dataLabelMapper: (CategoryChartData data, _) => data.label,
              dataLabelSettings: const DataLabelSettings(isVisible: false)),
        ]);
  }
}
