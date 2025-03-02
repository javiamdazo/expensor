import 'package:expensor/accounts/model/account.dart';
import 'package:expensor/common/theme_data.dart';
import 'package:expensor/widgets/formatted_number.dart';
import 'package:expensor/common/widgets/space.dart';
import 'package:flutter/material.dart';

class AccountItemPage extends StatelessWidget {
  const AccountItemPage(
      {super.key,
      required this.account,
      required this.onTap,
      required this.selected});

  final Account account;
  final Function onTap;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: ListTile(
          onTap: () => {onTap()},
          leading: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (selected) const Icon(Icons.arrow_back),
              if (selected)
                const Space(
                  spaceSize: SpaceSize.double,
                  spaceType: SpaceType.width,
                ),
              Container(
                decoration: BoxDecoration(
                    color: account.color.withAlpha(50),
                    borderRadius: const BorderRadius.all(Radius.circular(10))),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Icon(
                    account.icon,
                    color: account.color,
                  ),
                ),
              ),
            ],
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                account.name,
                style: AppThemeData.appTextTheme.displayMedium!
                    .copyWith(color: AppThemeData.textColorByBrightness),
              ),
              if (!selected)
                FormattedNumber(
                    number: account.balance,
                    style: AppThemeData.appTextTheme.titleSmall!
                        .copyWith(color: Colors.grey),
                    numberType: NumberType.currency)
            ],
          ),
          trailing: !selected
              ? const Icon(
                  Icons.keyboard_arrow_down_sharp,
                  color: Colors.grey,
                )
              : FormattedNumber(
                  number: account.balance,
                  style: AppThemeData.appTextTheme.titleSmall!
                      .copyWith(color: Colors.grey),
                  numberType: NumberType.currency),
        ));
  }
}
