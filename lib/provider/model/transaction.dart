import 'package:expensor/data/entity/transaction_entity.dart';
import 'package:expensor/accounts/model/account.dart';
import 'package:expensor/provider/model/category.dart';
import 'package:expensor/provider/model/transaction_type.dart';

class Transaction {
  int transactionId;
  TransactionType transactionType;
  String description;
  DateTime date;
  double amount;
  Category category;
  Account account;

  Transaction({
    required this.transactionId,
    required this.transactionType,
    required this.description,
    required this.date,
    required this.amount,
    required this.category,
    required this.account,
  });

  factory Transaction.fromMap(TransactionEntity transaction, Category category,
      Account account, TransactionType transactionType) {
    return Transaction(
      transactionId: transaction.transactionId!,
      transactionType: transactionType,
      description: transaction.description,
      date: transaction.date,
      amount: transaction.amount,
      category: category,
      account: account,
    );
  }
}
