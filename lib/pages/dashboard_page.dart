import 'package:flutter/material.dart';
import 'package:expensor/widgets/appbar_widget.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  var currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: appBarWidget(),
        ),
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
        bottomNavigationBar: _buildBottomNavigationBar());
  }

  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Dashboard',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.local_offer),
          label: 'Tags',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.monetization_on_outlined),
          label: 'Transactions',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Settings',
        ),
      ],
      elevation: 20,
      type: BottomNavigationBarType.shifting,
      currentIndex: currentIndex,
      onTap: (index) {
        setState(() {
          currentIndex = index;
        });
      },
      selectedItemColor: Colors.deepPurple,
      unselectedItemColor: Colors.black54,
    );
  }
}
