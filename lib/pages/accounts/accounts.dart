import 'package:expensor/data/mock/accounts_mock.dart';
import 'package:expensor/pages/accounts/account_form.dart';
import 'package:expensor/pages/accounts/account_item.dart';
import 'package:expensor/provider/model/account.dart';
import 'package:expensor/utils/ux_colors.dart';
import 'package:expensor/widgets/bottom_modal.dart';
import 'package:expensor/widgets/formatted_number.dart';
import 'package:expensor/widgets/profitability.dart';
import 'package:expensor/widgets/space.dart';
import 'package:flutter/material.dart';

class Accounts extends StatefulWidget {
  Accounts({Key? key}) : super(key: key);

  @override
  _AccountsState createState() => _AccountsState();
}

class _AccountsState extends State<Accounts> {
  String reason = '';

  void onPageChange(int index, changeReason) {
    setState(() {
      reason = changeReason.toString();
    });
  }

  int _current = 0;
  String? _accountName;
  int? _expandedIndex;
  final List<Account> accounts = AccountsMock.accounts;

  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final double totalBalance = AccountsMock.getTotalBalance();

    return Scaffold(
      floatingActionButton: const AccountsFloatingActionButton(),
      body: Stack(
        children: [
          ...accountsBackground(),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.02,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () => {},
                          icon: const Icon(Icons.settings)),
                      IconButton(
                          onPressed: () => {}, icon: const Icon(Icons.search)),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          FormattedNumber(
                            number: _expandedIndex != null
                                ? accounts[_current].balance
                                : totalBalance,
                            style: Theme.of(context).textTheme.titleLarge,
                            numberType: NumberType.currency,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                _expandedIndex != null
                                    ? _accountName!
                                    : 'Total balance',
                                style: Theme.of(context).textTheme.labelMedium,
                              ),
                              Space(
                                  space: SpaceEnum.double,
                                  spaceType: SpaceType.width),
                              Profitability(
                                  number: accounts[_current].profitability,
                                  style:
                                      Theme.of(context).textTheme.labelMedium)
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                      child: ListView.builder(
                    itemCount: accounts.length,
                    itemBuilder: (context, index) {
                      Account account = accounts[index];
                      bool isExpanded = _expandedIndex == index;
                      return Column(
                        children: [
                          AccountItem(
                            account: account,
                            onTap: () => {
                              setState(() {
                                _expandedIndex =
                                    _expandedIndex == index ? null : index;
                                _current = index;
                                _accountName = account.name;
                                _scrollController.animateTo(
                                  index *
                                      100.0, // Ajusta la posición en la lista
                                  duration: Duration(milliseconds: 300),
                                  curve: Curves.easeInOut,
                                );
                              })
                            },
                            index: index,
                            currentIndex: _current,
                            isExpanded: isExpanded,
                          ),
                        ],
                      );
                    },
                  ))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Positioned> accountsBackground() {
    return [
      Positioned(
        top: 0,
        left: 0,
        right: 0,
        height: MediaQuery.of(context).size.height * 0.2,
        child: Container(
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
      Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: Container(
            color: Theme.of(context).colorScheme.surface,
          ))
    ];
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
