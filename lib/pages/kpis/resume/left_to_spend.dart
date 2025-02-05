import 'package:expensor/pages/kpis/transactions/transaction_provider.dart';
import 'package:expensor/widgets/formatted_number.dart';
import 'package:expensor/widgets/hidded_data.dart';
import 'package:flutter/material.dart';

class LeftToSpend extends StatelessWidget {
  final bool hideData;
  const LeftToSpend({super.key, required this.hideData});

  @override
  Widget build(BuildContext context) {

    final TextStyle? style = Theme.of(context).textTheme.titleLarge;

    return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      hideData
          ? HiddedData(style: style)
          : FormattedNumber(
              number: TransactionProvider.remainingMoney,
              style: Theme.of(context).textTheme.titleLarge,
              numberType: NumberType.currency),
      Text(
        "Cash Flow",
        style: Theme.of(context)
            .textTheme
            .displayMedium!
            .copyWith(color: Colors.grey[300]),
      )
    ]);
  }
}
