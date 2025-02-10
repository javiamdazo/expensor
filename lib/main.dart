import 'dart:math';

import 'package:expensor/pages/home/home_page.dart';
import 'package:expensor/provider/accounts_provider.dart';
import 'package:expensor/provider/categories_provider.dart';
import 'package:expensor/provider/transactions_provider.dart';
import 'package:expensor/provider/transactions_type_provider.dart';
import 'package:expensor/utils/ux_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AccountsProvider()),
        ChangeNotifierProvider(create: (_) => CategoriesProvider()),
        ChangeNotifierProvider(create: (_) => TransactionsTypeProvider()),
        ChangeNotifierProvider(create: (context) => TransactionsProvider(
          categoriesProvider: Provider.of<CategoriesProvider>(context, listen: false),
          accountsProvider: Provider.of<AccountsProvider>(context, listen: false),
          transactionsTypeProvider: Provider.of<TransactionsTypeProvider>(context, listen: false)
        )),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Color color = UxColors.asbestos.value;

    ColorScheme darkTheme = ColorScheme.fromSeed(
        seedColor: color, brightness: Brightness.dark);

    ColorScheme lightTheme = ColorScheme.fromSeed(
        seedColor: color, brightness: Brightness.light);

    return MaterialApp(
        title: 'Expensor',
        themeMode: ThemeMode.dark,
        theme: ThemeData(
          fontFamily: GoogleFonts.nunito().fontFamily,
          colorScheme: lightTheme,
          textTheme: textThemeData(),
          iconTheme: IconThemeData(
            color: UxColors.clouds.value,
          ),
          cardTheme: CardTheme(
            margin: const EdgeInsets.all(0),
            color: Theme.of(context).colorScheme.secondary.withAlpha(50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
        darkTheme: ThemeData(
          fontFamily: GoogleFonts.nunito().fontFamily,
          colorScheme: ColorScheme.fromSeed(
              seedColor: UxColors.belizeHole.value,
              primary: darkTheme.onPrimary,
              secondary: darkTheme.onSecondary,
              onSecondaryContainer: Theme.of(context).colorScheme.secondary.withAlpha(60),
              brightness: Brightness.dark),
          textTheme: textThemeData(),
          iconTheme: IconThemeData(
            color: UxColors.clouds.value,
          ),
          cardTheme: CardTheme(
            margin: const EdgeInsets.all(0),
            color: Theme.of(context).colorScheme.secondary.withAlpha(0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
        debugShowCheckedModeBanner: false,
        home: const HomePage());
  }

  TextTheme textThemeData() {
    return const TextTheme(
          //Titulo
          titleLarge: TextStyle(
              fontSize: 35, fontWeight: FontWeight.bold, color: Colors.white),
          titleMedium: TextStyle(
              fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
          titleSmall: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),

          //Subtitulo
          displayLarge: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
          displayMedium: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.normal,
              color: Colors.grey),
          displaySmall: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.normal,
              color: Colors.grey),

          //Texto
          labelLarge: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.normal,
              color: Colors.white),
          labelMedium: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.normal,
              color: Colors.white),
          labelSmall: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.normal,
              color: Colors.grey),
        );
  }
}
