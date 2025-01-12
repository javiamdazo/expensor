import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.lightBlue,
            child: Text("JA"),
          ),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hola de nuevo',
                style: TextStyle(fontSize: 10, color: Colors.grey),
              ),
              Text('Javier Andrés'),
            ],
          ),
        ],
      );
  }
}
