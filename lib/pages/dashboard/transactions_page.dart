import 'package:expensor/pages/category/categories_page.dart';
import 'package:expensor/pages/category/category_provider.dart';
import 'package:expensor/pages/dashboard/transaction_provider.dart';
import 'package:flutter/material.dart';

class TransactionsPage extends StatefulWidget {
  const TransactionsPage({super.key});

  @override
  State<TransactionsPage> createState() => _TransactionsPageState();
}

class _TransactionsPageState extends State<TransactionsPage> {
  double totalMoney = 12345.67;

  final transactionsGroupedByCategory = TransactionProvider.getTransactionsByCategory();

  void addTransaction(Map<String, dynamic> transaction) {
    setState(() {
      TransactionProvider.transactions.add(transaction);
      totalMoney += transaction['amount'];
    });
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
                final String date = dateController.text;

                if (amount > 0 &&
                    description.isNotEmpty &&
                    date.isNotEmpty &&
                    selectedCategory != null) {
                  addTransaction({
                    'type': type,
                    'description': description,
                    'date': date,
                    'amount': type == 'income' ? amount : -amount,
                    'category': selectedCategory,
                  });
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

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Divider(),
          const SizedBox(height: 10), // Separación entre el título y el listado
          Expanded(
            child: ListView.builder(
              itemCount: transactionsGroupedByCategory.keys.length,
              itemBuilder: (context, index) {
                final category =
                    transactionsGroupedByCategory.keys.elementAt(index);
                final categoryTransactions =
                    transactionsGroupedByCategory[category]!;

                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 8.0),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ExpansionTile(
                    title: Text(
                      category,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    children: categoryTransactions.map<Widget>((transaction) {
                      final isIncome = transaction['type'] == 'income';
                      return Card(
                        color: isIncome ? Colors.green[100] : Colors.red[100],
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: ListTile(
                          contentPadding: const EdgeInsets.all(16),
                          leading: Icon(
                            isIncome
                                ? Icons.arrow_upward
                                : Icons.arrow_downward,
                            color: isIncome ? Colors.green : Colors.red,
                          ),
                          title: Text(
                            transaction['description'],
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            '${transaction['date']}',
                            style: const TextStyle(fontSize: 12),
                          ),
                          trailing: Text(
                            '\$${transaction['amount'].toStringAsFixed(2)}',
                            style: TextStyle(
                              color: isIncome ? Colors.green : Colors.red,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                );
              },
            ),
          ),
          // Botón para agregar transacciones
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {
                  showTransactionModal('income');
                },
                child: Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.green.withOpacity(0.5),
                        blurRadius: 10,
                        offset: Offset(0, 6),
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 35,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  showTransactionModal('expense');
                },
                child: Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.red.withOpacity(0.5),
                        blurRadius: 10,
                        offset: Offset(0, 6),
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.remove,
                    color: Colors.white,
                    size: 35,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
