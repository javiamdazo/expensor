import 'package:expensor/widgets/money.dart';
import 'package:expensor/pages/kpis/transactions/transaction_provider.dart';
import 'package:expensor/widgets/space.dart';
import 'package:flutter/cupertino.dart';

class IncomeExpense extends StatelessWidget {
  const IncomeExpense({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        MoneyKpi(
            type: MoneyKpiType.income, amount: TransactionProvider.totalIncome),
        Space(space: SpaceEnum.triple),
        MoneyKpi(
            type: MoneyKpiType.expense,
            amount: TransactionProvider.totalExpense)
      ],
    );
  }
}
