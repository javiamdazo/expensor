import 'package:expensor/data/entity/transaction_entity.dart';
import 'package:expensor/services/database_service.dart';

class TransactionsRepository {
  static final TransactionsRepository instance = TransactionsRepository._constructor();
  TransactionsRepository._constructor();

  static const _tableName = 'transactions';

  Future<List<TransactionEntity>> list() async {
    final db = await DatabaseService.instance.getDatabase();

    final transactions = await db.query(_tableName);
    return transactions.map((transaction) => TransactionEntity.fromMap(transaction)).toList();
  }

  void add(int transactionTypeId, String description, DateTime date, double amount, int accountId, int categoryId) async {
    final db = await DatabaseService.instance.getDatabase();
    db.insert(_tableName, {
      'transaction_type_id': transactionTypeId,
      'description': description,
      'date': date.toIso8601String(),
      'amount': amount,
      'account_id': accountId,
      'category_id': categoryId,
    });
  }

  void delete(int transactionId) async {
    final db = await DatabaseService.instance.getDatabase();
    db.delete(_tableName, where: 'transaction_id = ?', whereArgs: [transactionId]);
  }

  void update(int transactionId, int transactionTypeId, String description, DateTime date, double amount, int accountId, int categoryId) async {
    final db = await DatabaseService.instance.getDatabase();
    db.update(_tableName, {
      'transaction_type_id': transactionTypeId,
      'description': description,
      'date': date.toIso8601String(),
      'amount': amount,
      'account_id': accountId,
      'category_id': categoryId,
    }, where: 'transaction_id = ?', whereArgs: [transactionId]);
  }

  Future<TransactionEntity?> get(int transactionId) async {
    final db = await DatabaseService.instance.getDatabase();
    final transactions = await db.query(_tableName, where: 'transaction_id = ?', whereArgs: [transactionId]);
    if (transactions.isEmpty) {
      return null;
    }
    return TransactionEntity.fromMap(transactions.first);
  }
}