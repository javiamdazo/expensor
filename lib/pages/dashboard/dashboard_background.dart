import 'package:flutter/material.dart';

class DashboardBackground extends StatelessWidget {
  const DashboardBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              color: Theme.of(context).primaryColor,
            ),
          ),
          Expanded(
            flex: 4,
            child: Container(
              color: const Color.fromARGB(255, 9, 26, 41),
            ),
          ),
        ],
      ),
    );
  }
}
