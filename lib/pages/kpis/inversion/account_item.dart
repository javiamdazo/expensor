import 'package:expensor/model/inversion_account.dart';
import 'package:expensor/widgets/formatted_number.dart';
import 'package:expensor/widgets/profitability.dart';
import 'package:expensor/widgets/space.dart';
import 'package:flutter/material.dart';

class AccountItem extends StatelessWidget {
  InversionAccount inversionAccount;
  final bool hideData;
  AccountItem({super.key, required this.inversionAccount, required this.hideData});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Row(
          children: [
            Icon(
              inversionAccount.account.icon,
              size: 30,
              color: inversionAccount.account.color,
            ),
            Space(
              space: SpaceEnum.triple,
              spaceType: SpaceType.width,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  inversionAccount.account.name,
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
          number: inversionAccount.totalBalance,
          style: Theme.of(context).textTheme.labelLarge,
          numberType: NumberType.currency,
          hideData: hideData,
        )
      ]),
    );
  }
}
