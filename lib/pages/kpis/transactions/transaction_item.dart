import 'package:expensor/model/transaction.dart';
import 'package:expensor/widgets/formatted_number.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionItem extends StatelessWidget {
  final bool isIncome;
  final Transaction transaction;

  const TransactionItem({super.key, required this.isIncome, required this.transaction});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: transaction.category?.color.withAlpha(100),
        child: Icon(
          transaction.category?.icon,
          color: transaction.category?.color,
        ),
      ),
      title: Text(
        transaction.description,
        style: Theme.of(context).textTheme.labelLarge,
      ),
      subtitle: transaction.category != null
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  transaction.category!.name,
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
                      transaction.account.name,
                      style: Theme.of(context).textTheme.labelSmall,
                    )
                  ],
                ),
              ],
            )
          : null,
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FormattedNumber(
            number: transaction.amount,
            style: Theme.of(context).textTheme.labelLarge,
            numberType: NumberType.currency
          ),
          Text(
            DateFormat('d MMM y').format(transaction.date),
            style: Theme.of(context)
                .textTheme
                .labelSmall,
          )
        ],
      ),
    );
  }
}
