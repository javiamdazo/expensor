import 'package:flutter/material.dart';

class BottomModal {
  static void showBottomModal(BuildContext context, Widget customWidget) {
    showModalBottomSheet(
      context: context,
      isScrollControlled:
          true, // Importante para que el modal ocupe más espacio
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context)
                .viewInsets
                .bottom, // Ajusta el espacio del teclado
          ),
          child: SingleChildScrollView(
            child: customWidget
          ),
        );
      },
    );
  }
}
