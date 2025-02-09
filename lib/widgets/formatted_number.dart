import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:expensor/widgets/hidded_data.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

enum NumberType { currency, percentage }

class FormattedNumber extends StatelessWidget {
  final double number;
  final TextStyle? style;
  final NumberType numberType;
  final bool hideData;
  const FormattedNumber(
      {super.key,
      required this.number,
      required this.style,
      required this.numberType,
      this.hideData = false});

  @override
  Widget build(BuildContext context) {
    return hideData
        ? HiddedData(
            style: style,
          )
        : AnimatedFlipCounter(
              value: number,
              suffix: ' €',
              fractionDigits: 2,
              wholeDigits: 8,
              hideLeadingZeroes: true,
              decimalSeparator: ',',
              thousandSeparator: '.',
              textStyle: style,
            );
  }
}
