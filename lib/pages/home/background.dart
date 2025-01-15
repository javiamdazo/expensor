import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  const Background({Key? key}) : super(key: key);

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
              color: Colors.purple,
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              color: const Color.fromARGB(255, 9, 26, 41),
            ),
          ),
        ],
      ),
    );
  }
}
