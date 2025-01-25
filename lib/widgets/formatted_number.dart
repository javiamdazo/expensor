import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FormattedNumber extends StatelessWidget {
  final double number;
  final TextStyle? style;
  final bool? currency;
  const FormattedNumber({super.key, required this.number, required this.style, this.currency});

  @override
  Widget build(BuildContext context) {
    final NumberFormat numberFormat = NumberFormat.currency(locale: 'es', symbol: currency == null ? '€' : '%');

    return Text(
      numberFormat.format(number),
      style: style,
    );
  }
}
