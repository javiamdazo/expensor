import 'package:expensor/pages/transaction/widget/transactions/transaction_provider.dart';
import 'package:expensor/pages/transaction/widget/money_kpi.dart';
import 'package:flutter/material.dart';

class ResumeKpi extends StatefulWidget {
  const ResumeKpi({Key? key}) : super(key: key);

  @override
  _ResumeKpiState createState() => _ResumeKpiState();
}

class _ResumeKpiState extends State<ResumeKpi> {
  bool droppedDown = false;
  @override
  Widget build(BuildContext context) {
    return Card(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BudgetTitle(droppedDown: droppedDown),
          const SizedBox(height: 10),
          Text(
            "LEFT TO SPEND",
            style: Theme.of(context).textTheme.titleSmall,
          ),
          Text(
            '${TransactionProvider.remainingMoney.toStringAsFixed(2)} €',
            style: Theme.of(context).textTheme.displayLarge,
          ),
          LinearProgressIndicator(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            minHeight: 10,
            value: 0.5,
            color: Theme.of(context).primaryColor,
            backgroundColor:
                Theme.of(context).primaryColor.withValues(alpha: 0.3),
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MoneyKpi(
                  type: MoneyKpiType.income,
                  amount: TransactionProvider.totalIncome),
              MoneyKpi(
                  type: MoneyKpiType.expense,
                  amount: TransactionProvider.totalExpense)
            ],
          )
        ],
      ),
    ));
  }
}

class BudgetTitle extends StatelessWidget {
  const BudgetTitle({
    super.key,
    required this.droppedDown,
  });

  final bool droppedDown;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Budget",
          style: Theme.of(context).textTheme.titleMedium,
        ),
        IconButton(
            onPressed: () => {},
            icon: Icon(
              droppedDown ? Icons.arrow_drop_up : Icons.arrow_drop_down_sharp,
            ))
      ],
    );
  }
}
