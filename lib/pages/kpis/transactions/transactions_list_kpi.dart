import 'package:expensor/pages/kpis/transactions/transaction_item.dart';
import 'package:expensor/pages/kpis/transactions/transaction_provider.dart';
import 'package:expensor/widgets/formatted_number.dart';
import 'package:expensor/widgets/space.dart';
import 'package:flutter/material.dart';

class TransactionsListKpi extends StatefulWidget {
  const TransactionsListKpi({super.key});

  @override
  TransactionsListKpiState createState() => TransactionsListKpiState();
}

class TransactionsListKpiState extends State<TransactionsListKpi> {
  bool byCategory = false;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return SafeArea(
        child: Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Transactions",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Text(
                  "View details",
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Theme.of(context).primaryColor,
                      fontSize: 15),
                ),
              ],
            ),
            Column(
              children: [
                FormattedNumber(
                  number: 20.89,
                  style: Theme.of(context).textTheme.titleMedium,
                  numberType: NumberType.currency,
                ),
                Text("Spend today",
                    style: Theme.of(context).textTheme.titleSmall),
              ],
            )
          ],
        ),
        Space(),
        SizedBox(
          height: height * 0.25,
          child: Card(
            child: Expanded(
                child: ListView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: TransactionProvider.transactions.length,
              itemBuilder: (context, index) {
                final String isIncome =
                    TransactionProvider.transactions[index].type;

                return TransactionItem(
                    isIncome: isIncome.contains('income'),
                    transaction: TransactionProvider.transactions[index]);
              },
            )),
          ),
        )
      ],
    ));
  }
}
