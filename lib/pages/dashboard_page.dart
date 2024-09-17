import 'package:flutter/material.dart';

class ExampleDestination {
  const ExampleDestination(this.label, this.icon, this.selectedIcon);

  final String label;
  final Widget icon;
  final Widget selectedIcon;
}

const List<ExampleDestination> destinations = <ExampleDestination>[
  ExampleDestination(
    'Dashboard',
    Icon(Icons.widgets_outlined),
    Icon(Icons.widgets),
  ),
  ExampleDestination(
    'Tags',
    Icon(Icons.local_offer_outlined),
    Icon(Icons.local_offer),
  ),
  ExampleDestination(
    'Transactions',
    Icon(Icons.monetization_on_outlined),
    Icon(Icons.monetization_on),
  ),
  ExampleDestination(
    'Settings',
    Icon(Icons.settings_outlined),
    Icon(Icons.settings),
  ),
];

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int currentIndex = 0;

  void handleScreenChanged(int selectedScreen) {
    setState(() {
      currentIndex = selectedScreen;
    });
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: _buildAppBar(context),
      body: const Center(
        child: Text('Dashboard Page'),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurple,
        isExtended: true,
        onPressed: () {},
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      drawer: _buildDrawer(width: screenWidth * 0.2),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      leading: Builder(builder: (context) {
        return IconButton(
          icon: const Icon(
            Icons.menu,
            color: Colors.black38,
          ),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
        );
      }),
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

  Widget _buildDrawer({required double width}) {
    return NavigationDrawer(
      onDestinationSelected: handleScreenChanged,
      selectedIndex: currentIndex,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 30),
          child: Text("Expensor",
              style: TextStyle(
                  fontSize: width * 0.5,
                  color: Colors.black,
                  fontFamily: 'Pacifico')),
        ),
        const Padding(
          padding: EdgeInsets.fromLTRB(28, 16, 28, 10),
          child: Divider(),
        ),
        ...destinations.map(
          (ExampleDestination destination) => NavigationDrawerDestination(
            label: Text(destination.label),
            icon: destination.icon,
            selectedIcon: destination.selectedIcon,
          ),
        ),
        const Padding(
          padding: EdgeInsets.fromLTRB(28, 16, 28, 10),
          child: Divider(),
        ),
        ListTile(
          leading: const Icon(Icons.exit_to_app, color: Colors.black),
          title: const Text('Cerrar sesión', style: TextStyle(color: Colors.black)),
          onTap: () {
          // Añade aquí la lógica para cerrar sesión
        },
      ),
      ],
    );
  }
}
