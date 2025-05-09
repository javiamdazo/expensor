class TransactionTypeEntity {
  final int transactionTypeId;
  final String name;

  TransactionTypeEntity({
    required this.transactionTypeId,
    required this.name,
  });

  factory TransactionTypeEntity.fromMap(Map<String, dynamic> map) {
    return TransactionTypeEntity(
      transactionTypeId: map['transaction_type_id'],
      name: map['name'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'transaction_type_id': transactionTypeId,
      'name': name,
    };
  }
}