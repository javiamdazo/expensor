import 'package:expensor/model/category.dart';
import 'package:expensor/pages/category/category_provider.dart';
import 'package:expensor/widgets/logo.dart';
import 'package:flutter/material.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({super.key});

  @override
  _CategoriesPageState createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  // Función para mostrar el modal de añadir o editar categoría
  void showCategoryDialog({Category? category}) {
    final TextEditingController nameController = TextEditingController();
    IconData selectedIcon = category?.icon ?? Icons.category;

    if (category != null) {
      nameController.text = category.name;
    }

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title:
              Text(category == null ? 'Añadir Categoría' : 'Editar Categoría'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Campo para nombre de categoría
              TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: 'Nombre'),
              ),
              const SizedBox(height: 16),
              // Selector de icono para categoría
              DropdownButton<IconData>(
                value: selectedIcon,
                onChanged: (IconData? newIcon) {
                  setState(() {
                    selectedIcon = newIcon!;
                  });
                },
                items: [
                  Icons.work,
                  Icons.fastfood,
                  Icons.lightbulb,
                  Icons.person,
                  Icons.shopping_cart,
                ]
                    .map<DropdownMenuItem<IconData>>(
                      (icon) => DropdownMenuItem<IconData>(
                        value: icon,
                        child: Icon(icon),
                      ),
                    )
                    .toList(),
              ),
            ],
          ),
          actions: [
            // Botón cancelar
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancelar'),
            ),
            // Botón guardar
            TextButton(
              onPressed: () {
                setState(() {
                  if (category == null) {
                    // Añadir nueva categoría
                    CategoryProvider.categories.add(
                      Category(name: nameController.text, icon: selectedIcon)
                    );
                  } else {
                    // Editar categoría existente
                    category.name = nameController.text;
                    category.icon = selectedIcon;
                  }
                });
                Navigator.pop(context);
              },
              child: const Text('Guardar'),
            ),
          ],
        );
      },
    );
  }

  // Función para mostrar el cuadro de confirmación de eliminación
  void showDeleteConfirmationDialog(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("¿Estás seguro de que deseas eliminar esta categoría?"),
          actions: [
            // Botón cancelar
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Cerrar el diálogo sin hacer nada
              },
              child: const Text('Cancelar'),
            ),
            // Botón eliminar
            TextButton(
              onPressed: () {
                setState(() {
                  CategoryProvider.categories.removeAt(index); // Eliminar categoría
                });
                Navigator.pop(context); // Cerrar el diálogo
              },
              child: const Text('Eliminar'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Categorías"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Número de columnas
            crossAxisSpacing: 8.0, // Espacio entre columnas
            mainAxisSpacing: 8.0, // Espacio entre filas
            childAspectRatio: 1.2, // Relación de aspecto para los ítems (ajustable)
          ),
          itemCount: CategoryProvider.categories.length,
          itemBuilder: (context, index) {
            final category = CategoryProvider.categories[index];
            return Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: GestureDetector(
                onTap: () {
                  showCategoryDialog(category: category); // Editar categoría
                },
                onLongPress: () {
                  showDeleteConfirmationDialog(index); // Mostrar diálogo de confirmación de eliminación
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      category.icon,
                      size: 40,
                      color: Colors.blue,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      category.name,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showCategoryDialog(); // Mostrar el diálogo para añadir una nueva categoría
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
