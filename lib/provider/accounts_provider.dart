import 'package:expensor/data/entity/account_entity.dart';
import 'package:expensor/data/repositories/accounts_repository.dart';
import 'package:expensor/provider/model/account.dart';
import 'package:flutter/material.dart';

class AccountsProvider extends ChangeNotifier {
  final AccountsRepository _accountsRepository = AccountsRepository.instance;

  List<Account> _accounts = [];

  AccountsProvider() {
    loadAccounts();
  }

  List<Account> get accountsList => _accounts;

  double totalAmount() {
    return _accounts.fold(0, (sum, account) => sum + account.balance);
  }

  Future<void> loadAccounts() async {
    final accounts = await _accountsRepository.list();

    _accounts = [];
    accounts.forEach((account) {
      _accounts.add(Account.fromMap(account));
    });

    notifyListeners();
  }

  void add(String name, IconData icon, double balance, Color color) {
    _accountsRepository.add(name, icon, balance, color);
    loadAccounts();
  }

  void delete(int accountId) {
    _accountsRepository.delete(accountId);
    loadAccounts();
  }

  void update(
      int accountId, String name, IconData icon, double balance, Color color) {
    _accountsRepository.update(accountId, name, icon, balance, color);
    loadAccounts();
  }

  Future<Account> read(int accountId) async {
    AccountEntity? accountEntity = await _accountsRepository.get(accountId);
    if (accountEntity == null) {
      throw Exception();
    }

    return Account.fromMap(accountEntity);
  }
}
