class TransactionEntity {
  int? transactionId;
  int transactionTypeId;
  String description;
  DateTime date;
  double amount;
  int categoryId;
  int accountId;

  TransactionEntity({
    this.transactionId,
    required this.transactionTypeId,
    required this.description,
    required this.date,
    required this.amount,
    required this.categoryId,
    required this.accountId,
  });

  factory TransactionEntity.fromMap(Map<String, dynamic> map) {
    return TransactionEntity(
      transactionId: map['transaction_id'],
      transactionTypeId: map['transaction_type_id'],
      description: map['description'],
      date: DateTime.parse(map['date']),
      amount: map['amount'],
      categoryId: map['category_id'],
      accountId: map['account_id'],
    );
  }
}
