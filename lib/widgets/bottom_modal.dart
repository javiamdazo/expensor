import 'package:flutter/material.dart';

class BottomModal {
  
  static void showBottomModal(BuildContext context, Widget customWidget) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Allows full-screen modals<
      builder: (context) {
        return customWidget;
      },
    );
  }
}