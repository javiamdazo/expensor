import 'package:expensor/model/account.dart';
import 'package:expensor/model/category.dart';
import 'package:expensor/model/transaction.dart';
import 'package:expensor/pages/category/category_provider.dart';
import 'package:expensor/pages/home/navbar.dart';
import 'package:expensor/pages/kpis/widget/transactions/transaction_provider.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(child: Navbar());
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
                      account: Account(icon: Icons.abc, color: Colors.black, name: 'Globalcaja', balance: 250)));
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
}
