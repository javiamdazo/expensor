import 'package:flutter/material.dart';

class ColorSchemeGrid extends StatelessWidget {
  const ColorSchemeGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final colors = {
      "Primary": colorScheme.primary,
      "On Primary": colorScheme.onPrimary,
      "Primary Container": colorScheme.primaryContainer,
      "On Primary Container": colorScheme.onPrimaryContainer,
      "Secondary": colorScheme.secondary,
      "On Secondary": colorScheme.onSecondary,
      "Secondary Container": colorScheme.secondaryContainer,
      "On Secondary Container": colorScheme.onSecondaryContainer,
      "Tertiary": colorScheme.tertiary,
      "On Tertiary": colorScheme.onTertiary,
      "Tertiary Container": colorScheme.tertiaryContainer,
      "On Tertiary Container": colorScheme.onTertiaryContainer,
      "Error": colorScheme.error,
      "On Error": colorScheme.onError,
      "Error Container": colorScheme.errorContainer,
      "On Error Container": colorScheme.onErrorContainer,
      "Background": colorScheme.background,
      "On Background": colorScheme.onBackground,
      "Surface": colorScheme.surface,
      "On Surface": colorScheme.onSurface,
      "Surface Variant": colorScheme.surfaceVariant,
      "On Surface Variant": colorScheme.onSurfaceVariant,
      "Outline": colorScheme.outline,
      "Shadow": colorScheme.shadow,
      "Inverse Surface": colorScheme.inverseSurface,
      "On Inverse Surface": colorScheme.onInverseSurface,
      "Inverse Primary": colorScheme.inversePrimary,
    };

    return Scaffold(
      appBar: AppBar(title: const Text("Color Scheme Grid")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, // Adjust the number of columns
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            childAspectRatio: 2,
          ),
          itemCount: colors.length,
          itemBuilder: (context, index) {
            final entry = colors.entries.elementAt(index);
            return Container(
              decoration: BoxDecoration(
                color: entry.value,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.black54, width: 0.5),
              ),
              child: Center(
                child: Text(
                  entry.key,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: ThemeData.estimateBrightnessForColor(entry.value) ==
                            Brightness.dark
                        ? Colors.white
                        : Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}