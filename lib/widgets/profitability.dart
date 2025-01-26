import 'package:expensor/widgets/formatted_number.dart';
import 'package:flutter/material.dart';

class Profitability extends StatelessWidget {
  final double number;
  final TextStyle? style;
  const Profitability({super.key, required this.number, required this.style});

  @override
  Widget build(BuildContext context) {
    final Color color =
        number < 0 ? const Color.fromARGB(255, 221, 106, 97) : const Color.fromRGBO(36, 190, 168, 1);

    return Row(
      children: [
        Icon(Icons.arrow_upward, size: 15, color: color),
        FormattedNumber(
            number: number,
            numberType: NumberType.percentage,
            style: style?.copyWith(color: color)),
      ],
    );
  }
}
