import 'package:flutter/cupertino.dart';

Widget buildCupertinoTextField({
  required Icon icon,
  required bool obscure,
  required String labelText
}) {
  return CupertinoTextField(
    obscureText: obscure,
    padding: const EdgeInsets.all(16.0),
    placeholder: labelText,
    placeholderStyle: const TextStyle(color: CupertinoColors.systemGrey),
    prefix: Padding(
      padding: const EdgeInsets.only(right: 8.0, left: 8),
      child: icon,
    ),
    decoration: BoxDecoration(
      color: CupertinoColors.white,
      border: Border.all(color: CupertinoColors.lightBackgroundGray),
      borderRadius: BorderRadius.circular(20),
    ),
  );
}
