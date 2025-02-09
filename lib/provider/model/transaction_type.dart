import 'package:expensor/data/entity/transaction_type_entity.dart';

class TransactionType {
  final int transactionTypeId;
  final String name;

  TransactionType({
    required this.transactionTypeId,
    required this.name,
  });

  factory TransactionType.fromMap(TransactionTypeEntity transactionTypeEntity) {
    return TransactionType(
      transactionTypeId: transactionTypeEntity.transactionTypeId,
      name: transactionTypeEntity.name,
    );
  }
}