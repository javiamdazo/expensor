import 'package:expensor/provider/model/account.dart';
import 'package:expensor/widgets/formatted_number.dart';
import 'package:expensor/widgets/space.dart';
import 'package:flutter/material.dart';

class AccountKpiItem extends StatelessWidget {
  final Account account;
  final bool hideData;
  const AccountKpiItem({super.key, required this.account, required this.hideData});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Row(
          children: [
            Icon(
              account.icon,
              size: 30,
              color: account.color,
            ),
            Space(
              space: SpaceEnum.triple,
              spaceType: SpaceType.width,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  account.name,
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                Text(
                  'Last movement: 14.4 €',
                  style: Theme.of(context).textTheme.labelSmall,
                ),
              ],
            )
          ],
        ),
        FormattedNumber(
          number: account.balance,
          style: Theme.of(context).textTheme.labelLarge,
          numberType: NumberType.currency,
          hideData: hideData,
        )
      ]),
    );
  }
}
