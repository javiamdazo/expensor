import 'package:expensor/model/transaction.dart';

class TransactionProvider {
  static double totalMoney = 12345.67;
  static double totalExpense = 5000.67;
  static double totalIncome = 12345.67;
  static double remainingMoney = 1000;

  // Replace raw list of maps with a list of Transaction objects
  static final List<Transaction> transactions = [
    Transaction(
      type: 'income',
      description: 'Depósito',
      date: DateTime.parse('2025-01-01'),
      amount: 1200.00,
      category: 'Salario',
    ),
    Transaction(
      type: 'expense',
      description: 'Pago de factura',
      date: DateTime.parse('2024-12-31'),
      amount: -300.00,
      category: 'Servicios',
    ),
    Transaction(
      type: 'income',
      description: 'Transferencia recibida',
      date: DateTime.parse('2024-12-30'),
      amount: 500.00,
      category: 'Venta',
    ),
    Transaction(
      type: 'expense',
      description: 'Compra de comida',
      date: DateTime.parse('2025-01-01'),
      amount: -50.00,
      category: 'Comida',
    ),
    Transaction(
      type: 'income',
      description: 'Pago por freelance',
      date: DateTime.parse('2025-01-02'),
      amount: 250.00,
      category: 'Freelance',
    ),
    Transaction(
      type: 'income',
      description: 'Depósito',
      date: DateTime.parse('2025-01-01'),
      amount: 1200.00,
      category: 'Salario',
    ),
    Transaction(
      type: 'expense',
      description: 'Pago de factura',
      date: DateTime.parse('2024-12-31'),
      amount: -300.00,
      category: 'Servicios',
    ),
    Transaction(
      type: 'income',
      description: 'Transferencia recibida',
      date: DateTime.parse('2024-12-30'),
      amount: 500.00,
      category: 'Venta',
    ),
    Transaction(
      type: 'expense',
      description: 'Compra de comida',
      date: DateTime.parse('2025-01-01'),
      amount: -50.00,
      category: 'Comida',
    ),
    Transaction(
      type: 'income',
      description: 'Pago por freelance',
      date: DateTime.parse('2025-01-02'),
      amount: 250.00,
      category: 'Freelance',
    ),
  ];

  // Get all transactions ordered by date (most recent first)
  static List<Transaction> getTransactions() {
    transactions.sort((a, b) => b.date.compareTo(a.date)); // Sort by date, descending
    return transactions;
  }

  // Group transactions by category
  static Map<String, List<Transaction>> getTransactionsByCategory() {
    Map<String, List<Transaction>> groupedTransactions = {};

    for (var transaction in transactions) {
      final category = transaction.category;
      if (!groupedTransactions.containsKey(category)) {
        groupedTransactions[category] = [];
      }
      groupedTransactions[category]!.add(transaction);
    }

    return groupedTransactions;
  }
}
