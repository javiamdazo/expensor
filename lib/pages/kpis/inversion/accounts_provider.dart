import 'package:expensor/model/account.dart';
import 'package:expensor/model/inversion_account.dart';
import 'package:flutter/material.dart';

class AccountsProvider {
  static final List<InversionAccount> inversionAccounts = [
    InversionAccount(
      account: Account(
        color: Colors.purple,
        icon: Icons.wallet,
        name: "Cuenta de Ahorros",
        balance: 5000.00,
      ),
      pL: 9.68,
      totalBalance: 5250.00,
    ),
    InversionAccount(
      account: Account(
        color: Colors.green,
        icon: Icons.show_chart_outlined,
        name: "Fondo de Inversión",
        balance: 10000.00,
      ),
      pL: -2.45,
      totalBalance: 9850.00,
    ),
    InversionAccount(
      account: Account(
        color: Colors.orange,
        icon: Icons.currency_bitcoin,
        name: "Criptomonedas",
        balance: 8000.00,
      ),
      pL: 4.78,
      totalBalance: 9200.00,
    ),
  ];

  static List<InversionAccount> getInversionAccounts() {
    return inversionAccounts;
  }
}
