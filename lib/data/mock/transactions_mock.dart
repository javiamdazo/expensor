import 'package:expensor/accounts/mock/accounts_mock.dart';
import 'package:expensor/data/mock/categories_mock.dart';
import 'package:expensor/data/mock/transaction_types.dart';
import 'package:expensor/provider/model/transaction.dart';
import 'package:expensor/provider/model/transaction_type.dart';
import 'package:expensor/provider/model/category.dart';
import 'package:expensor/accounts/model/account.dart';

class TransactionsMock {
  static final List<Transaction> transactions = [
    Transaction(
      transactionId: 1,
      transactionType: TransactionTypesMock.transactionTypes[0],
      description: "Lunch at restaurant",
      date: DateTime.now(),
      amount: 25.0,
      category: CategoriesMock.categories[0], // Food
      account: AccountsMock.accounts[0], // Cash
    ),
    Transaction(
      transactionId: 2,
      transactionType: TransactionTypesMock.transactionTypes[0],
      description: "Bus ticket",
      date: DateTime.now().subtract(const Duration(days: 2)),
      amount: 3.5,
      category: CategoriesMock.categories[1], // Transport
      account: AccountsMock.accounts[1], // Bank Account
    ),
    Transaction(
      transactionId: 3,
      transactionType: TransactionTypesMock.transactionTypes[1],
      description: "Salary deposit",
      date: DateTime.now().subtract(const Duration(days: 5)),
      amount: 3500.0,
      category: CategoriesMock.categories[6], // Salary
      account: AccountsMock.accounts[1], // Bank Account
    ),
    Transaction(
      transactionId: 4,
      transactionType: TransactionTypesMock.transactionTypes[0],
      description: "Movie night",
      date: DateTime.now().subtract(const Duration(days: 3)),
      amount: 15.0,
      category: CategoriesMock.categories[4], // Entertainment
      account: AccountsMock.accounts[0], // Cash
    ),
    Transaction(
      transactionId: 5,
      transactionType: TransactionTypesMock.transactionTypes[1],
      description: "Groceries",
      date: DateTime.now(),
      amount: 120.0,
      category: CategoriesMock.categories[0], // Food
      account: AccountsMock.accounts[1], // Bank Account
    ),
  ];

  static double getTodayAmount() {
    DateTime today = DateTime.now();
    return transactions
        .where((transaction) =>
            transaction.date.year == today.year &&
            transaction.date.month == today.month &&
            transaction.date.day == today.day)
        .fold(0, (sum, transaction) => sum + transaction.amount);
  }

  static List<Transaction> getTodayTransactions() {
    DateTime today = DateTime.now();
    return transactions
        .where((transaction) =>
            transaction.date.year == today.year &&
            transaction.date.month == today.month &&
            transaction.date.day == today.day)
        .toList();
  }

  /// Agrega una nueva transacción
  static void add(TransactionType transactionType, String description,
      double amount, Category category, Account account) {
    int newId =
        transactions.isNotEmpty ? transactions.last.transactionId + 1 : 1;
    transactions.add(
      Transaction(
        transactionId: newId,
        transactionType: transactionType,
        description: description,
        date: DateTime.now(),
        amount: amount,
        category: category,
        account: account,
      ),
    );
  }

  /// Elimina una transacción por ID
  static void remove(int transactionId) {
    transactions.removeWhere(
        (transaction) => transaction.transactionId == transactionId);
  }

  /// Actualiza una transacción existente
  static void update(int transactionId,
      {String? description,
      double? amount,
      Category? category,
      Account? account}) {
    for (var transaction in transactions) {
      if (transaction.transactionId == transactionId) {
        transaction.description = description ?? transaction.description;
        transaction.amount = amount ?? transaction.amount;
        transaction.category = category ?? transaction.category;
        transaction.account = account ?? transaction.account;
        break;
      }
    }
  }

  /// Obtiene una transacción por ID
  static Transaction? getById(int transactionId) {
    return transactions.firstWhere(
        (transaction) => transaction.transactionId == transactionId,
        orElse: () => throw Exception());
  }

  /// Obtiene todas las transacciones
  static List<Transaction> getAll() {
    return List.from(transactions);
  }
}
