import 'package:expensor/pages/kpis/inversion/accounts_provider.dart';
import 'package:expensor/pages/kpis/inversion/account_item.dart';
import 'package:expensor/pages/kpis/kpi_builder.dart';
import 'package:expensor/widgets/formatted_number.dart';
import 'package:expensor/widgets/profitability.dart';
import 'package:expensor/widgets/space.dart';
import 'package:flutter/material.dart';

class AccountsKpi extends StatelessWidget {
  final bool hideData;
  const AccountsKpi({super.key, required this.hideData});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return KpiBuilder(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Accounts",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(
                      "View details",
                      style: Theme.of(context)
                          .textTheme
                          .displaySmall
                          ?.copyWith(color: Theme.of(context).primaryColor),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    FormattedNumber(
                        number: 7200,
                        style: Theme.of(context).textTheme.titleMedium,
                        numberType: NumberType.currency,
                        hideData: hideData,),
                    Row(
                      children: [
                        Text(
                          "Last Month",
                          style: Theme.of(context).textTheme.displaySmall,
                        ),
                        Space(spaceType: SpaceType.width),
                        Profitability(
                            number: 6.9,
                            style: Theme.of(context).textTheme.displaySmall),
                      ],
                    )
                  ],
                )
              ],
            ),
            Space(),
            Card(
                child: SizedBox(
                    height: height * 0.20,
                    child: ListView.builder(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 10),
                        itemCount:
                            AccountsProvider.getInversionAccounts()
                                .length,
                        itemBuilder: (context, index) {
                          return AccountItem(
                            hideData: hideData,
                            inversionAccount: AccountsProvider
                                .getInversionAccounts()[index],
                          );
                        }))),
          ],
        ),
      ),
    );
  }
}
