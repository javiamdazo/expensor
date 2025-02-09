import 'package:expensor/data/entity/account_entity.dart';
import 'package:flutter/material.dart';

class Account {
  int accountId;
  IconData icon;
  String name;
  double balance;
  Color color;
  DateTime lastUpdate;

  Account({
    required this.accountId,
    required this.name,
    required this.balance,
    required this.icon,
    required this.color,
    required this.lastUpdate
  });

  static Account fromMap(AccountEntity account) {
    return Account(
      accountId: account.accountId!,
      name: account.name,
      balance: account.balance,
      icon: account.icon,
      color: account.color,
      lastUpdate: account.lastUpdate!
    );
  }
}
