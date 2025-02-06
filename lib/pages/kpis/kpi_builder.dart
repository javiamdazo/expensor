import 'package:expensor/utils/ux_colors.dart';
import 'package:flutter/material.dart';

class KpiBuilder extends StatelessWidget {
  Widget child;
  KpiBuilder({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            color: Colors.black
                .withAlpha(80), // Shadow color (with opacity for subtle effect)
            offset: const Offset(
                0, 2), // Position of the shadow (horizontal, vertical)
            blurRadius: 6, // How blurry the shadow is
            spreadRadius: 2, // How much the shadow spreads
          ),
        ],
      ),
      child: child,
    );
  }
}
