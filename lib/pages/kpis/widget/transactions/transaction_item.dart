import 'package:expensor/model/transaction.dart';
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
        backgroundColor: transaction.category?.color,
        child: Icon(
          transaction.category?.icon,
          color: Colors.white,
        ),
      ),
      title: Text(
        transaction.description,
        style: Theme.of(context).textTheme.labelMedium,
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
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            '${transaction.amount.toString()} €',
            style: Theme.of(context).textTheme.labelMedium,
          ),
          Text(
            DateFormat('d MMM y').format(transaction.date),
            style: Theme.of(context)
                .textTheme
                .labelSmall
                ?.copyWith(color: Colors.white),
          )
        ],
      ),
    );
  }
}
