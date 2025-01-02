import 'package:expensor/pages/transaction/transaction_provider.dart';
import 'package:flutter/material.dart';

class TransactionsPage extends StatefulWidget {
  const TransactionsPage({super.key});

  @override
  State<TransactionsPage> createState() => _TransactionsPageState();
}

class _TransactionsPageState extends State<TransactionsPage> {
  bool byCategory = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: [
              Card(
                margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: _buildResumeKpi(),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Transacciones",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              IconButton(
                  onPressed: () {
                    setState(() {
                      byCategory = byCategory ? false : true;
                    });
                  },
                  icon:
                      Icon(byCategory ? Icons.calendar_month : Icons.category))
            ],
          ),
          const SizedBox(height: 10), // Separación entre el título y el listado
          byCategory
              ? _buildListTransactionsByCategories()
              : _buildListTransactions()
        ],
      ),
    );
  }

  Widget _buildListTransactionsByCategories() {
    final transactionsGroupedByCategory = TransactionProvider.getTransactionsByCategory();
    
    return Expanded(
      child: ListView.builder(
        itemCount: transactionsGroupedByCategory.keys.length,
        itemBuilder: (context, index) {
          final category = transactionsGroupedByCategory.keys.elementAt(index);
          final categoryTransactions = transactionsGroupedByCategory[category]!;

          return Container(
            margin: const EdgeInsets.symmetric(vertical: 2.0),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(12),
            ),
            child: ExpansionTile(
              title: Text(
                category,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              children: categoryTransactions.map<Widget>((transaction) {
                final isIncome = transaction.type == 'income';
                return _buildTransactionItem(isIncome, transaction);
              }).toList(),
            ),
          );
        },
      ),
    );
  }

  Widget _buildListTransactions() {
    return Expanded(
      child: ListView.builder(
        itemCount: TransactionProvider.transactions.length,
        itemBuilder: (context, index) {
          final String isIncome =
              TransactionProvider.transactions[index].type;

          return Container(
            margin: const EdgeInsets.symmetric(vertical: 2.0),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(12),
            ),
            child: _buildTransactionItem(isIncome.contains('income'),
                TransactionProvider.transactions[index]),
          );
        },
      ),
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

  Widget _buildResumeKpi() {
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

  Widget _buildTransactionItem(bool isIncome, dynamic transaction) {
    return Card(
      color: isIncome ? Colors.green[50] : Colors.red[50],
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: isIncome ? Colors.green[100] : Colors.red[100],
                shape: BoxShape.circle,
              ),
              child: Icon(
                isIncome ? Icons.arrow_upward : Icons.arrow_downward,
                color: isIncome ? Colors.green : Colors.red,
                size: 20,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    transaction['description'],
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    transaction['date'],
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),
            Text(
              '${transaction['amount'].toStringAsFixed(2)} €',
              style: TextStyle(
                color: isIncome ? Colors.green : Colors.red,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
