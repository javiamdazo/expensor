class Transaction {
  String type;
  String description;
  DateTime date;
  double amount;
  String? category;

  Transaction({
    required this.type,
    required this.description,
    required this.date,
    required this.amount,
    required this.category,
  });
}