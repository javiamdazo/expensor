import 'package:expensor/pages/transaction/transaction_provider.dart';
import 'package:flutter/material.dart';

Widget buildResumeKpi() {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(10),
          child: Align(
            alignment: Alignment.centerLeft, // Alineación a la izquierda
            child: Text(
              "Enero",
              style: TextStyle(color: Colors.grey),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Column(
          children: [
            const Text("Posicion global"),
            Text(
              '${TransactionProvider.remainingMoney.toStringAsFixed(2)} €',
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ],
        ),
        const SizedBox(height: 10),
        // Barra visual de ingresos vs. gastos
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 100),
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.grey[100],
          ),
          child: Row(
            children: [
              // Barra de ingresos
              Expanded(
                flex: (TransactionProvider.totalIncome > 0)
                    ? (TransactionProvider.totalIncome /
                            (TransactionProvider.totalIncome +
                                TransactionProvider.totalExpense) *
                            100)
                        .toInt()
                    : 0,
                child: Container(
                  height: 8,
                  decoration: BoxDecoration(
                    color: Colors.green,
                  ),
                ),
              ),
              // Barra de gastos
              Expanded(
                flex: (TransactionProvider.totalExpense > 0)
                    ? (TransactionProvider.totalExpense /
                            (TransactionProvider.totalIncome +
                                TransactionProvider.totalExpense) *
                            100)
                        .toInt()
                    : 0,
                child: Container(
                  height: 8,
                  decoration: BoxDecoration(
                    color: Colors.red,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 5),
        // Resumen de Ingresos y Gastos
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // Ingresos
              _buildMoneyKpi(
                  'Ingresos', Colors.green, TransactionProvider.totalIncome),
              // Gastos
              _buildMoneyKpi(
                  'Gastos', Colors.red, TransactionProvider.totalExpense)
            ],
          ),
        ),
        const SizedBox(height: 30),
      ],
    );
  }

Widget _buildMoneyKpi(String title, Color color, double amount) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(width: 5),
            CircleAvatar(
              backgroundColor: color,
              maxRadius: 5,
            ),
          ],
        ),
        Text(
          '${amount.toStringAsFixed(2)} €',
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
