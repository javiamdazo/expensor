import 'package:expensor/provider/model/transaction.dart';
import 'package:expensor/provider/model/transaction_type.dart';
import 'package:expensor/widgets/formatted_number.dart';
import 'package:flutter/material.dart';

class TransactionItem extends StatelessWidget {
  final Transaction transaction;
  const TransactionItem({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    final category = transaction.category;
    final transactionType = transaction.transactionType;

    final Brightness brightness = Theme.of(context).brightness;
    final Color textColor =
        brightness == Brightness.dark ? Colors.white : Colors.black;

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
        style:
            Theme.of(context).textTheme.labelLarge!.copyWith(color: textColor),
      ),
      subtitle: Text(
        category.name,
        style:
            Theme.of(context).textTheme.labelSmall!.copyWith(color: textColor),
      ),
      trailing: FormattedNumber(
          number: getNumber(transaction.amount, transactionType),
          style: Theme.of(context)
              .textTheme
              .labelMedium!
              .copyWith(color: textColor),
          numberType: NumberType.currency),
    );
  }

  double getNumber(double amount, TransactionType transactionType) {
    return transactionType.transactionTypeId == 0 ? amount : amount * -1;
  }
}
