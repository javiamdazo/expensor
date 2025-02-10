import 'package:carousel_slider/carousel_slider.dart';
import 'package:expensor/data/mock/accounts_mock.dart';
import 'package:expensor/pages/transaction/transaction_page.dart';
import 'package:expensor/provider/model/account.dart';
import 'package:expensor/utils/ux_colors.dart';
import 'package:expensor/widgets/bottom_modal.dart';
import 'package:expensor/widgets/formatted_number.dart';
import 'package:flutter/material.dart';

class Accounts extends StatefulWidget {
  Accounts({Key? key}) : super(key: key);

  @override
  _AccountsState createState() => _AccountsState();
}

class _AccountsState extends State<Accounts> {
  String reason = '';
  final CarouselSliderController _controller = CarouselSliderController();

  void onPageChange(int index, CarouselPageChangedReason changeReason) {
    setState(() {
      reason = changeReason.toString();
    });
  }

  int _current = 0;
  final List<Account> accounts = AccountsMock.accounts;

  @override
  Widget build(BuildContext context) {
    final double totalBalance = AccountsMock.getTotalBalance();

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          BottomModal.showBottomModal(
              context,
              TransactionPage(
                tabIndex: 1,
              ))
        },
        backgroundColor: Theme.of(context).colorScheme.primary,
        child: Icon(
          Icons.add,
          color: UxColors.clouds.value,
        ),
      ),
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: MediaQuery.of(context).size.height * 0.25,
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
            ),
          ),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.02,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      IconButton(
                          onPressed: () => {},
                          icon: const Icon(Icons.settings)),
                      CarouselSlider(
                        items: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FormattedNumber(
                                number: totalBalance,
                                style: Theme.of(context).textTheme.titleLarge,
                                numberType: NumberType.currency,
                              ),
                              Text(
                                "Total Balance",
                                style: Theme.of(context).textTheme.labelMedium,
                              ),
                            ],
                          ),
                          // **Other Slides: Individual Account Balances**
                          ...accounts.map((account) {
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FormattedNumber(
                                  number: account.balance,
                                  style: Theme.of(context).textTheme.titleLarge,
                                  numberType: NumberType.currency,
                                ),
                                Text(
                                  account.name,
                                  style:
                                      Theme.of(context).textTheme.labelMedium,
                                ),
                              ],
                            );
                          }).toList(),
                        ],
                        options: CarouselOptions(
                          height: MediaQuery.of(context).size.width * 0.4,
                          onPageChanged: (index, reason) {
                            setState(() {
                              _current = index;
                            });
                          },
                        ),
                        carouselController: _controller,
                      ),
                    ],
                  ),
                  Expanded(
                      child: ListView.builder(
                    itemCount: accounts.length,
                    itemBuilder: (context, index) {
                      Account account = accounts[index];
                      return Card(
                        color: index == (_current - 1)
                            ? Theme.of(context)
                                .colorScheme
                                .primary
                                .withAlpha(150)
                            : Theme.of(context).colorScheme.surface,
                        margin: const EdgeInsets.symmetric(vertical: 5),
                        child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              children: [
                                ListTile(
                                  onTap: () => {
                                    setState(() {
                                      _current = index + 1;
                                      _controller.animateToPage(index + 1);
                                    })
                                  },
                                  leading: Container(
                                    decoration: BoxDecoration(
                                        color: account.color.withAlpha(50),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(10))),
                                    width: 40,
                                    height: 40,
                                    child: Icon(
                                      account.icon,
                                      color: account.color,
                                    ),
                                  ),
                                  title: Text(
                                    account.name,
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayMedium,
                                  ),
                                  trailing: FormattedNumber(
                                      number: account.balance,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall!
                                          .copyWith(color: Colors.grey),
                                      numberType: NumberType.currency),
                                ),
                                const Divider(
                                  height: 1,
                                )
                              ],
                            )),
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
}
