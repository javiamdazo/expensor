import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DrawerNavigatorItem {
  const DrawerNavigatorItem(this.label, this.icon, this.selectedIcon, this.screen);

  final String label;
  final Widget icon;
  final Widget selectedIcon;
  final Widget screen;
}

const List<DrawerNavigatorItem> destinations = <DrawerNavigatorItem>[
  DrawerNavigatorItem(
    'Dashboard',
    Icon(Icons.widgets_outlined),
    Icon(Icons.widgets),
    Text('Dashboard')
  ),
  DrawerNavigatorItem(
    'Tags',
    Icon(Icons.local_offer_outlined),
    Icon(Icons.local_offer),
    Text('Tags')
  ),
  DrawerNavigatorItem(
    'Transactions',
    Icon(Icons.monetization_on_outlined),
    Icon(Icons.monetization_on),
    Text('Transactions')
  ),
  DrawerNavigatorItem(
    'Settings',
    Icon(Icons.settings_outlined),
    Icon(Icons.settings),
    Text('Settings')
  ),
];

Widget buildCustomDrawer({
  required double width,
  required BuildContext context,
  required int currentIndex,
  required void Function(int) handleScreenChanged
  }) {
    final themeMode = Theme.of(context).brightness;

    return NavigationDrawer(
      onDestinationSelected: handleScreenChanged,
      selectedIndex: currentIndex,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 30),
          child: Text("Expensor",
              style: TextStyle(
                  fontSize: width * 0.5,
                  color: themeMode == Brightness.light
                      ? Colors.black
                      : Colors.white,
                  fontFamily: 'Pacifico')),
        ),
        const Padding(
          padding: EdgeInsets.fromLTRB(28, 16, 28, 10),
          child: Divider(),
        ),
        ...destinations.map(
          (DrawerNavigatorItem destination) => CupertinoListTile(
            title: Text(destination.label),
            leading: destination.icon,
            onTap: () {
              //handleScreenChanged(destination.id);
              Navigator.pop(context);
            },
          ),
        ),
        const Padding(
          padding: EdgeInsets.fromLTRB(28, 16, 28, 10),
          child: Divider(),
        ),
        CupertinoListTile(
          leading: const Icon(Icons.exit_to_app),
          title: const Text('Cerrar sesión'),
          onTap: () {
          // Añade aquí la lógica para cerrar sesión
        },
      ),
      ],
    );
  }