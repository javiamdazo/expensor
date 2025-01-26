import 'package:expensor/widgets/formatted_number.dart';
import 'package:expensor/widgets/space.dart';
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
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Row(
        children: [
          CircleAvatar(
              backgroundColor: Theme.of(context).iconTheme.color,
              child: Icon(
                type == MoneyKpiType.income ? Icons.add : Icons.remove,
              )),
          Space(
            spaceType: SpaceType.width,
            space: SpaceEnum.double,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FormattedNumber(
                  number: amount,
                  style: Theme.of(context).textTheme.displaySmall,
                  numberType: NumberType.currency),
              Text(
                type.name,
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(color: Colors.grey[300]),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
