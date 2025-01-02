import 'package:expensor/pages/transaction/transaction_provider.dart';
import 'package:expensor/pages/transaction/widget/transaction_item.dart';
import 'package:flutter/material.dart';


Widget buildListTransactionsByCategories() {
    final transactionsGroupedByCategory = TransactionProvider.getTransactionsByCategory();
    
    return Expanded(
      child: ListView.builder(
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
                return buildTransactionItem(isIncome, transaction);
              }).toList(),
            ),
          );
        },
      ),
    );
  }