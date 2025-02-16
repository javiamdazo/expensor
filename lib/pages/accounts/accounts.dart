import 'package:expensor/data/mock/accounts_mock.dart';
import 'package:expensor/pages/accounts/account_form.dart';
import 'package:expensor/pages/accounts/account_item.dart';
import 'package:expensor/pages/accounts/account_item_detail.dart';
import 'package:expensor/provider/model/account.dart';
import 'package:expensor/utils/ux_colors.dart';
import 'package:expensor/widgets/bottom_modal.dart';
import 'package:expensor/widgets/formatted_number.dart';
import 'package:expensor/widgets/profitability.dart';
import 'package:expensor/widgets/space.dart';
import 'package:flutter/material.dart';

class Accounts extends StatefulWidget {
  const Accounts({super.key});

  @override
  _AccountsState createState() => _AccountsState();
}

class _AccountsState extends State<Accounts> {
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
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        leading: IconButton(
          onPressed: () => {},
          icon: const Icon(Icons.settings),
        ),
        actions: [
          IconButton(
            onPressed: () => {},
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      floatingActionButton: const AccountsFloatingActionButton(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AccountBalance(
            accounts: accounts,
            selectedAccount: _selectedAccount,
          ),
          Expanded(
              child: _selectedAccount != null
                  ? AccountItemDetail(
                      account: _selectedAccount!,
                      onTap: _deselectAccount,
                    )
                  : ListView.builder(
                      key: const ValueKey('accountList'),
                      itemCount: accounts.length,
                      itemBuilder: (context, index) {
                        Account account = accounts[index];
                        return Hero(
                          tag: 'accountTitle-${account.accountId}',
                          child: AccountItem(
                            account: account,
                            onTap: () => _selectAccount(index),
                          ),
                        );
                      },
                    ))
        ],
      ),
    );
  }
}

class AccountBalance extends StatelessWidget {
  const AccountBalance({
    super.key,
    required this.accounts,
    required this.selectedAccount,
  });

  final List<Account> accounts;
  final Account? selectedAccount;

  @override
  Widget build(BuildContext context) {
    final double totalBalance = AccountsMock.getTotalBalance();
    const double totalProfitability = 4.56;

    return Container(
      decoration: BoxDecoration(color: Theme.of(context).colorScheme.primary),
      height: MediaQuery.of(context).size.height * 0.1,
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FormattedNumber(
              number: selectedAccount != null
                  ? selectedAccount!.balance
                  : totalBalance,
              style: Theme.of(context).textTheme.titleLarge,
              numberType: NumberType.currency,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  selectedAccount != null
                      ? selectedAccount!.name
                      : 'Total balance',
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                const Space(
                    space: SpaceEnum.double, spaceType: SpaceType.width),
                Profitability(
                    number: selectedAccount != null
                        ? selectedAccount!.profitability
                        : totalProfitability,
                    style: Theme.of(context).textTheme.labelMedium)
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class AccountsFloatingActionButton extends StatelessWidget {
  const AccountsFloatingActionButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () =>
          {BottomModal.showBottomModal(context, const AccountForm())},
      backgroundColor: Theme.of(context).colorScheme.primary,
      child: Icon(
        Icons.add,
        color: UxColors.clouds.value,
      ),
    );
  }
}
