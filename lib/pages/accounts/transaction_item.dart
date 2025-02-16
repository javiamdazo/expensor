import 'package:expensor/provider/model/transaction.dart';
import 'package:expensor/provider/model/transaction_type.dart';
import 'package:expensor/widgets/formatted_number.dart';
import 'package:flutter/material.dart';

class TransactionItem extends StatelessWidget {
  final Transaction transaction;
  TransactionItem({Key? key, required this.transaction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final category = transaction.category;
    final transactionType = transaction.transactionType;

    return ListTile(
      leading: CircleAvatar(
        backgroundColor: category.color.withAlpha(100),
        child: Icon(
          category.icon,
          color: category.color,
        ),
      ),
      title: Text(
        transaction.description,
        style: Theme.of(context).textTheme.labelLarge,
      ),
      subtitle: Text(
        category.name,
        style: Theme.of(context).textTheme.labelSmall,
      ),
      trailing: FormattedNumber(
            number: getNumber(transaction.amount, transactionType),
            style: Theme.of(context).textTheme.labelMedium,
            numberType: NumberType.currency),
    );
  }

  double getNumber(double amount, TransactionType transactionType){
    return transactionType.transactionTypeId == 0
            ? amount
            : amount * -1;
  }
}
