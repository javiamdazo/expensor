import 'package:expensor/model/transaction.dart';
import 'package:expensor/pages/transaction/transaction_provider.dart';
import 'package:expensor/pages/transaction/widget/list_transactions.dart';
import 'package:expensor/pages/transaction/widget/list_transactions_by_categories.dart';
import 'package:expensor/pages/transaction/widget/resume_kpi.dart';
import 'package:flutter/material.dart';

class TransactionsPage extends StatefulWidget {
  const TransactionsPage({super.key});

  @override
  State<TransactionsPage> createState() => _TransactionsPageState();
}

class _TransactionsPageState extends State<TransactionsPage> {
  bool byCategory = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: [
              Card(
                margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: buildResumeKpi(),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Transacciones",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              IconButton(
                  onPressed: () {
                    setState(() {
                      byCategory = byCategory ? false : true;
                    });
                  },
                  icon:
                      Icon(byCategory ? Icons.calendar_month : Icons.category))
            ],
          ),
          const SizedBox(height: 10), // Separación entre el título y el listado
          byCategory
              ? buildListTransactionsByCategories()
              : buildListTransactions()
        ],
      ),
    );
  }
  
}
