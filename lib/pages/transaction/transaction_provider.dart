class TransactionProvider {
  static double totalMoney = 12345.67;
  static double totalExpense = 5000.67;
  static double totalIncome = 12345.67;
  static double remainingMoney = 1000;

  static final List<Map<String, dynamic>> transactions = [
    {
      'type': 'income',
      'description': 'Depósito',
      'date': '01/01/2025',
      'amount': 1200.00,
      'category': 'Salario',
    },
    {
      'type': 'expense',
      'description': 'Pago de factura',
      'date': '31/12/2024',
      'amount': -300.00,
      'category': 'Servicios',
    },
    {
      'type': 'income',
      'description': 'Transferencia recibida',
      'date': '30/12/2024',
      'amount': 500.00,
      'category': 'Venta',
    },
    {
      'type': 'expense',
      'description': 'Compra de comida',
      'date': '01/01/2025',
      'amount': -50.00,
      'category': 'Comida',
    },
    {
      'type': 'income',
      'description': 'Pago por freelance',
      'date': '02/01/2025',
      'amount': 250.00,
      'category': 'Freelance',
    },
  ];


  static Map<String, List<Map<String, dynamic>>> getTransactionsByCategory() {
    Map<String, List<Map<String, dynamic>>> groupedTransactions = {};

    for (var transaction in TransactionProvider.transactions) {
      final category = transaction['category'];
      if (!groupedTransactions.containsKey(category)) {
        groupedTransactions[category] = [];
      }
      groupedTransactions[category]!.add(transaction);
    }

    return groupedTransactions;
  }
}