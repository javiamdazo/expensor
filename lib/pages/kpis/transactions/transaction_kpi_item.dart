import 'package:expensor/provider/model/transaction.dart';
import 'package:expensor/widgets/formatted_number.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionKpiItem extends StatelessWidget {
  final Transaction transaction;

  const TransactionKpiItem({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    final account = transaction.account;
    final category = transaction.category;
    //final transactionType = transaction.transactionType;

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
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            category.name,
            style: Theme.of(context).textTheme.labelSmall,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Icon(
                Icons.wallet,
                size: 15,
                color: Colors.grey,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                account.name,
                style: Theme.of(context).textTheme.labelSmall,
              )
            ],
          ),
        ],
      ),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FormattedNumber(
              number: transaction.amount,
              style: Theme.of(context).textTheme.labelLarge,
              numberType: NumberType.currency),
          Text(
            DateFormat('d MMM y').format(transaction.date),
            style: Theme.of(context).textTheme.labelSmall,
          )
        ],
      ),
    );
  }
}
