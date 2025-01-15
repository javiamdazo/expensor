import 'package:expensor/model/transaction.dart';
import 'package:expensor/pages/transaction/widget/transactions/transaction_item.dart';
import 'package:expensor/pages/transaction/widget/transactions/transaction_provider.dart';
import 'package:flutter/material.dart';

class TransactionsListKpi extends StatefulWidget {
  const TransactionsListKpi({Key? key}) : super(key: key);

  @override
  _TransactionsListKpiState createState() => _TransactionsListKpiState();
}

class _TransactionsListKpiState extends State<TransactionsListKpi> {
  bool byCategory = false;

//TODO si uso un listView no se ve ningun widget
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: MediaQuery.of(context).size.height * 0.6,
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
                        "Transactions",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      Text(
                        "View details",
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(color: Colors.blue, fontSize: 15),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        "20,89 €",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      Text("Spend today",
                          style: Theme.of(context).textTheme.titleSmall),
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.4,
                child: Card(
                  margin: const EdgeInsets.all(0),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 15),
                    child: Expanded(
                      child: byCategory
                          ? buildListTransactionsByCategories()
                          : buildListTransactions(),
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}

Widget buildListTransactions() {
  return ListView.builder(
    itemCount: TransactionProvider.transactions.length,
    itemBuilder: (context, index) {
      final String isIncome = TransactionProvider.transactions[index].type;

      return TransactionItem(
          isIncome: isIncome.contains('income'),
          transaction: TransactionProvider.transactions[index]);
    },
  );
}

Widget buildListTransactionsByCategories() {
  final transactionsGroupedByCategory =
      TransactionProvider.getTransactionsByCategory();

  return ListView.builder(
    itemCount: transactionsGroupedByCategory.keys.length,
    itemBuilder: (context, index) {
      final category = transactionsGroupedByCategory.keys.elementAt(index);
      final categoryTransactions = transactionsGroupedByCategory[category]!;

      return Container(
        margin: const EdgeInsets.symmetric(vertical: 2.0),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(12),
        ),
        child: ExpansionTile(
          title: Text(
            category,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          children: categoryTransactions.map<Widget>((transaction) {
            final isIncome = transaction.type == 'income';
            return TransactionItem(
                isIncome: isIncome, transaction: transaction);
          }).toList(),
        ),
      );
    },
  );
}
