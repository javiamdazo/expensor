import 'package:expensor/data/mock/categories_mock.dart';
import 'package:expensor/pages/transaction/transaction_page.dart';
import 'package:expensor/provider/model/category.dart';
import 'package:expensor/widgets/space.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconpicker/flutter_iconpicker.dart';

class AccountForm extends StatefulWidget {
  const AccountForm({Key? key}) : super(key: key);

  @override
  State<AccountForm> createState() => _AccountFormState();
}

class _AccountFormState extends State<AccountForm> {
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

    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.4,
        padding: const EdgeInsets.all(20),
        child: Column(
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
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: "Name",
                labelStyle: Theme.of(context).textTheme.labelSmall,
                icon: const Icon(Icons.wallet),
              ),
            ),
            Space(),
            GestureDetector(
              onTap: () => showIconPicker(context),
              child: AbsorbPointer(
                child: TextFormField(
                  controller: _iconController,
                  decoration: InputDecoration(
                    labelText: "Select an icon",
                    labelStyle: Theme.of(context).textTheme.labelSmall,
                    icon: _selectedCategoryIcon ?? const Icon(Icons.category),
                  ),
                ),
              ),
            ),
            Space(
              space: SpaceEnum.triple,
            ),
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
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: color,
                          fontWeight: FontWeight.bold,
                          fontSize: 32,
                        ),
                    inputFormatters: [ThousandsFormatter()],
                    decoration: InputDecoration(
                      hintText: "€0.00",
                      hintStyle:
                          TextStyle(color: Colors.grey.shade400, fontSize: 32),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
            const Expanded(
              child: SizedBox(),
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
      ),
    );
  }
}
