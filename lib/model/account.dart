import 'package:flutter/material.dart';

class Account {
  int? accountId;
  IconData icon;
  String name;
  double balance;
  Color color;
  DateTime? lastUpdate;

  Account({
    this.accountId,
    required this.name,
    required this.balance,
    required this.icon,
    required this.color,
    this.lastUpdate
  });

  static Account fromMap(Map<String, dynamic> map) {
    Color color = Color(int.parse(map['color']));
    IconData icon = IconData(int.parse(map['icon']), fontFamily: 'MaterialIcons');

    return Account(
      accountId: map['account_id'],
      name: map['name'],
      balance: map['amount'],
      icon: icon,
      color: Colors.red,
      lastUpdate: DateTime.parse(map['last_update'])
    );
  }
}
