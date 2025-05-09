import 'package:expensor/accounts/mock/accounts_mock.dart';
import 'package:expensor/data/mock/categories_mock.dart';
import 'package:expensor/pages/transaction/income_expense_form.dart';
import 'package:expensor/pages/transaction/transfer_form.dart';
import 'package:expensor/common/widgets/space.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TransactionPage extends StatefulWidget {
  final int firstIndex;
  const TransactionPage({super.key, required this.firstIndex});

  @override
  State<TransactionPage> createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  final TextEditingController _amountController = TextEditingController();
  int tabIndex = 0;

  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).brightness == Brightness.dark
        ? Colors.white
        : Colors.black;

    double height = MediaQuery.of(context).size.height;
    return Container(
      width: double.infinity,
      height: height * 0.60,
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
          const Divider(),
          TextFormField(
            controller: _amountController,
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            autofocus: true,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: color,
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                ),
            inputFormatters: [ThousandsFormatter()],
            decoration: InputDecoration(
              hintText: "€0.00",
              hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 32),
              border: InputBorder.none,
            ),
          ),
          const Space(
            spaceSize: SpaceSize.double,
          ),
          CupertinoSlidingSegmentedControl<int>(
            backgroundColor:
                Theme.of(context).colorScheme.primary, // Background color
            thumbColor: Colors.white, // Thumb (slider) color
            groupValue: tabIndex, // Current selected value
            onValueChanged: (int? newValue) {
              if (newValue != null) {
                setState(() {
                  tabIndex = newValue;
                });
              }
            },
            children: {
              0: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Text("EXPENSE",
                    style: TextStyle(
                        color: tabIndex == 0 ? Colors.black : Colors.white,
                        fontWeight: FontWeight.bold)),
              ),
              1: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Text("INCOME",
                    style: TextStyle(
                        color: tabIndex == 1 ? Colors.black : Colors.white,
                        fontWeight: FontWeight.bold)),
              ),
              2: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Text("TRANSFER",
                    style: TextStyle(
                        color: tabIndex == 2 ? Colors.black : Colors.white,
                        fontWeight: FontWeight.bold)),
              ),
            },
          ),
          const Space(spaceSize: SpaceSize.double),
          Expanded(
            child: Builder(
              builder: (context) {
                switch (tabIndex) {
                  case 0:
                    return IncomeExpenseForm(
                      accounts: AccountsMock.accounts,
                      categories: CategoriesMock.categories,
                    );
                  case 1:
                    return IncomeExpenseForm(
                      accounts: AccountsMock.accounts,
                      categories: CategoriesMock.categories,
                    );
                  case 2:
                    return TransferForm(
                      accounts: AccountsMock.accounts,
                      categories: CategoriesMock.categories,
                    );
                  default:
                    return const SizedBox.shrink();
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
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold)),
            ),
          )
        ],
      ),
    );
  }
}

class ThousandsFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String text = newValue.text;

    if (text.contains("€")) {
      text = text.replaceAll(" €", '');
    }

    return newValue.copyWith(
      text: "$text €",
      selection: TextSelection.collapsed(offset: text.length),
    );
  }
}
