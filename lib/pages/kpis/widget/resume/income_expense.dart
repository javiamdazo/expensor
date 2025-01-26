import 'package:expensor/pages/kpis/widget/money_kpi.dart';
import 'package:expensor/pages/kpis/widget/transactions/transaction_provider.dart';
import 'package:flutter/cupertino.dart';

class IncomeExpense extends StatelessWidget {
  const IncomeExpense({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        MoneyKpi(
            type: MoneyKpiType.income, 
            amount: TransactionProvider.totalIncome),
        MoneyKpi(
            type: MoneyKpiType.expense,
            amount: TransactionProvider.totalExpense)
      ],
    );
  }
}
