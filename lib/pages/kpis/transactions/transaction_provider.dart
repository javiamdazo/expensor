import 'package:expensor/model/account.dart';
import 'package:expensor/model/category.dart';
import 'package:expensor/model/transaction.dart';
import 'package:flutter/material.dart';

class TransactionProvider {
  static double totalMoney = 12345.67;
  static double totalExpense = 5000.67;
  static double totalIncome = 12345.67;
  static double remainingMoney = 3247.41;

  // Replace raw list of maps with a list of Transaction objects
  static final List<Transaction> transactions = [
    Transaction(
        type: 'income',
        description: 'Depósito',
        date: DateTime.parse('2025-01-01'),
        amount: 1200.00,
        category:
            Category(name: 'Salario', icon: Icons.work, color: Colors.green),
        account: Account(color: Colors.purple,name: 'Globalcaja', balance: 250, icon: Icons.wallet,)),
    Transaction(
        type: 'expense',
        description: 'Pago de factura',
        date: DateTime.parse('2024-12-31'),
        amount: -300.00,
        category:
            Category(name: 'Comida', icon: Icons.fastfood, color: Colors.red),
        account: Account(color: Colors.purple,name: 'Globalcaja', balance: 250, icon: Icons.wallet,)),
    Transaction(
        type: 'income',
        description: 'Transferencia recibida',
        date: DateTime.parse('2024-12-30'),
        amount: 500.00,
        category: Category(
            name: 'Servicios', icon: Icons.lightbulb, color: Colors.blue),
        account: Account(color: Colors.purple,name: 'Globalcaja', balance: 250, icon: Icons.wallet,)),
    Transaction(
        type: 'expense',
        description: 'Compra de comida',
        date: DateTime.parse('2025-01-01'),
        amount: -50.00,
        category: Category(
            name: 'Freelance', icon: Icons.person, color: Colors.purple),
        account: Account(color: Colors.purple,name: 'Globalcaja', balance: 250, icon: Icons.wallet,)),
    Transaction(
        type: 'income',
        description: 'Pago por freelance',
        date: DateTime.parse('2025-01-02'),
        amount: 250.00,
        category: Category(
            name: 'Venta', icon: Icons.shopping_cart, color: Colors.orange),
        account: Account(color: Colors.purple,name: 'Globalcaja', balance: 250, icon: Icons.wallet,)),
  ];

  // Get all transactions ordered by date (most recent first)
  static List<Transaction> getTransactions() {
    transactions
        .sort((a, b) => b.date.compareTo(a.date)); // Sort by date, descending
    return transactions;
  }

  // Group transactions by category
  static Map<String, List<Transaction>> getTransactionsByCategory() {
    Map<String, List<Transaction>> groupedTransactions = {};

    for (var transaction in transactions) {
      final Category? category = transaction.category;
      if (category != null) {
        if (!groupedTransactions.containsKey(category.name)) {
          groupedTransactions[category.name] = [];
        }
        groupedTransactions[category.name]!.add(transaction);
      }
    }

    return groupedTransactions;
  }
}
