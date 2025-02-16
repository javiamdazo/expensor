import 'package:expensor/widgets/formatted_number.dart';
import 'package:expensor/widgets/profitability.dart';
import 'package:expensor/widgets/space.dart';
import 'package:flutter/material.dart';

class InversionResumeData extends StatelessWidget {
  final double invested;
  final double pL;
  final double balance;

  const InversionResumeData(
      {super.key,
      required this.invested,
      required this.pL,
      required this.balance});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FormattedNumber(
            number: balance,
            style: Theme.of(context).textTheme.titleMedium,
            numberType: NumberType.currency),
        Row(
          children: [
            FormattedNumber(
              number: invested,
              style: Theme.of(context).textTheme.displaySmall,
              numberType: NumberType.currency,
            ),
            Space(spaceType: SpaceType.width,),
            Profitability(
                number: pL, style: Theme.of(context).textTheme.displaySmall)
          ],
        )
      ],
    );
  }
}
