import 'package:expensor/pages/accounts/transaction_item.dart';
import 'package:expensor/provider/model/account.dart';
import 'package:expensor/provider/model/transaction.dart';
import 'package:expensor/widgets/formatted_number.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AccountItem extends StatelessWidget {
  const AccountItem(
      {Key? key,
      required this.account,
      required this.onTap,
      required this.index,
      required this.currentIndex,
      required this.isExpanded});

  final Account account;
  final Function onTap;
  final int index;
  final int currentIndex;
  final bool isExpanded;

  @override
  Widget build(BuildContext context) {
    Map<DateTime, List<Transaction>> transactions = account.transactions ?? {};

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
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium!
                        .copyWith(color: Colors.white),
                  ),
                  isExpanded
                      ? const SizedBox()
                      : FormattedNumber(
                          number: account.balance,
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(color: Colors.grey),
                          numberType: NumberType.currency)
                ],
              ),
              trailing: isExpanded
                  ? Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                            onPressed: () => {},
                            icon: const Icon(Icons.search)),
                        IconButton(
                            onPressed: () => {},
                            icon: const Icon(Icons.mode_edit_sharp)),
                        Icon(
                          Icons.keyboard_arrow_up,
                          color: Theme.of(context).iconTheme.color,
                        ),
                      ],
                    )
                  : Icon(
                      Icons.keyboard_arrow_down_sharp,
                      color: Theme.of(context).iconTheme.color,
                    ),
            ),
            AnimatedSize(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              child: isExpanded
                  ? Column(
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
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8.0),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        DateFormat('dd/MM/yyyy').format(date),
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelSmall,
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

class AccountFastFilter extends StatelessWidget {
  const AccountFastFilter(
      {super.key, required this.text, required this.applied});

  final String text;
  final bool applied;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 2),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
          color: applied
              ? Theme.of(context).colorScheme.primary.withAlpha(200)
              : null,
          border: applied
              ? Border.all()
              : Border.all(
                  color: Theme.of(context).colorScheme.primary, width: 3),
          borderRadius: const BorderRadius.all(Radius.circular(20))),
      child: Text(
        text,
        style: Theme.of(context).textTheme.labelMedium,
      ),
    );
  }
}
