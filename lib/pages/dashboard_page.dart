import 'package:flutter/material.dart';
import 'package:expensor/widgets/appbar_widget.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: appBarWidget(),
      ),
      body: Container(
          // Add your widgets here
          ),
    );
  }
}
