import 'package:expensor/pages/kpis/widget/transactions/transaction_provider.dart';
import 'package:expensor/widgets/formatted_number.dart';
import 'package:flutter/material.dart';

class LeftToSpend extends StatelessWidget {
  const LeftToSpend({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      FormattedNumber(
        number: TransactionProvider.remainingMoney,
        style: Theme.of(context).textTheme.displayLarge,
        numberType: NumberType.currency
      ),
      Text(
        "Cash flow",
        style: Theme.of(context).textTheme.labelMedium,
      )
    ]);
  }
}
