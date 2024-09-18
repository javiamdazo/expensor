import 'package:flutter/material.dart';

FloatingActionButton buildCustomFloatingActionButton(BuildContext context) {
  final colorScheme = Theme.of(context).colorScheme;

  return FloatingActionButton(
    backgroundColor: colorScheme.primary,
    isExtended: true,
    onPressed: () {},
    child: const Icon(
      Icons.add,
      color: Colors.white,
    ),
  );
}
