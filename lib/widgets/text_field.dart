import 'package:flutter/material.dart';

Widget buildTextField(
    {required Icon icon, required bool obscure, required String labelText}) {
  return TextField(
    obscureText: obscure,
    decoration: InputDecoration(
      labelText: labelText,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20), // Change the value to adjust the corner radius
      ),
      prefixIconColor: Colors.black26,
      prefixIcon: icon,
    ),
  );
}
