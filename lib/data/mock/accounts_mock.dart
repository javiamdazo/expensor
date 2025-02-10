import 'package:expensor/provider/model/account.dart';
import 'package:flutter/material.dart';

class AccountsMock {
  static final List<Account> accounts = [
    Account(
      accountId: 1,
      name: "Cash",
      balance: 500.0,
      icon: Icons.money,
      color: Colors.green,
      lastUpdate: DateTime.now(),
    ),
    Account(
      accountId: 2,
      name: "Bank Account",
      balance: 3500.0,
      icon: Icons.account_balance,
      color: Colors.blue,
      lastUpdate: DateTime.now(),
    ),
    Account(
      accountId: 3,
      name: "Credit Card",
      balance: -1200.0,
      icon: Icons.credit_card,
      color: Colors.red,
      lastUpdate: DateTime.now(),
    ),
    Account(
      accountId: 4,
      name: "Savings",
      balance: 8000.0,
      icon: Icons.savings,
      color: Colors.orange,
      lastUpdate: DateTime.now(),
    ),
    Account(
      accountId: 5,
      name: "Investment",
      balance: 15000.0,
      icon: Icons.trending_up,
      color: Colors.purple,
      lastUpdate: DateTime.now(),
    ),
    Account(
      accountId: 6,
      name: "PayPal",
      balance: 200.0,
      icon: Icons.account_balance_wallet,
      color: Colors.teal,
      lastUpdate: DateTime.now(),
    ),
    Account(
      accountId: 7,
      name: "Business Account",
      balance: 12000.0,
      icon: Icons.business,
      color: Colors.brown,
      lastUpdate: DateTime.now(),
    ),
    Account(
      accountId: 8,
      name: "Crypto Wallet",
      balance: 0.5, // En BTC u otra moneda
      icon: Icons.currency_bitcoin,
      color: Colors.yellow,
      lastUpdate: DateTime.now(),
    ),
    Account(
      accountId: 9,
      name: "Emergency Fund",
      balance: 5000.0,
      icon: Icons.health_and_safety,
      color: Colors.indigo,
      lastUpdate: DateTime.now(),
    ),
    Account(
      accountId: 10,
      name: "Other",
      balance: 100.0,
      icon: Icons.more_horiz,
      color: Colors.grey,
      lastUpdate: DateTime.now(),
    ),
  ];

  static double getTotalAmount() {
    return accounts.fold(0, (sum, transaction) => sum + transaction.balance);
  }

  /// Agregar una nueva cuenta
  static void add(String name, IconData icon, double balance, Color color) {
    int newId = accounts.isNotEmpty ? accounts.last.accountId + 1 : 1;
    accounts.add(
      Account(
        accountId: newId,
        name: name,
        balance: balance,
        icon: icon,
        color: color,
        lastUpdate: DateTime.now(),
      ),
    );
  }

  /// Eliminar una cuenta por ID
  static void remove(int accountId) {
    accounts.removeWhere((account) => account.accountId == accountId);
  }

  /// Actualizar una cuenta existente
  static void update(int accountId,
      {String? name, IconData? icon, double? balance, Color? color}) {
    for (var account in accounts) {
      if (account.accountId == accountId) {
        account.name = name ?? account.name;
        account.icon = icon ?? account.icon;
        account.balance = balance ?? account.balance;
        account.color = color ?? account.color;
        account.lastUpdate = DateTime.now();
        break;
      }
    }
  }

  /// Obtener una cuenta por ID
  static Account? getById(int accountId) {
    return accounts.firstWhere((account) => account.accountId == accountId,
        orElse: () => throw Exception());
  }

  /// Obtener todas las cuentas
  static List<Account> getAll() {
    return List.from(accounts);
  }

  /// Obtener el saldo total de todas las cuentas
  static double getTotalBalance() {
    return accounts.fold(0, (sum, account) => sum + account.balance);
  }
}
