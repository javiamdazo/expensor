import 'package:expensor/pages/kpis/accounts/account_kpi_item.dart';
import 'package:expensor/provider/model/account.dart';
import 'package:expensor/provider/model/category.dart';
import 'package:expensor/widgets/space.dart';
import 'package:flutter/material.dart';

class IncomeExpenseForm extends StatefulWidget {
  final List<Account> accounts;
  final List<Category> categories;
  const IncomeExpenseForm(
      {super.key, required this.accounts, required this.categories});

  @override
  IncomeExpenseFormState createState() => IncomeExpenseFormState();
}

class IncomeExpenseFormState extends State<IncomeExpenseForm> {
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _accountController = TextEditingController();

  Icon? _selectedCategoryIcon;
  Icon? _selectedAccountIcon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Container(
            constraints: BoxConstraints(
              maxHeight: constraints.maxHeight * 0.6,
            ),
            child: SingleChildScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    controller: _descriptionController,
                    decoration: InputDecoration(
                      labelText: "Description",
                      labelStyle: Theme.of(context).textTheme.labelSmall,
                      icon: const Icon(Icons.description),
                    ),
                  ),
                  const Space(),
                  GestureDetector(
                    onTap: () => _showAccountsPicker(
                        context, widget.accounts, _accountController),
                    child: AbsorbPointer(
                      child: TextFormField(
                        controller: _accountController,
                        decoration: InputDecoration(
                          labelText: "Select an account",
                          labelStyle: Theme.of(context).textTheme.labelSmall,
                          icon: _selectedAccountIcon ??
                              const Icon(Icons.account_balance_wallet),
                        ),
                      ),
                    ),
                  ),
                  const Space(),
                  GestureDetector(
                    onTap: () =>
                        _showCategoriesPicker(context, widget.categories),
                    child: AbsorbPointer(
                      child: TextFormField(
                        controller: _categoryController,
                        decoration: InputDecoration(
                          labelText: "Select a category",
                          labelStyle: Theme.of(context).textTheme.labelSmall,
                          icon: _selectedCategoryIcon ??
                              const Icon(Icons.category),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _descriptionController.dispose();
    _accountController.dispose();
    _categoryController.dispose();
    super.dispose();
  }

  void _showCategoriesPicker(BuildContext context, List<Category> categories) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        Color color = Theme.of(context).brightness == Brightness.dark
            ? Colors.white
            : Colors.black;

        return Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.remove,
                color: color,
              ),
              Text(
                "Categories",
                style: Theme.of(context)
                    .textTheme
                    .displayLarge!
                    .copyWith(color: color),
              ),
              const Space(),
              const Divider(),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                    ),
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      Category category = categories[index];

                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            _categoryController.text =
                                "Category: ${category.name}";
                            _selectedCategoryIcon =
                                Icon(category.icon, color: category.color);
                          });
                          Navigator.of(context).pop();
                        },

                        //TODO Group by theme
                        child: Column(
                          children: [
                            Icon(category.icon,
                                color: category.color,
                                size: MediaQuery.of(context).size.aspectRatio *
                                    80),
                            const Space(),
                            Text(category.name),
                          ],
                        ),
                      );
                    },
                  ),
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
      },
    );
  }

  void _showAccountsPicker(BuildContext context, List<Account> accounts,
      TextEditingController controller) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        Color color = Theme.of(context).brightness == Brightness.dark
            ? Colors.white
            : Colors.black;

        return Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.remove,
                color: color,
              ),
              Text(
                "Accounts",
                style: Theme.of(context)
                    .textTheme
                    .displayLarge!
                    .copyWith(color: color),
              ),
              const Space(),
              const Divider(),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: ListView.builder(
                    itemCount: accounts.length,
                    itemBuilder: (context, index) {
                      Account account = accounts[index];

                      return GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedAccountIcon =
                                  Icon(account.icon, color: account.color);
                              controller.value = TextEditingValue(
                                text: "From: ${account.name}",
                              );
                            });
                            Navigator.of(context).pop();
                          },
                          child: AccountKpiItem(
                              account: account, hideData: false));
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
