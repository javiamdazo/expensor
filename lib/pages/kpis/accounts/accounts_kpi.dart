import 'package:expensor/data/mock/accounts_mock.dart';
import 'package:expensor/pages/kpis/accounts/account_kpi_item.dart';
import 'package:expensor/pages/kpis/kpi_builder.dart';
import 'package:expensor/widgets/formatted_number.dart';
import 'package:expensor/widgets/profitability.dart';
import 'package:expensor/widgets/space.dart';
import 'package:flutter/material.dart';

class AccountsKpi extends StatelessWidget {
  final bool hideData;
  final Function(int) changeTab; // Pass a function to change ta
  AccountsKpi({super.key, required this.changeTab, required this.hideData});

  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;

    return KpiBuilder(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            GestureDetector(
              onTap: () => {
                changeTab(2)
              },
              child: Row(
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
                            .displaySmall!
                            .copyWith(
                                color: Theme.of(context)
                                    .colorScheme
                                    .onPrimaryContainer),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      FormattedNumber(
                        number: AccountsMock.getTotalAmount(),
                        style: Theme.of(context).textTheme.titleMedium,
                        numberType: NumberType.currency,
                        hideData: hideData,
                      ),
                      Row(
                        children: [
                          Text(
                            "Last Month",
                            style: Theme.of(context)
                                .textTheme
                                .displaySmall!
                                .copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onPrimaryContainer),
                          ),
                          Space(spaceType: SpaceType.width),
                          Profitability(
                              number: 6.9,
                              style: Theme.of(context)
                                  .textTheme
                                  .displaySmall!
                                  .copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primaryContainer)),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
            Space(),
            Card(
                child: SizedBox(
                    height: height * 0.20,
                    child: ListView.builder(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 10),
                      itemCount: AccountsMock.accounts.length,
                      itemBuilder: (context, index) {
                        return AccountKpiItem(
                          hideData: hideData,
                          account: AccountsMock.accounts[index],
                        );
                      },
                    ))),
          ],
        ),
      ),
    );
  }
}
