import 'package:expensor/pages/home/home_page.dart';
import 'package:expensor/pages/login/login_page.dart';
import 'package:expensor/pages/register/register_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expensor',
      themeMode: ThemeMode.light, // Cambia entre claro y oscuro según la configuración del sistema
      darkTheme: ThemeData(
        brightness: Brightness.dark, // Tema oscuro
        primaryColor: const Color.fromRGBO(0, 83, 157, 1),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
        ),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(fontSize: 16.0, fontWeight: FontWeight.normal),
          bodyMedium: TextStyle(fontSize: 14.0),
        ),
      ),
      theme: ThemeData(
        brightness: Brightness.light, // Tema claro
        primaryColor: const Color.fromRGBO(0, 83, 157, 1),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
        ),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(fontSize: 16.0, fontWeight: FontWeight.normal),
          bodyMedium: TextStyle(fontSize: 14.0),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}



class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return const CupertinoPageScaffold(
      child: Center(
        child: HomePage(),
      ),
    );
  }
}
