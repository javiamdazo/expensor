import 'package:expensor/widgets/formatted_number.dart';
import 'package:flutter/material.dart';

enum MoneyKpiType {
  income,
  expense,
  investment,
  transfer;

  String get name {
    switch (this) {
      case MoneyKpiType.income:
        return 'Income';
      case MoneyKpiType.expense:
        return 'Expense';
      case MoneyKpiType.investment:
        return 'Investment';
      case MoneyKpiType.transfer:
        return 'Transfer';
    }
  }
}

class MoneyKpi extends StatelessWidget {
  final MoneyKpiType type;
  final double amount;

  const MoneyKpi({
    super.key,
    required this.type,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          type.name,
          style: Theme.of(context).textTheme.titleSmall,
        ),
        FormattedNumber(
          number: amount,
          style: Theme.of(context).textTheme.displaySmall,
        ),
      ],
    );
  }
}
