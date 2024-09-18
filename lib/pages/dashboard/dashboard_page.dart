import 'package:expensor/pages/dashboard/app_bar_widget.dart';
import 'package:expensor/pages/dashboard/drawer_widget.dart';
import 'package:expensor/pages/dashboard/floating_button_widget.dart';
import 'package:flutter/material.dart';

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
      appBar: buildCustomAppBar(context),
      body: const Center(
        child: Text('Dashboard Page'),
      ),
      floatingActionButton: buildCustomFloatingActionButton(context),
      drawer: buildCustomDrawer(
        width: screenWidth * 0.2,
        context: context,
        currentIndex: currentIndex,
        handleScreenChanged: handleScreenChanged
      ),
    );
  }
}
