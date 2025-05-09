import 'package:expensor/data/entity/transaction_type_entity.dart';
import 'package:expensor/services/database_service.dart';

class TransactionTypeRepository {
  static final TransactionTypeRepository instance = TransactionTypeRepository._constructor();
  TransactionTypeRepository._constructor();

  static const _tableName = 'transaction_types';

  Future<List<TransactionTypeEntity>> list() async {
    final db = await DatabaseService.instance.getDatabase();

    final transactionTypes = await db.query(_tableName);
    return transactionTypes.map((transactionType) => TransactionTypeEntity.fromMap(transactionType)).toList();
  }

  void add(String name) async {
    final db = await DatabaseService.instance.getDatabase();
    db.insert(_tableName, {
      'name': name,
    });
  }

  void delete(int transactionTypeId) async {
    final db = await DatabaseService.instance.getDatabase();
    db.delete(_tableName, where: 'transaction_type_id = ?', whereArgs: [transactionTypeId]);
  }

  void update(int transactionTypeId, String name) async {
    final db = await DatabaseService.instance.getDatabase();
    db.update(_tableName, {
      'name': name,
    }, where: 'transaction_type_id = ?', whereArgs: [transactionTypeId]);
  }

  Future<TransactionTypeEntity?> read(int transactionTypeId) async {
    final db = await DatabaseService.instance.getDatabase();
    final transactionTypes = await db.query(_tableName, where: 'transaction_type_id = ?', whereArgs: [transactionTypeId]);
    if (transactionTypes.isEmpty) {
      return null;
    }
    return TransactionTypeEntity.fromMap(transactionTypes.first);
  }
}