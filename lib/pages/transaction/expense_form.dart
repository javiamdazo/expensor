import 'package:expensor/model/account.dart';
import 'package:expensor/model/category.dart';
import 'package:expensor/pages/category/category_provider.dart';
import 'package:expensor/services/database_service.dart';
import 'package:expensor/widgets/space.dart';
import 'package:flutter/material.dart';

class ExpenseForm extends StatefulWidget {
  final List<Account> accounts;
  const ExpenseForm({Key? key, required this.accounts}) : super(key: key);

  @override
  _ExpenseFormState createState() => _ExpenseFormState();
}

class _ExpenseFormState extends State<ExpenseForm> {
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _accountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: _descriptionController,
          decoration: const InputDecoration(
            labelText: "Description",
            icon: Icon(Icons.description),
          ),
        ),
        Space(),
        GestureDetector(
          onTap: () => {
            _showAccountsPicker(context, widget.accounts, _accountController),
          },
          child: AbsorbPointer(
            child: TextFormField(
                controller: _accountController,
                decoration: const InputDecoration(
                  icon: Icon(Icons.account_balance_wallet),
                )),
          ),
        ),
        Space(),
        GestureDetector(
          onTap: () => {
            _showCategoriesPicker(context, CategoryProvider.getCategories(), _categoryController),
          },
          child: AbsorbPointer(
            child: TextFormField(
                controller: _categoryController,
                decoration: InputDecoration(
                  icon: _categoryController.text.isEmpty
                      ? Icon(Icons.category)
                      : null,
                )),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _descriptionController.dispose();
    _accountController.dispose();
    super.dispose();
  }
}

void _showCategoriesPicker(BuildContext context, List<Category> categories,
    TextEditingController controller) {
  showModalBottomSheet(
    context: context,
    builder: (context) {
      return Column(
        children: [
          Text("Select a category", style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.black),),
          Space(space: SpaceEnum.triple,),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5,
              ),
              itemCount: categories.length,
              itemBuilder: (context, index) {
                Category category = categories[index];

                return GestureDetector(
                  onTap: () {
                    controller.value = TextEditingValue(
                      text: "Category: ${category.name}",
                    );
                    Navigator.of(context).pop();
                  },
                  child: Column(
                    children: [
                      Icon(category.icon, color: category.color,),
                      Text(category.name),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      );
    },
  );
}

void _showAccountsPicker(BuildContext context, List<Account> accounts,
    TextEditingController controller) {
  showModalBottomSheet(
    context: context,
    builder: (context) {
      return ListView.builder(
        itemCount: accounts.length,
        itemBuilder: (context, index) {
          Account account = accounts[index];

          return ListTile(
            leading: Icon(account.icon, color: account.color,),
            title: Text(account.name),
            onTap: () {
              controller.value = TextEditingValue(
                text: "From: ${account.name}",
              );
              Navigator.of(context).pop();
            },
          );
        },
      );
    },
  );
}
