import 'package:expensor/pages/kpis/transactions/transaction_provider.dart';
import 'package:expensor/widgets/formatted_number.dart';
import 'package:flutter/material.dart';

class LeftToSpend extends StatelessWidget {
  const LeftToSpend({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      FormattedNumber(
        number: TransactionProvider.remainingMoney,
        style: Theme.of(context).textTheme.titleLarge,
        numberType: NumberType.currency
      ),
      Text(
        "Cash Flow",
        style: Theme.of(context).textTheme.displayMedium!.copyWith(color: Colors.grey[300]),
      )
    ]);
  }
}
