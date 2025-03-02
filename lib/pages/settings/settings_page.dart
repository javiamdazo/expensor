import 'package:expensor/utils/ux_colors.dart';
import 'package:flutter/material.dart';
import 'package:expensor/widgets/space.dart';
import 'package:expensor/main.dart';

class SettingData {
  String title;
  IconData icon;
  String description;
  Widget widget;
  SettingData({
    required this.title,
    required this.icon,
    required this.description,
    required this.widget,
  });

  SettingData copyWith({
    String? title,
    IconData? icon,
    String? description,
    Widget? widget,
  }) {
    return SettingData(
      title: title ?? this.title,
      icon: icon ?? this.icon,
      description: description ?? this.description,
      widget: widget ?? this.widget,
    );
  }
}

class SettingsPage extends StatelessWidget {
  final Function changeColorTheme;
  const SettingsPage({super.key, required this.changeColorTheme});

  @override
  Widget build(BuildContext context) {
    final List<SettingData> settingsMap = [
      SettingData(
        description: "Change color palette of the whole application",
        title: "Theme color",
        icon: Icons.palette_outlined,
        widget: ThemeColorSettingPage(
          changeColorTheme: changeColorTheme,
        ),
      ),
      SettingData(
        description: "Manage your scheduled transactions",
        title: "Recurring",
        icon: Icons.loop,
        widget: const Text("Recurring"),
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        toolbarHeight: MediaQuery.of(context).size.height * 0.2,
        leading: Align(
          alignment: Alignment.topLeft,
          child: IconButton(
            onPressed: () {}, // Se eliminó el uso innecesario de => {}
            icon: Icon(
              Icons.settings,
              color: Theme.of(context).iconTheme.color,
            ),
          ),
        ),
        title: Column(
          children: [
            const CircleAvatar(
              radius: 40,
              child: Icon(
                Icons.person,
                size: 30,
              ),
            ),
            const Space(spaceType: SpaceType.height),
            Text(
              "Javier Andrés",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Text(
              "BASIC ACCOUNT",
              style: Theme.of(context)
                  .textTheme
                  .displaySmall!
                  .copyWith(color: Colors.grey[300]),
            ),
          ],
        ),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 8.0,
          crossAxisSpacing: 8.0,
          childAspectRatio: 1.4, // Ajustado para mejor distribución
        ),
        itemCount: settingsMap.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => settingsMap[index].widget,
                ),
              );
            },
            child: Card(
              color: Theme.of(context).colorScheme.primary.withAlpha(150),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      settingsMap[index].icon,
                      size: 50,
                      color: Colors.white,
                    ),
                    const Space(),
                    Text(
                      settingsMap[index].title,
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium!
                          .copyWith(color: Colors.white),
                    ),
                    const Space(),
                    Text(
                      settingsMap[index].description,
                      style: Theme.of(context)
                          .textTheme
                          .displaySmall!
                          .copyWith(color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class ThemeColorSettingPage extends StatelessWidget {
  final Function changeColorTheme;
  const ThemeColorSettingPage({super.key, required this.changeColorTheme});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        leading: IconButton(
          onPressed: () => {Navigator.pop(context)},
          icon: Icon(
            Icons.arrow_back,
            color: Theme.of(context).iconTheme.color,
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            color: Theme.of(context).colorScheme.primary,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Column(
                children: [
                  const Icon(
                    Icons.palette_outlined,
                    size: 120,
                  ),
                  Text(
                    "Theme color",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const Space(),
                  Text(
                    "Select a color pallete for whole application",
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(10),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                childAspectRatio: 2,
              ),
              itemCount: UxColors.values.length,
              itemBuilder: (context, index) {
                final entry = UxColors.values[index];
                return GestureDetector(
                  onTap: () {
                    changeColorTheme(entry.value);
                    Navigator.pop(context);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: entry.value,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.black54, width: 0.5),
                    ),
                    child: Center(
                      child: Text(
                        entry.name.toUpperCase(),
                        textAlign: TextAlign.center,
                        style:
                            Theme.of(context).textTheme.displaySmall!.copyWith(
                                  color: ThemeData.estimateBrightnessForColor(
                                              entry.value) ==
                                          Brightness.dark
                                      ? Colors.white
                                      : Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
