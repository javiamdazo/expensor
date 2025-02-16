import 'package:expensor/pages/accounts/account_item.dart';
import 'package:expensor/pages/accounts/transaction_item.dart';
import 'package:expensor/provider/model/account.dart';
import 'package:expensor/provider/model/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AccountItemDetail extends StatelessWidget {
  const AccountItemDetail({required this.account, required this.onTap});

  final Account account;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    Map<DateTime, List<Transaction>> transactions = account.transactions ?? {};
    return Column(
      children: [
        Hero(
            tag: 'accountTitle-${account.accountId}',
            child: AccountItem(account: account, onTap: onTap)),
        AnimatedSize(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const AccountFastFilter(
                      text: "Today",
                      applied: false,
                    ),
                    const AccountFastFilter(
                      text: "One week ago",
                      applied: true,
                    ),
                    const AccountFastFilter(
                      text: "Last 3 months",
                      applied: false,
                    ),
                    IconButton(
                      onPressed: () => {},
                      icon: const Icon(Icons.calendar_month),
                      color: Theme.of(context).iconTheme.color,
                    )
                  ],
                ),
                SizedBox(
                  // Evita el error de `Expanded`
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: transactions.length,
                    itemBuilder: (context, index) {
                      var entry = transactions.entries.toList()[index];
                      DateTime date = entry.key;
                      List<Transaction> transactionList = entry.value;

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                DateFormat('dd/MM/yyyy').format(date),
                                style: Theme.of(context).textTheme.labelSmall,
                              ),
                            ),
                          ),
                          ...transactionList.map((transaction) =>
                              TransactionItem(transaction: transaction))
                        ],
                      );
                    },
                  ),
                ),
              ],
            ) // Espacio vacío cuando no está expandido
            ),
      ],
    );
  }
}
