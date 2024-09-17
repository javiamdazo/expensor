import 'package:flutter/material.dart';

Widget appBarWidget() {
  return AppBar(
    leading: IconButton(
      icon: const Icon(
        Icons.menu,
        color: Colors.black38,
      ),
      onPressed: () {
        // Add your onPressed code here!
      },
    ),
    title: const Row(
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
    ),
    actions: [
      IconButton(onPressed: () => {}, icon: const Icon(Icons.notifications_none)),
      IconButton(onPressed: () => {}, icon: const Icon(Icons.settings))
    ],
  );
}
