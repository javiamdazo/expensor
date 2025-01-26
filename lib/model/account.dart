import 'package:flutter/material.dart';

class Account {
  IconData icon;
  String name;
  double balance;
  Color color;

  Account({
    required this.name,
    required this.balance,
    required this.icon,
    required this.color
  });
}
