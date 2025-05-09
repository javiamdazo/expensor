import 'package:expensor/accounts/mock/accounts_mock.dart';
import 'package:expensor/accounts/page/account_item_page.dart';
import 'package:expensor/accounts/page/account_item_detail_page.dart';
import 'package:expensor/accounts/model/account.dart';
import 'package:expensor/accounts/widgets/account_floating_action_button.dart';
import 'package:expensor/accounts/widgets/account_appbar.dart';
import 'package:expensor/accounts/widgets/account_balance.dart';
import 'package:flutter/material.dart';

class AccountsPage extends StatefulWidget {
  const AccountsPage({super.key});

  @override
  AccountsPageState createState() => AccountsPageState();
}

class AccountsPageState extends State<AccountsPage> {
  Account? _selectedAccount;
  final List<Account> accounts = AccountsMock.accounts;

  void _selectAccount(int index) {
    setState(() {
      _selectedAccount = accounts[index];
    });
  }

  void _deselectAccount() {
    setState(() {
      _selectedAccount = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AccountAppBar(),
      floatingActionButton: const AccountFloatingActionButton(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AccountBalance(
            accounts: accounts,
            selectedAccount: _selectedAccount,
          ),
          Expanded(
              child: _selectedAccount != null
                  ? AccountItemDetailPage(
                      account: _selectedAccount!,
                      onTap: _deselectAccount,
                    )
                  : ListView.builder(
                      key: const ValueKey('accountList'),
                      itemCount: accounts.length,
                      itemBuilder: (context, index) {
                        Account account = accounts[index];
                        return AccountItemPage(
                          account: account,
                          onTap: () => _selectAccount(index),
                          selected: false,
                        );
                      },
                    ))
        ],
      ),
    );
  }
}
