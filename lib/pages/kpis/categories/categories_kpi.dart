import 'package:expensor/pages/kpis/categories/resume_categories_budget.dart';
import 'package:expensor/pages/kpis/kpi_builder.dart';
import 'package:expensor/widgets/space.dart';
import 'package:flutter/material.dart';

class CategoriesKpi extends StatefulWidget {
  const CategoriesKpi({super.key});

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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Spend analisys",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const Icon(Icons.arrow_right, size: 30,)
              ],
            ),
            Space(),
            const ResumeCategoriesBudget()
          ],
        ),
      ),
    );
  }
}
