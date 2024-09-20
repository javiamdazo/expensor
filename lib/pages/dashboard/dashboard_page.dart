import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:expensor/pages/dashboard/app_bar_widget.dart';
import 'package:expensor/pages/dashboard/drawer_widget.dart';
import 'package:expensor/pages/dashboard/floating_button_widget.dart';

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

    return CupertinoPageScaffold(
      navigationBar: buildCustomCupertinoNavigationBar(context),
      child: const Center(
        child: Text('Dashboard Page'),
      ),
      // Cupertino does not have a built-in Drawer; we'll use a modal for side navigation
      // Note: Implement your own modal or side menu as needed
    );
  }

  // Build custom floating action button as a Cupertino Button
  Widget buildCustomFloatingActionButton(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 16),
      alignment: Alignment.bottomRight,
      child: CupertinoButton(
        color: CupertinoColors.activeBlue,
        onPressed: () {
          // Handle the floating action button action
        },
        child: const Icon(CupertinoIcons.add),
      ),
    );
  }
}
