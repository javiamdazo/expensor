import 'package:expensor/widgets/money.dart';
import 'package:expensor/pages/kpis/transactions/transaction_provider.dart';
import 'package:expensor/widgets/space.dart';
import 'package:flutter/cupertino.dart';

class IncomeExpense extends StatelessWidget {
  final bool hideData;
  const IncomeExpense({super.key, required this.hideData});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        MoneyKpi(
            type: MoneyKpiType.income, amount: TransactionProvider.totalIncome, hideData: hideData,),
        Space(space: SpaceEnum.triple),
        MoneyKpi(
            type: MoneyKpiType.expense,
            amount: TransactionProvider.totalExpense, hideData: hideData,)
      ],
    );
  }
}
