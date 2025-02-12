import 'package:expensor/pages/kpis/accounts/account_kpi_item.dart';
import 'package:expensor/provider/model/account.dart';
import 'package:expensor/provider/model/category.dart';
import 'package:expensor/widgets/space.dart';
import 'package:flutter/material.dart';

class IncomeExpenseForm extends StatefulWidget {
  final List<Account> accounts;
  final List<Category> categories;
  const IncomeExpenseForm(
      {Key? key, required this.accounts, required this.categories})
      : super(key: key);

  @override
  _IncomeExpenseFormState createState() => _IncomeExpenseFormState();
}

class _IncomeExpenseFormState extends State<IncomeExpenseForm> {
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _accountController = TextEditingController();

  Icon? _selectedCategoryIcon;
  Icon? _selectedAccountIcon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: _descriptionController,
          decoration: InputDecoration(
            labelText: "Description",
            labelStyle: Theme.of(context).textTheme.labelSmall,
            icon: const Icon(Icons.description),
          ),
        ),
        Space(),
        GestureDetector(
          onTap: () =>
              _showAccountsPicker(context, widget.accounts, _accountController),
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
        Space(),
        GestureDetector(
          onTap: () => _showCategoriesPicker(context, widget.categories),
          child: AbsorbPointer(
            child: TextFormField(
              controller: _categoryController,
              decoration: InputDecoration(
                labelText: "Select a category",
                labelStyle: Theme.of(context).textTheme.labelSmall,
                icon: _selectedCategoryIcon ?? const Icon(Icons.category),
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _descriptionController.dispose();
    _accountController.dispose();
    _categoryController.dispose();
    super.dispose();
  }

  // Método mejorado para mostrar el selector de categorías y actualizar el estado
  void _showCategoriesPicker(BuildContext context, List<Category> categories) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(10),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 5,
            ),
            itemCount: categories.length,
            itemBuilder: (context, index) {
              Category category = categories[index];

              return GestureDetector(
                onTap: () {
                  setState(() {
                    _categoryController.text = "Category: ${category.name}";
                    _selectedCategoryIcon =
                        Icon(category.icon, color: category.color);
                  });
                  Navigator.of(context).pop();
                },
                child: Column(
                  children: [
                    Icon(category.icon, color: category.color),
                    Text(category.name),
                  ],
                ),
              );
            },
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
        return Padding(
          padding: const EdgeInsets.all(10),
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
                  child: AccountKpiItem(account: account, hideData: false));
            },
          ),
        );
      },
    );
  }
}
