import 'package:expensor/pages/kpis/categories/resume_categories_budget.dart';
import 'package:expensor/widgets/space.dart';
import 'package:flutter/material.dart';

class CategoriesKpi extends StatefulWidget {
  const CategoriesKpi({super.key});

  @override
  CategoriesKpiState createState() => CategoriesKpiState();
}

class CategoriesKpiState extends State<CategoriesKpi> {
  bool byCategory = false;

  @override
  Widget build(BuildContext context) {

    return SafeArea(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Spend analisys",
          style: Theme.of(context).textTheme.titleMedium,
        ),
        Space(),
        const ResumeCategoriesBudget()
      ],
    ));
  }
}
