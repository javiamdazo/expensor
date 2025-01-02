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
  void showCategoryDialog({Map<String, dynamic>? category}) {
    final TextEditingController nameController = TextEditingController();
    IconData selectedIcon = category?['icon'] ?? Icons.category;

    if (category != null) {
      nameController.text = category['name'];
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
                    CategoryProvider.categories.add({
                      'name': nameController.text,
                      'icon': selectedIcon,
                    });
                  } else {
                    // Editar categoría existente
                    category['name'] = nameController.text;
                    category['icon'] = selectedIcon;
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Categorias")
      ),
      body: Expanded(
            child:ListView.builder(
            itemCount: CategoryProvider.categories.length,
            itemBuilder: (context, index) {
              final category = CategoryProvider.categories[index];
              return ListTile(
                leading: Icon(category['icon']),
                title: Text(category['name']),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () {
                        showCategoryDialog(
                            category: category); // Editar categoría
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        setState(() {
                          CategoryProvider.categories
                              .removeAt(index); // Eliminar categoría
                        });
                      },
                    ),
                  ],
                ),
              );
            },
          ) ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showCategoryDialog(); // Mostrar el diálogo para añadir una nueva categoría
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
