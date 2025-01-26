import 'package:expensor/pages/kpis/widget/transactions/transaction_item.dart';
import 'package:expensor/pages/kpis/widget/transactions/transaction_provider.dart';
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
                      color: const Color.fromRGBO(128, 168, 255, 1),
                      fontSize: 15),
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
