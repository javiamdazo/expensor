import 'package:expensor/utils/ux_colors.dart';
import 'package:expensor/widgets/formatted_number.dart';
import 'package:expensor/widgets/space.dart';
import 'package:flutter/material.dart';

enum MoneyKpiType {
  income,
  expense,
  investment,
  transfer;

  String get name {
    switch (this) {
      case MoneyKpiType.income:
        return 'Income';
      case MoneyKpiType.expense:
        return 'Expense';
      case MoneyKpiType.investment:
        return 'Investment';
      case MoneyKpiType.transfer:
        return 'Transfer';
    }
  }
}

class MoneyKpi extends StatelessWidget {
  final MoneyKpiType type;
  final double amount;

  const MoneyKpi({
    super.key,
    required this.type,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: UxColors.darkLightSmooth.value,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(
                150), // Shadow color (with opacity for subtle effect)
            offset: const Offset(
                0, 4), // Position of the shadow (horizontal, vertical)
            blurRadius: 6, // How blurry the shadow is
            spreadRadius: 2, // How much the shadow spreads
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FormattedNumber(
                    number: amount,
                    style: Theme.of(context).textTheme.titleSmall,
                    numberType: NumberType.currency),
                Text(
                  type.name,
                  style: Theme.of(context)
                      .textTheme
                      .displayMedium!
                      .copyWith(color: Colors.grey[300]),
                ),
              ],
            ),
            Space(spaceType: SpaceType.width, space: SpaceEnum.triple),
            CircleAvatar(
                maxRadius: 15,
                backgroundColor: Theme.of(context).iconTheme.color!.withAlpha(150),
                child: Icon(
                  type == MoneyKpiType.income ? Icons.add : Icons.remove,
                  size: 20,
                )),
          ],
        ),
      ),
    );
  }
}
