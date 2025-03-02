import 'package:expensor/pages/home/navbar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final Function changeColorTheme;
  const HomePage({super.key, required this.changeColorTheme});

  @override
  Widget build(BuildContext context) {
    return Navbar(
      changeColorTheme: changeColorTheme,
    );
  }
}
