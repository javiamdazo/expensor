import 'package:expensor/pages/kpis/kpi_builder.dart';
import 'package:expensor/pages/kpis/transactions/transaction_item.dart';
import 'package:expensor/provider/model/transaction.dart';
import 'package:expensor/provider/transactions_provider.dart';
import 'package:expensor/widgets/formatted_number.dart';
import 'package:expensor/widgets/space.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TransactionsListKpi extends StatefulWidget {
  const TransactionsListKpi({super.key});

  @override
  TransactionsListKpiState createState() => TransactionsListKpiState();
}

class TransactionsListKpiState extends State<TransactionsListKpi> {
  bool byCategory = false;

  @override
  Widget build(BuildContext context) {
    final TransactionsProvider transactionsProvider =
        Provider.of<TransactionsProvider>(context);
    double height = MediaQuery.of(context).size.height;

    return KpiBuilder(
        child: Padding(
      padding: const EdgeInsets.all(20),
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
                    style: Theme.of(context).textTheme.displaySmall?.copyWith(
                        color:
                            Theme.of(context).colorScheme.onPrimaryContainer),
                  ),
                ],
              ),
              Column(
                children: [
                  FormattedNumber(
                    number: transactionsProvider.getTodayAmount(),
                    style: Theme.of(context).textTheme.titleMedium,
                    numberType: NumberType.currency,
                  ),
                  Text("Spend today",
                      style: Theme.of(context).textTheme.displaySmall!.copyWith(
                          color: Theme.of(context)
                              .colorScheme
                              .onPrimaryContainer)),
                ],
              )
            ],
          ),
          Space(),
          TextButton(
              onPressed: () {
                transactionsProvider.add(1, "prueba", DateTime.now(), 154, 1, 1);
              },
              child: Text(
                "CreateTransaction",
                style: TextStyle(color: Colors.white),
              )),
          SizedBox(
            height: height * 0.25,
            child: Card(
              child: Expanded(
                  child: ListView.builder(
                padding: const EdgeInsets.all(10),
                itemCount: transactionsProvider.transactionsList.length,
                itemBuilder: (context, index) {
                  final Transaction transaction = transactionsProvider
                      .transactionsList[index];

                  return TransactionItem(transaction: transaction);
                },
              )),
            ),
          )
        ],
      ),
    ));
  }
}
