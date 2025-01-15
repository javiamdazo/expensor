import 'package:flutter/material.dart';

Widget appBarWidget({required BuildContext context}) {
  return AppBar(
    leading: IconButton(
      icon: const Icon(
        Icons.menu,
        color: Colors.black38,
      ),
      onPressed: () {
        Scaffold.of(context).openDrawer();
      },
    ),
    title: const Row(
      children: [
        Text(
          'Globalcaja',
          style: TextStyle(fontSize: 10, color: Colors.grey),
        )
      ],
    ),
    actions: [
      IconButton(
          onPressed: () => {}, icon: const Icon(Icons.notifications_none)),
      IconButton(onPressed: () => {}, icon: const Icon(Icons.settings))
    ],
  );
}
