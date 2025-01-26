import 'package:flutter/material.dart';

class BudgetTitle extends StatelessWidget {
  final bool droppedDown;
  final VoidCallback onToggle;

  const BudgetTitle({
    super.key,
    required this.droppedDown,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      icon:
          Icon(droppedDown ? Icons.arrow_drop_up : Icons.arrow_drop_down_sharp),
      iconAlignment: IconAlignment.end,
      onPressed: () => {},
      label: Text("Globalcaja",
          style: Theme.of(context)
              .textTheme
              .titleSmall!
              .copyWith(color: Colors.grey[300])),
    );
  }
}
