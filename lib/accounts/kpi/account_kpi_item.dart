import 'package:expensor/accounts/model/account.dart';
import 'package:expensor/widgets/formatted_number.dart';
import 'package:expensor/common/widgets/space.dart';
import 'package:flutter/material.dart';

class AccountKpiItem extends StatelessWidget {
  final Account account;
  final bool hideData;
  const AccountKpiItem(
      {super.key, required this.account, required this.hideData});

  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).brightness == Brightness.dark
        ? Colors.white
        : Colors.black;

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
            const Space(
              spaceSize: SpaceSize.triple,
              spaceType: SpaceType.width,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  account.name,
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .copyWith(color: Colors.grey[300]),
                ),
                Text(
                  'Last movement: 14.4 €',
                  style: Theme.of(context)
                      .textTheme
                      .labelSmall!
                      .copyWith(color: Colors.grey[500]),
                ),
              ],
            )
          ],
        ),
        FormattedNumber(
          number: account.balance,
          style: Theme.of(context)
              .textTheme
              .labelLarge!
              .copyWith(color: Colors.grey[300]),
          numberType: NumberType.currency,
          hideData: hideData,
        )
      ]),
    );
  }
}
