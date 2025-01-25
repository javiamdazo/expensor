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
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Budget",
          style: Theme.of(context).textTheme.titleMedium,
        ),
        IconButton(
          onPressed: onToggle, // Call the parent callback to update state
          icon: Icon(
            droppedDown ? Icons.arrow_drop_up : Icons.arrow_drop_down_sharp,
          ),
        ),
      ],
    );
  }
}
