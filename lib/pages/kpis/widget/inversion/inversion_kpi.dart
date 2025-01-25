import 'package:expensor/pages/kpis/widget/transactions/transaction_item.dart';
import 'package:expensor/pages/kpis/widget/transactions/transaction_provider.dart';
import 'package:expensor/widgets/formatted_number.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class InversiontKpi extends StatefulWidget {
  const InversiontKpi({super.key});

  @override
  InversiontKpiState createState() => InversiontKpiState();
}

class InversiontKpiState extends State<InversiontKpi> {
  bool byCategory = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Saving & Inversion",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Text(
                    "View details",
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: const Color.fromRGBO(128, 168, 255, 1),
                        fontSize: 15),
                  ),
                ],
              ),
              Column(
                children: [
                  FormattedNumber(
                    number: 6898.89,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Row(
                    children: [
                      FormattedNumber(
                          number: 6400.00,
                          style: Theme.of(context).textTheme.titleSmall),
                      const SizedBox(
                        width: 5,
                      ),
                      Row(
                        children: [
                          const Icon(Icons.arrow_upward,
                              size: 15, color: Color.fromRGBO(36, 190, 168, 1)),
                          FormattedNumber(
                              number: 9.87,
                              currency: false,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                      color: const Color.fromRGBO(
                                          36, 190, 168, 1))),
                        ],
                      )
                    ],
                  )
                ],
              )
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.25,
            child: Card(
              margin: const EdgeInsets.all(0),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: Expanded(
                    child: ListView.builder(
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
            ),
          )
        ],
      ),
    ));
  }
}
