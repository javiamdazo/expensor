import 'package:expensor/accounts/page/account_item_page.dart';
import 'package:expensor/accounts/widgets/account_fast_filter.dart';
import 'package:expensor/common/theme_data.dart';
import 'package:expensor/pages/accounts/transaction_item.dart';
import 'package:expensor/accounts/model/account.dart';
import 'package:expensor/provider/model/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AccountItemDetailPage extends StatelessWidget {
  const AccountItemDetailPage(
      {super.key, required this.account, required this.onTap});

  final Account account;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    Map<DateTime, List<Transaction>> transactions = account.transactions ?? {};

    return Column(
      children: [
        AccountItemPage(account: account, onTap: onTap, selected: true),
        Expanded(
          child: AnimatedSize(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const AccountFastFilter(text: "Today", applied: false),
                      const AccountFastFilter(
                          text: "One week ago", applied: true),
                      const AccountFastFilter(
                          text: "Last 3 months", applied: false),
                      IconButton(
                        onPressed: () => {},
                        icon: const Icon(Icons.calendar_month),
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: transactions.length,
                    itemBuilder: (context, index) {
                      var entry = transactions.entries.toList()[index];
                      DateTime date = entry.key;
                      List<Transaction> transactionList = entry.value;

                      return Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                DateFormat('dd/MM/yyyy').format(date),
                                style: AppThemeData.appTextTheme.labelSmall!
                                    .copyWith(
                                        color:
                                            AppThemeData.textColorByBrightness),
                              ),
                            ),
                            ...transactionList.map(
                              (transaction) =>
                                  TransactionItem(transaction: transaction),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
