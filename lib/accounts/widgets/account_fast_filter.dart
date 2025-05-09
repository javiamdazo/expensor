import 'package:flutter/material.dart';

class AccountFastFilter extends StatelessWidget {
  const AccountFastFilter(
      {super.key, required this.text, required this.applied});

  final String text;
  final bool applied;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 2),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
          color: applied
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).colorScheme.primary.withAlpha(150),
          border: applied
              ? Border.all()
              : Border.all(
                  color: Theme.of(context).colorScheme.primary, width: 3),
          borderRadius: const BorderRadius.all(Radius.circular(20))),
      child: Text(
        text,
        style: Theme.of(context)
            .textTheme
            .labelMedium!
            .copyWith(color: Colors.white),
      ),
    );
  }
}
