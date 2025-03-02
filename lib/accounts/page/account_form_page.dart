import 'package:expensor/data/mock/categories_mock.dart';
import 'package:expensor/pages/transaction/transaction_page.dart';
import 'package:expensor/provider/model/category.dart';
import 'package:expensor/common/widgets/space.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconpicker/flutter_iconpicker.dart';
import 'package:flutter/services.dart';

class AccountFormPage extends StatefulWidget {
  const AccountFormPage({super.key});

  @override
  State<AccountFormPage> createState() => _AccountFormPageState();
}

class _AccountFormPageState extends State<AccountFormPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _iconController = TextEditingController();
  final TextEditingController _balanceController = TextEditingController();

  List<Category> categories = CategoriesMock.categories;
  Icon? _selectedCategoryIcon;

  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).brightness == Brightness.dark
        ? Colors.white
        : Colors.black;

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            constraints: BoxConstraints(
              maxHeight: constraints.maxHeight * 0.6,
            ),
            child: SingleChildScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Stack(
                    alignment: Alignment.centerLeft,
                    children: [
                      Center(
                        child: Text(
                          "NEW ACCOUNT",
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
                    controller: _nameController,
                    decoration: InputDecoration(
                      labelText: "Name",
                      labelStyle: Theme.of(context).textTheme.labelSmall,
                      icon: const Icon(Icons.wallet),
                    ),
                  ),
                  const Space(),
                  GestureDetector(
                    onTap: () => showIconPicker(context),
                    child: AbsorbPointer(
                      child: TextFormField(
                        controller: _iconController,
                        decoration: InputDecoration(
                          labelText: "Select an icon",
                          labelStyle: Theme.of(context).textTheme.labelSmall,
                          icon: _selectedCategoryIcon ??
                              const Icon(Icons.category),
                        ),
                      ),
                    ),
                  ),
                  const Space(spaceSize: SpaceSize.triple),
                  Row(
                    children: [
                      Text(
                        "Initial balance: ",
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                      Expanded(
                        child: TextFormField(
                          controller: _balanceController,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          style:
                              Theme.of(context).textTheme.titleLarge!.copyWith(
                                    color: color,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 32,
                                  ),
                          inputFormatters: [ThousandsFormatter()],
                          autofocus: true,
                          decoration: InputDecoration(
                            hintText: "€0.00",
                            hintStyle: TextStyle(
                                color: Colors.grey.shade400, fontSize: 32),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Space(),
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
            ),
          );
        },
      ),
    );
  }
}
