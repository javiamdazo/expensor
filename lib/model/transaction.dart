import 'package:expensor/model/account.dart';
import 'package:expensor/model/category.dart';

class Transaction {
  String type;
  String description;
  DateTime date;
  double amount;
  Category? category;
  Account account;

  Transaction({
    required this.type,
    required this.description,
    required this.date,
    required this.amount,
    required this.category,
    required this.account,
  });
}
