import 'package:expensor/model/inversion_account.dart';
import 'package:expensor/widgets/formatted_number.dart';
import 'package:expensor/widgets/profitability.dart';
import 'package:expensor/widgets/space.dart';
import 'package:flutter/material.dart';

class InversionItem extends StatelessWidget {
  InversionAccount inversionAccount;
  InversionItem({super.key, required this.inversionAccount});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
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
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                FormattedNumber(
                  number: inversionAccount.account.balance,
                  style: Theme.of(context).textTheme.labelSmall,
                  numberType: NumberType.currency,
                ),
              ],
            )
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            FormattedNumber(
              number: inversionAccount.totalBalance,
              style: Theme.of(context).textTheme.labelLarge,
              numberType: NumberType.currency,
            ),
            Profitability(
                number: inversionAccount.pL,
                style: Theme.of(context).textTheme.labelSmall)
          ],
        )
      ]),
    );
  }
}
