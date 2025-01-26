import 'package:expensor/pages/home/home_page.dart';
import 'package:expensor/utils/ux_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Expensor',
        themeMode: ThemeMode.light,
        theme: ThemeData(
          brightness: Brightness.light, // Tema claro
          primaryColor: UxColors.amethyst.value,
          fontFamily: GoogleFonts.nunito().fontFamily,
          textTheme: const TextTheme(
            displayLarge: TextStyle(
                fontSize: 35, fontWeight: FontWeight.bold, color: Colors.white),
            displaySmall: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
            titleMedium: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
            titleSmall: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.normal,
                color: Colors.grey),
            labelMedium: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.normal,
                color: Colors.white),
            labelSmall: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.normal,
                color: Colors.grey),
          ),
          iconTheme: IconThemeData(
            color: UxColors.clouds.value,
          ),
          cardTheme: CardTheme(
            margin: const EdgeInsets.all(0),
            color: UxColors.darkLight.value,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
        debugShowCheckedModeBanner: false,
        home: const HomePage());
  }
}
