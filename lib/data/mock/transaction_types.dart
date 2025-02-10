import 'package:expensor/provider/model/transaction_type.dart';

class TransactionTypesMock {
  static final List<TransactionType> transactionTypes = [
    TransactionType(transactionTypeId: 1, name: "Expense"),
    TransactionType(transactionTypeId: 2, name: "Income"),
    TransactionType(transactionTypeId: 3, name: "Transfer"),
  ];

  /// Agrega un nuevo tipo de transacción
  static void add(String name) {
    int newId = transactionTypes.isNotEmpty ? transactionTypes.last.transactionTypeId + 1 : 1;
    transactionTypes.add(TransactionType(transactionTypeId: newId, name: name));
  }

  /// Elimina un tipo de transacción por ID
  static void remove(int transactionTypeId) {
    transactionTypes.removeWhere((type) => type.transactionTypeId == transactionTypeId);
  }

  /// Obtiene un tipo de transacción por ID
  static TransactionType? getById(int transactionTypeId) {
    return transactionTypes.firstWhere(
      (type) => type.transactionTypeId == transactionTypeId,
      orElse: () => throw Exception(),
    );
  }

  /// Obtiene todos los tipos de transacción
  static List<TransactionType> getAll() {
    return List.from(transactionTypes);
  }
}