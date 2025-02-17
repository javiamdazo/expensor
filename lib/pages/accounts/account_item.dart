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

//TODO si es selected el dinero debe ir en trailing
  @override
  Widget build(BuildContext context) {
    //Map<DateTime, List<Transaction>> transactions = account.transactions ?? {};

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
                child: Icon(
                  account.icon,
                  color: account.color,
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
                    .copyWith(color: Colors.white),
              ),
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
              ? Icon(
                  Icons.keyboard_arrow_down_sharp,
                  color: Theme.of(context).iconTheme.color,
                )
              : const SizedBox(),
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
