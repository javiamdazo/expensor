import 'package:expensor/model/transaction.dart';
import 'package:expensor/pages/category/categories_page.dart';
import 'package:expensor/pages/category/category_provider.dart';
import 'package:expensor/pages/transaction/transaction_provider.dart';
import 'package:expensor/pages/transaction/transactions_page.dart';
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
    const TransactionsPage(),
    const TransactionsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Logo(),
        actions: [
          IconButton(
            icon: const Icon(Icons.category),
            onPressed: () {
              Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CategoriesPage()),
            );
            },
          ),
        ],
      ),
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
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
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
    );
  }

  void showTransactionModal(String type) {
    final TextEditingController descriptionController = TextEditingController();
    final TextEditingController dateController = TextEditingController();
    String? selectedCategory;
    double amount = 0;

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
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.blue[50],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        children: [
                          const Text(
                            'Cantidad',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 10),
                          // Campo para mostrar y editar la cantidad
                          GestureDetector(
                            onTap: () {
                              // Cuando se hace tap en el campo, se convierte en un TextField editable
                              showModalBottomSheet(
                                context: context,
                                builder: (context) {
                                  return Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Column(
                                      children: [
                                        const Text(
                                          'Ingresa la cantidad',
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        TextField(
                                          keyboardType: TextInputType.number,
                                          autofocus: true,
                                          controller: TextEditingController(
                                              text: amount.toStringAsFixed(2)),
                                          decoration: InputDecoration(
                                            hintText: 'Escribe la cantidad',
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                            ),
                                          ),
                                          onChanged: (value) {
                                            setStateModal(() {
                                              amount =
                                                  double.tryParse(value) ?? 0;
                                            });
                                          },
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                            },
                            child: Text(
                              '\$${amount.toStringAsFixed(2)}',
                              style: const TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Campo de descripción
                    TextField(
                      controller: descriptionController,
                      decoration: InputDecoration(
                        labelText: 'Descripción',
                        prefixIcon: Icon(Icons.description),
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
                              '${selectedDate.day.toString().padLeft(2, '0')}/${selectedDate.month.toString().padLeft(2, '0')}/${selectedDate.year}';
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
                    DropdownButtonFormField<String>(
                      value: selectedCategory,
                      hint: const Text('Seleccionar Categoría'),
                      onChanged: (String? newValue) {
                        setStateModal(() {
                          selectedCategory = newValue;
                        });
                      },
                      items: CategoryProvider.categories
                          .map<DropdownMenuItem<String>>((category) {
                        return DropdownMenuItem<String>(
                          value: category[
                              'name'], // Usamos 'name' como valor de la categoría
                          child: Row(
                            children: [
                              Icon(category['icon']), // Icono de la categoría
                              const SizedBox(width: 8),
                              Text(category['name']), // Nombre de la categoría
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
                final String description = descriptionController.text;
                final DateTime date =  DateTime.parse(dateController.text);

                if (amount > 0 &&
                    description.isNotEmpty &&
                    selectedCategory != null) {
                  addTransaction(
                    Transaction(
                      type: type,
                      description: description,
                      date: date,
                      amount: type == 'income' ? amount : -amount,
                      category: selectedCategory,
                    ));
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
