import 'package:expensor/model/account.dart';
import 'package:expensor/model/inversion_account.dart';
import 'package:flutter/material.dart';

class AccountsProvider {
  static final List<InversionAccount> inversionAccounts = [
    InversionAccount(
      account: Account(
        accountId: 1,
        color: Colors.blue,
        icon: Icons.account_balance_wallet,
        name: "Cuenta de Ahorro",
        balance: 5000.00,
        lastUpdate: DateTime.now(),
      ),
      pL: 9.68,
      totalBalance: 5250.00,
    ),
    InversionAccount(
      account: Account(
        accountId: 2,
        color: Colors.green,
        icon: Icons.show_chart_outlined,
        name: "Fondo de Inversión",
        balance: 10000.00,
        lastUpdate: DateTime.now(),
      ),
      pL: -2.45,
      totalBalance: 9850.00,
    ),
    InversionAccount(
      account: Account(
        accountId: 3,
        color: Colors.orange,
        icon: Icons.currency_bitcoin,
        name: "Criptomonedas",
        balance: 8000.00,
        lastUpdate: DateTime.now(),
      ),
      pL: 4.78,
      totalBalance: 9200.00,
    ),
  ];

  static List<InversionAccount> getInversionAccounts() {
    return inversionAccounts;
  }
}
