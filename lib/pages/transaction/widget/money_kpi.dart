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
    Key? key,
    required this.type,
    required this.amount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          type.name,
          style: Theme.of(context).textTheme.titleSmall,
        ),
        Text(
          '${amount.toStringAsFixed(2)} €',
          style: Theme.of(context).textTheme.displaySmall,
        ),
      ],
    );
  }
}
