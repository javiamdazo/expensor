import 'package:expensor/pages/accounts/transaction_item.dart';
import 'package:expensor/provider/model/account.dart';
import 'package:expensor/provider/model/transaction.dart';
import 'package:expensor/widgets/formatted_number.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AccountItem extends StatelessWidget {
  final Account account;
  final Function onTap;
  final int index;
  final int currentIndex;
  final bool isExpanded;
  AccountItem(
      {Key? key,
      required this.account,
      required this.onTap,
      required this.index,
      required this.currentIndex,
      required this.isExpanded});

  @override
  Widget build(BuildContext context) {
    Map<DateTime, List<Transaction>> transactions =
        account.transactions ?? {};

    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Column(
          children: [
            ListTile(
              onTap: () => {onTap()},
              leading: Container(
                decoration: BoxDecoration(
                    color: account.color.withAlpha(50),
                    borderRadius: const BorderRadius.all(Radius.circular(10))),
                width: 40,
                height: 40,
                child: Icon(
                  account.icon,
                  color: account.color,
                ),
              ),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    account.name,
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                  FormattedNumber(
                      number: account.balance,
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(color: Colors.grey),
                      numberType: NumberType.currency)
                ],
              ),
              trailing: Icon(
                isExpanded
                    ? Icons.keyboard_arrow_up
                    : Icons.keyboard_arrow_down_sharp,
                color: Theme.of(context).iconTheme.color,
              ),
            ),
            AnimatedSize(
              duration:
                  const Duration(milliseconds: 300), 
              curve: Curves.easeInOut, 
              child: isExpanded
                  ? ListView.builder(
                      shrinkWrap: true, 
                      physics:
                          const NeverScrollableScrollPhysics(), 
                      itemCount: transactions.length,
                      itemBuilder: (context, index) {
                        var entry = transactions.entries.toList()[
                            index]; 
                        DateTime date = entry.key;
                        List<Transaction> transactionList = entry.value;

                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
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
                    )
                  : const SizedBox(), // Espacio vacío cuando no está expandido
            ),
            const Divider(
              height: 1,
            )
          ],
        ));
  }
}
