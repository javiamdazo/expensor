import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:super_cupertino_navigation_bar/super_cupertino_navigation_bar.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int currentIndex = 0;

  int? selectedIndexFilter;
  List<String> filters = ['Casa', 'Coche', 'Restaurantes'].toList();

  void handleScreenChanged(int selectedScreen) {
    setState(() {
      currentIndex = selectedScreen;
    });
  }

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: SuperScaffold(
          appBar: SuperAppBar(
            title: const Text(
              "Dashboard",
              style: TextStyle(color: Colors.black),
            ),
            largeTitle: SuperLargeTitle(
              enabled: true,
              largeTitle: "Dashboard",
            ),
            actions: IconButton(
                onPressed: () => {}, icon: const Icon(CupertinoIcons.person)),
            searchBar: SuperSearchBar(
              enabled: true,
              onChanged: (query) {
                // Search Bar Changes
              },
              onSubmitted: (query) {
                // On Search Bar submitted
              },
              // Add other search bar properties as needed
            ),
            bottom: SuperAppBarBottom(
              child: Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: filters.length,
                    itemBuilder: (context, index) {
                      bool isSelected = selectedIndexFilter == index;

                      return Row(children: [
                        Container(
                          decoration: BoxDecoration(
                            color: isSelected
                                ? colorScheme.primary
                                : Colors
                                    .transparent, // Fondo transparente si no está seleccionado
                            border: Border.all(
                              color: colorScheme
                                  .primary, // Borde del color primario
                              width: 2, // Grosor del borde
                            ),
                            borderRadius:
                                BorderRadius.circular(20), // Borde redondeado
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: Row(children: [
                            Icon(CupertinoIcons.home, color: isSelected
                                      ? Colors.white
                                      : colorScheme
                                          .primary,),
                            CupertinoButton(
                              borderRadius: BorderRadius.circular(20),
                              onPressed: () {
                                // Al presionar el botón, actualizamos el índice seleccionado
                                setState(() {
                                  selectedIndexFilter = index;
                                });
                              },
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              // Cambiamos el estilo del texto según si el botón está seleccionado o no
                              child: Text(
                                filters[index],
                                style: TextStyle(
                                  color: isSelected
                                      ? Colors.white
                                      : colorScheme
                                          .primary, // Texto blanco si está seleccionado, primario si no
                                ),
                              ),
                            )
                          ]),
                        )),
                        const SizedBox(width: 10),
                      ]);
                    },
                  )),
              enabled: true,
            ),
          ),
          body: const SingleChildScrollView(
            // You can use CustomScrollView or any Widget desired
            child: Column(
              children: [
                Card(
                    // Playground card
                    // Add your onTap logic for Playground card
                    ),
                Card(
                    // List of example cards
                    // Add your ListView.separated logic for example cards
                    ),
              ],
            ),
          ),
        ));
  }

  // Build custom floating action button as a Cupertino Button
  Widget buildCustomFloatingActionButton(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 16),
      alignment: Alignment.bottomRight,
      child: CupertinoButton(
        color: CupertinoColors.activeBlue,
        onPressed: () {
          // Handle the floating action button action
        },
        child: const Icon(CupertinoIcons.add),
      ),
    );
  }
}
