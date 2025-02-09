import 'package:expensor/data/entity/transaction_entity.dart';
import 'package:expensor/data/repositories/transactions_repository.dart';
import 'package:expensor/provider/accounts_provider.dart';
import 'package:expensor/provider/categories_provider.dart';
import 'package:expensor/provider/model/transaction.dart';
import 'package:expensor/provider/transactions_type_provider.dart';
import 'package:flutter/material.dart';

class TransactionsProvider extends ChangeNotifier {
  final TransactionsRepository _transactionsRepository =
      TransactionsRepository.instance;

  final CategoriesProvider categoriesProvider;
  final AccountsProvider accountsProvider;
  final TransactionsTypeProvider transactionsTypeProvider;

  TransactionsProvider(
      {required this.categoriesProvider,
      required this.accountsProvider,
      required this.transactionsTypeProvider}) {
    loadTransactions();
  }

  List<Transaction> _transactions = [];

  List<Transaction> get transactionsList => _transactions;

  double getTodayAmount(){
    return _transactions.fold(0, (sum, account) => sum + account.amount);
  }

  Future<void> loadTransactions() async {
    final transactions = await _transactionsRepository.list();

    _transactions = [];

    for (var transaction in transactions) {
      final category = await categoriesProvider.read(transaction.categoryId);
      final account = await accountsProvider.read(transaction.accountId);
      final transactionType =
          await transactionsTypeProvider.read(transaction.transactionTypeId);

        accountsProvider.update(account.accountId, account.name, account.icon, account.balance - transaction.amount, account.color);

      _transactions.add(
          Transaction.fromMap(transaction, category, account, transactionType));
    }

    notifyListeners();
  }

  void add(int transactionTypeId, String description, DateTime date,
      double amount, int accountId, int categoryId) {
    _transactionsRepository.add(
        transactionTypeId, description, date, amount, accountId, categoryId);
    loadTransactions();
  }

  void delete(int transactionId) {
    _transactionsRepository.delete(transactionId);
    loadTransactions();
  }

  void update(int transactionId, int transactionTypeId, String description,
      DateTime date, double amount, int accountId, int categoryId) {
    _transactionsRepository.update(transactionId, transactionTypeId,
        description, date, amount, accountId, categoryId);
    loadTransactions();
  }

  Future<TransactionEntity?> read(int transactionId) async {
    return await _transactionsRepository.get(transactionId);
  }
}
