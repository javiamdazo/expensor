import 'package:expensor/data/mock/transactions_mock.dart';
import 'package:expensor/pages/kpis/kpi_builder.dart';
import 'package:expensor/pages/kpis/transactions/transaction_kpi_item.dart';
import 'package:expensor/provider/model/transaction.dart';
import 'package:expensor/widgets/formatted_number.dart';
import 'package:expensor/common/widgets/space.dart';
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
                    style: Theme.of(context)
                        .textTheme
                        .displaySmall
                        ?.copyWith(color: Colors.grey[300]),
                  ),
                ],
              ),
              Column(
                children: [
                  FormattedNumber(
                    number: TransactionsMock.getTodayAmount(),
                    style: Theme.of(context).textTheme.titleMedium,
                    numberType: NumberType.currency,
                  ),
                  Text(
                    "Spend today",
                    style: Theme.of(context)
                        .textTheme
                        .displaySmall!
                        .copyWith(color: Colors.grey[300]),
                  ),
                ],
              )
            ],
          ),
          const Space(),
          SizedBox(
            height: height * 0.25,
            child: Card(
              child: Expanded(
                  child: ListView.builder(
                padding: const EdgeInsets.all(10),
                itemCount: TransactionsMock.transactions.length,
                itemBuilder: (context, index) {
                  final Transaction transaction =
                      TransactionsMock.transactions[index];

                  return TransactionKpiItem(transaction: transaction);
                },
              )),
            ),
          )
        ],
      ),
    ));
  }
}
