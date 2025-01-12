import 'package:expensor/pages/transaction/transaction_provider.dart';
import 'package:expensor/pages/transaction/widget/transaction_item.dart';
import 'package:flutter/material.dart';


Widget buildListTransactions() {
    return Expanded(
      child: ListView.builder(
        itemCount: TransactionProvider.transactions.length,
        itemBuilder: (context, index) {
          final String isIncome =
              TransactionProvider.transactions[index].type;

          return Container(
            margin: const EdgeInsets.symmetric(vertical: 2.0),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(12),
            ),
            child: buildTransactionItem(isIncome.contains('income'),
                TransactionProvider.transactions[index]),
          );
        },
      ),
    );
  }