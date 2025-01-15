import 'package:expensor/pages/home/home_page.dart';
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
          primaryColor: const Color.fromARGB(255, 143, 31, 163),
          fontFamily: GoogleFonts.nunito().fontFamily,
          textTheme: const TextTheme(
            displayLarge: TextStyle(
                fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white),
            displaySmall: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
            titleMedium: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
            titleSmall: TextStyle(
                fontSize: 12,
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
          iconTheme: const IconThemeData(
            color: Colors.white,
          ),
          cardTheme: CardTheme(
            margin: const EdgeInsets.symmetric(horizontal: 30),
            color: const Color.fromARGB(255, 17, 48, 75),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        debugShowCheckedModeBanner: false,
        home: const HomePage());
  }
}
