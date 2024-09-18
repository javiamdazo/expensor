import 'package:flutter/material.dart';

AppBar buildCustomAppBar(BuildContext context) {

  final colorScheme = Theme.of(context).colorScheme;

  return AppBar(
    leading: Builder(builder: (context) {
      return IconButton(
        icon: const Icon(
          Icons.menu,
        ),
        onPressed: () {
          Scaffold.of(context).openDrawer();
        },
      );
    }),
    title: Row(
      children: [
        CircleAvatar(
          backgroundColor: colorScheme.primary,
          child: const Text("JA"),
        ),
        const SizedBox(width: 10),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hola de nuevo',
              style: TextStyle(fontSize: 10),
            ),
            const Text('Javier Andrés'),
          ],
        ),
      ],
    ),
    actions: [
      IconButton(
        onPressed: () {},
        icon: const Icon(Icons.notifications_none),
      ),
      IconButton(
        onPressed: () {},
        icon: const Icon(Icons.settings),
      ),
    ],
  );
}