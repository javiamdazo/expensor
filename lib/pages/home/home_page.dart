import 'package:expensor/pages/category/categories_page.dart';
import 'package:expensor/pages/dashboard/transaction_provider.dart';
import 'package:expensor/pages/dashboard/transactions_page.dart';
import 'package:expensor/widgets/logo.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0; // Índice actual de la barra inferior
  final PageController _pageController =
      PageController(); // Controlador del PageView

  // Lista de widgets para cada página
  final List<Widget> _pages = [
    const TransactionsPage(),
    const CategoriesPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Logo(),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
                vertical: 30.0), // Espaciado adicional
            child: Text(
              '${TransactionProvider.totalMoney.toStringAsFixed(2)} €',
              style: const TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(0, 157, 97, 1),
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentIndex =
                      index; // Actualizar índice al cambiar de página
                });
              },
              children: _pages,
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex, // Índice seleccionado
        onTap: (index) {
          setState(() {
            _currentIndex = index; // Actualizar índice seleccionado
            _pageController.jumpToPage(index); // Cambiar de página
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Transacciones',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categorias',
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
