import 'package:expensor/provider/model/account.dart';
import 'package:expensor/widgets/formatted_number.dart';
import 'package:expensor/widgets/space.dart';
import 'package:flutter/material.dart';

class AccountItem extends StatelessWidget {
  const AccountItem(
      {super.key,
      required this.account,
      required this.onTap,
      required this.selected});

  final Account account;
  final Function onTap;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    final Brightness brightness = Theme.of(context).brightness;
    final Color textColor =
        brightness == Brightness.dark ? Colors.white : Colors.black;

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
                  space: SpaceEnum.double,
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
                style: Theme.of(context)
                    .textTheme
                    .displayMedium!
                    .copyWith(color: textColor),
              ),
              if (!selected)
                FormattedNumber(
                    number: account.balance,
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
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
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(color: Colors.grey),
                  numberType: NumberType.currency),
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
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).colorScheme.primary.withAlpha(150),
          border: applied
              ? Border.all()
              : Border.all(
                  color: Theme.of(context).colorScheme.primary, width: 3),
          borderRadius: const BorderRadius.all(Radius.circular(20))),
      child: Text(
        text,
        style: Theme.of(context)
            .textTheme
            .labelMedium!
            .copyWith(color: Colors.white),
      ),
    );
  }
}
