import 'package:flutter/material.dart';

Widget buildTextField({required Icon icon, required bool obscure, required String labelText}) {
    return TextField(
      obscureText: obscure,
      decoration: InputDecoration(
        labelText: labelText,
        border: const OutlineInputBorder(),
        prefixIcon: icon,
      ),
    );
  }