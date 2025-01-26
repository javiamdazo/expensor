import 'package:expensor/pages/kpis/widget/transactions/transaction_provider.dart';
import 'package:expensor/widgets/formatted_number.dart';
import 'package:flutter/material.dart';

class LeftToSpend extends StatelessWidget {
  const LeftToSpend({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        "LEFT TO SPEND",
        style: Theme.of(context).textTheme.titleSmall,
      ),
      FormattedNumber(
        number: TransactionProvider.remainingMoney,
        style: Theme.of(context).textTheme.displayLarge,
        numberType: NumberType.currency
      ),
      LinearProgressIndicator(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        minHeight: 10,
        value: 0.5,
        color: Theme.of(context).primaryColor,
        backgroundColor: Theme.of(context).primaryColor.withOpacity(0.3),
      )
    ]);
  }
}
