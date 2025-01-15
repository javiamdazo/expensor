import 'package:expensor/model/account.dart';
import 'package:expensor/model/category.dart';
import 'package:expensor/model/transaction.dart';
import 'package:expensor/pages/category/categories_page.dart';
import 'package:expensor/pages/category/category_provider.dart';
import 'package:expensor/pages/home/background.dart';
import 'package:expensor/pages/transaction/widget/transactions/transaction_provider.dart';
import 'package:expensor/pages/transaction/dashboard_page.dart';
import 'package:expensor/widgets/logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

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
    const DashboardPage(),
    const DashboardPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Background(),
        Positioned.fill(
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              leading: IconButton(
                  onPressed: () => {},
                  icon: const Icon(Icons.settings, color: Colors.white)),
              centerTitle: true,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Account:",
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.normal,
                        ),
                  ),
                  const SizedBox(width: 5),
                  Text("Globalcaja",
                      style: Theme.of(context).textTheme.titleMedium),
                  IconButton(
                      onPressed: () => {},
                      icon: const Icon(
                        Icons.arrow_drop_down_sharp,
                        color: Colors.white,
                      )),
                ],
              ),
            ),
            persistentFooterButtons: [
              BottomNavigationBar(
                currentIndex: _currentIndex,
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.list),
                    label: 'Transacciones',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.pie_chart),
                    label: 'Resumen',
                  ),
                ],
                onTap: (index) {
                  _pageController.animateToPage(
                    index,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.ease,
                  );
                },
              ),
            ],
            body: Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                children: _pages,
              ),
            ),
            floatingActionButton: SpeedDial(
              icon: Icons.add,
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              children: [
                SpeedDialChild(
                  child: const Icon(Icons.add),
                  label: 'Ingreso',
                  labelStyle: const TextStyle(fontSize: 18.0),
                  onTap: () {
                    showTransactionModal('income');
                  },
                ),
                SpeedDialChild(
                  child: const Icon(Icons.remove),
                  label: 'Gasto',
                  labelStyle: const TextStyle(fontSize: 18.0),
                  onTap: () {
                    showTransactionModal('expense');
                  },
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  void showTransactionModal(String type) {
    final TextEditingController amountController = TextEditingController();
    final TextEditingController descriptionController = TextEditingController();
    final TextEditingController dateController = TextEditingController();
    Category? selectedCategory;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: Text(
            type == 'income' ? 'Añadir Ingreso' : 'Añadir Gasto',
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          content: StatefulBuilder(
            builder: (BuildContext context, setStateModal) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    // Campo de cantidad (más grande y visual)
                    TextField(
                      controller: amountController,
                      decoration: InputDecoration(
                        labelText: 'Cantidad',
                        prefixIcon: const Icon(Icons.euro),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Campo de descripción
                    TextField(
                      controller: descriptionController,
                      decoration: InputDecoration(
                        labelText: 'Descripción',
                        prefixIcon: const Icon(Icons.description),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Campo de fecha
                    GestureDetector(
                      onTap: () async {
                        // Mostrar el calendario
                        DateTime? selectedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2101),
                        );
                        if (selectedDate != null) {
                          // Formatear la fecha a DD/MM/YYYY
                          final formattedDate =
                              '${selectedDate.year}-${selectedDate.month.toString().padLeft(2, '0')}-${selectedDate.day.toString().padLeft(2, '0')}';
                          setState(() {
                            dateController.text = formattedDate;
                          });
                        }
                      },
                      child: AbsorbPointer(
                        child: TextField(
                          controller: dateController,
                          decoration: InputDecoration(
                            labelText: 'Fecha (DD/MM/AAAA)',
                            prefixIcon: const Icon(Icons.calendar_today),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Dropdown para seleccionar categoría
                    DropdownButtonFormField<Category>(
                      value: selectedCategory,
                      hint: const Text('Seleccionar Categoría'),
                      onChanged: (Category? newValue) {
                        setStateModal(() {
                          selectedCategory = newValue;
                        });
                      },
                      items: CategoryProvider.categories
                          .map<DropdownMenuItem<Category>>((category) {
                        return DropdownMenuItem<Category>(
                          value: category,
                          child: Row(
                            children: [
                              Icon(category.icon), // Icono de la categoría
                              const SizedBox(width: 8),
                              Text(category.name), // Nombre de la categoría
                            ],
                          ),
                        );
                      }).toList(),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        prefixIcon: const Icon(Icons.category),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          actions: [
            // Botón cancelar
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                'Cancelar',
                style: TextStyle(color: Colors.red),
              ),
            ),
            // Botón guardar
            TextButton(
              onPressed: () {
                final double amount = double.parse(amountController.text);
                final String description = descriptionController.text;
                final DateTime date = DateTime.parse(dateController.text);

                if (amount > 0 &&
                    description.isNotEmpty &&
                    selectedCategory != null) {
                  addTransaction(Transaction(
                      type: type,
                      description: description,
                      date: date,
                      amount: type == 'income' ? amount : -amount,
                      category: selectedCategory,
                      account: Account(name: 'Globalcaja', balance: 250)));
                  Navigator.pop(context);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text('Por favor, completa todos los campos')),
                  );
                }
              },
              child: const Text(
                'Guardar',
                style: TextStyle(color: Colors.green),
              ),
            ),
          ],
        );
      },
    );
  }

  void addTransaction(Transaction transaction) {
    setState(() {
      TransactionProvider.transactions.add(transaction);
      TransactionProvider.totalMoney += transaction.amount;
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
