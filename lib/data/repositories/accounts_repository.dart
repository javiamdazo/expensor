import 'package:expensor/accounts/entity/account_entity.dart';
import 'package:expensor/services/database_service.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class AccountsRepository {
  static final AccountsRepository instance = AccountsRepository._constructor();
  AccountsRepository._constructor();

  static const _tableName = 'accounts';

  Future<List<AccountEntity>> list() async {
    final db = await DatabaseService.instance.getDatabase();

    final accounts = await db.query(_tableName);
    return accounts.map((account) => AccountEntity.fromMap(account)).toList();
  }

  void add(String name, IconData icon, double balance, Color color) async {
    final Database db = await DatabaseService.instance.getDatabase();
    db.insert(_tableName, {
      'name': name,
      'amount': balance,
      'icon': icon.codePoint.toString(),
      'color': color.value,
      'last_update': DateTime.now().toIso8601String()
    });
  }

  void delete(int accountId) async {
    final Database db = await DatabaseService.instance.getDatabase();
    db.delete(_tableName, where: 'account_id = ?', whereArgs: [accountId]);
  }

  void update(int accountId, String name, IconData icon, double balance,
      Color color) async {
    final Database db = await DatabaseService.instance.getDatabase();
    db.update(
        _tableName,
        {
          'name': name,
          'amount': balance,
          'icon': icon.codePoint.toString(),
          'color': color.value,
          'last_update': DateTime.now().toIso8601String()
        },
        where: 'account_id = ?',
        whereArgs: [accountId]);
  }

  Future<AccountEntity?> get(int accountId) async {
    final Database db = await DatabaseService.instance.getDatabase();
    final accounts = await db
        .query(_tableName, where: 'account_id = ?', whereArgs: [accountId]);
    if (accounts.isEmpty) {
      return null;
    }
    return AccountEntity.fromMap(accounts.first);
  }
}
