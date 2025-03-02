import 'package:expensor/pages/kpis/categories/resume_categories_budget.dart';
import 'package:expensor/pages/kpis/kpi_builder.dart';
import 'package:expensor/common/widgets/space.dart';
import 'package:flutter/material.dart';

class CategoriesKpi extends StatefulWidget {
  final Function(int) changeTab;
  const CategoriesKpi({super.key, required this.changeTab});

  @override
  CategoriesKpiState createState() => CategoriesKpiState();
}

class CategoriesKpiState extends State<CategoriesKpi> {
  @override
  Widget build(BuildContext context) {
    return KpiBuilder(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            GestureDetector(
              onTap: () => {widget.changeTab(1)},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Spend analisys",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const Icon(
                    Icons.keyboard_arrow_right_rounded,
                    size: 30,
                  )
                ],
              ),
            ),
            const Space(),
            const ResumeCategoriesBudget()
          ],
        ),
      ),
    );
  }
}
