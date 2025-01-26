import 'dart:math';
import 'package:expensor/model/linear_data.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class LinearChart extends StatelessWidget {
  const LinearChart({super.key});

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      plotAreaBorderWidth: 0,
      tooltipBehavior:
          TooltipBehavior(enable: true),
      primaryXAxis: const DateTimeAxis(
        interval: 1,
        majorGridLines: MajorGridLines(color: Colors.transparent),
      ),
      primaryYAxis: NumericAxis(
        axisLine: const AxisLine(width: 0),
        interval: 10,
        majorTickLines: const MajorTickLines(color: Colors.transparent),
        majorGridLines: MajorGridLines(
              color: Theme.of(context).primaryColor.withAlpha(150),
              width: 1
            ),
      ),
      series: getDefaultData(context),
    );
  }

  static List<AreaSeries<LinearData, DateTime>> getDefaultData(BuildContext context) {
    final Random random = Random();
    final List<LinearData> chartData = <LinearData>[];

    double value = 25;

    for (int i = 0; i < 31; i++) {
      double fluctuation =
          (random.nextDouble() * 20 - 10); 
      value += fluctuation;

      value = value < 0 ? 0 : (value > 1000 ? 1000 : value);

      // Crear el dato con fecha correspondiente
      chartData.add(LinearData(
        date: DateTime(2024, 1, i + 1),
        value: value.toDouble(),
      ));
    }

    return <AreaSeries<LinearData, DateTime>>[
      AreaSeries<LinearData, DateTime>(
        dataSource: chartData,
        xValueMapper: (LinearData data, _) => data.date,
        yValueMapper: (LinearData data, _) => data.value,
        color: Theme.of(context).primaryColor,
        dataLabelSettings: const DataLabelSettings(
          labelAlignment: ChartDataLabelAlignment.auto,
        ),
      ),
    ];
  }
}
