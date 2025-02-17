import 'package:expensor/pages/kpis/accounts/account_kpi_item.dart';
import 'package:expensor/provider/model/account.dart';
import 'package:expensor/provider/model/category.dart';
import 'package:expensor/widgets/space.dart';
import 'package:flutter/material.dart';

class TransferForm extends StatefulWidget {
  final List<Account> accounts;
  final List<Category> categories;
  const TransferForm(
      {super.key, required this.accounts, required this.categories});

  @override
  TransferFormState createState() => TransferFormState();
}

class TransferFormState extends State<TransferForm> {
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _originAccountController =
      TextEditingController();
  final TextEditingController _destinyAccountController =
      TextEditingController();

  Icon? _selectedCategoryIcon;
  Icon? _selectedOriginAccountIcon;
  Icon? _selectedDestinyAccountIcon;

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
        const Space(),
        GestureDetector(
          onTap: () => _showAccountsPicker(
              context, widget.accounts, _originAccountController, true),
          child: AbsorbPointer(
            child: TextFormField(
              controller: _originAccountController,
              decoration: InputDecoration(
                labelText: "Select an origin account",
                labelStyle: Theme.of(context).textTheme.labelSmall,
                icon: _selectedOriginAccountIcon ??
                    const Icon(Icons.account_balance_wallet),
              ),
            ),
          ),
        ),
        const Space(),
        GestureDetector(
          onTap: () => _showAccountsPicker(
              context, widget.accounts, _destinyAccountController, false),
          child: AbsorbPointer(
            child: TextFormField(
              controller: _destinyAccountController,
              decoration: InputDecoration(
                labelText: "Select an destiny account",
                labelStyle: Theme.of(context).textTheme.labelSmall,
                icon: _selectedDestinyAccountIcon ??
                    const Icon(Icons.account_balance_wallet),
              ),
            ),
          ),
        ),
        const Space(),
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
    _originAccountController.dispose();
    _categoryController.dispose();
    _destinyAccountController.dispose();
    super.dispose();
  }

  void _showCategoriesPicker(BuildContext context, List<Category> categories) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Categories",
                style: Theme.of(context).textTheme.displayMedium,
              ),
              const Space(
                space: SpaceEnum.double,
              ),
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
                              size:
                                  MediaQuery.of(context).size.aspectRatio * 80),
                          const Space(),
                          Text(category.name),
                        ],
                      ),
                    );
                  },
                ),
              ),
              TextButton(
                  onPressed: () => {},
                  child: Text(
                    "New category",
                    style: Theme.of(context).textTheme.displayMedium,
                  ))
            ],
          ),
        );
      },
    );
  }

  void _showAccountsPicker(BuildContext context, List<Account> accounts,
      TextEditingController controller, bool isOrigin) {
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
                      if (isOrigin) {
                        _selectedOriginAccountIcon =
                            Icon(account.icon, color: account.color);
                      } else {
                        _selectedDestinyAccountIcon =
                            Icon(account.icon, color: account.color);
                      }
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
