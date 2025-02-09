import 'package:expensor/data/entity/account_entity.dart';
import 'package:expensor/data/entity/transaction_entity.dart';
import 'package:expensor/pages/transaction/expense_form.dart';
import 'package:expensor/data/repositories/accounts_repository.dart';
import 'package:expensor/data/repositories/transactions_repository.dart';
import 'package:expensor/widgets/formatted_number.dart';
import 'package:expensor/widgets/space.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TransactionPage extends StatefulWidget {
  const TransactionPage({Key? key}) : super(key: key);

  @override
  State<TransactionPage> createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  int _selectedSegment = 0;

  List<TransactionEntity> transactions = [];
  List<AccountEntity> accounts = [];

  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).brightness == Brightness.dark
        ? Colors.white
        : Colors.black;

    double height = MediaQuery.of(context).size.height;
    return Container(
      width: double.infinity,
      height: height * 0.8,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.centerLeft,
            children: [
              Center(
                child: Text(
                  "NEW TRANSACTION",
                  style: Theme.of(context)
                      .textTheme
                      .labelSmall!
                      .copyWith(color: color),
                ),
              ),
              IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: Icon(Icons.arrow_back, color: color),
              )
            ],
          ),
          FormattedNumber(
              number: 0,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: color,
                  ),
              numberType: NumberType.currency),
          Space(
            space: SpaceEnum.double,
          ),
          CupertinoSlidingSegmentedControl<int>(
            backgroundColor:
                Theme.of(context).colorScheme.primary, // Background color
            thumbColor: Colors.white, // Thumb (slider) color
            groupValue: _selectedSegment, // Current selected value
            onValueChanged: (int? newValue) {
              if (newValue != null) {
                setState(() {
                  print(newValue);
                  _selectedSegment = newValue;
                });
              }
            },
            children: {
              0: Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: Text("EXPENSE",
                    style: TextStyle(
                        color:
                            _selectedSegment == 0 ? Colors.black : Colors.white,
                        fontWeight: FontWeight.bold)),
              ),
              1: Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: Text("INCOME",
                    style: TextStyle(
                        color:
                            _selectedSegment == 1 ? Colors.black : Colors.white,
                        fontWeight: FontWeight.bold)),
              ),
              2: Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: Text("TRANSFER",
                    style: TextStyle(
                        color:
                            _selectedSegment == 2 ? Colors.black : Colors.white,
                        fontWeight: FontWeight.bold)),
              ),
            },
          ),
          Space(space: SpaceEnum.double),
          Expanded(
            child: Builder(
              builder: (context) {
                switch (_selectedSegment) {
                  case 0:
                    return ExpenseForm(accounts: [],);
                  case 1:
                    return Text("Income",
                        style: Theme.of(context).textTheme.bodyLarge);
                  case 2:
                    return Text("Transfer",
                        style: Theme.of(context).textTheme.bodyLarge);
                  default:
                    return SizedBox.shrink(); // Fallback empty widget
                }
              },
            ),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.primary,
                padding: const EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () => {},
              child: const Text("SAVE",
                  style: TextStyle(
                      color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
            ),
          )
        ],
      ),
    );
  }
}
