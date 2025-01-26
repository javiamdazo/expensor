import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

enum NumberType{
  currency,
  percentage
}

class FormattedNumber extends StatelessWidget {
  final double number;
  final TextStyle? style;
  final NumberType numberType;
  const FormattedNumber({super.key, required this.number, required this.style, required this.numberType});

  @override
  Widget build(BuildContext context) {
    final NumberFormat numberFormat = NumberFormat.currency(
      locale: 'es', 
      symbol: numberType == NumberType.currency ? '€' : '%');

    return Text(
      numberFormat.format(number),
      style: style,
    );
  }
}
