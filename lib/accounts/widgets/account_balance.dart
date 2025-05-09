import 'package:expensor/accounts/mock/accounts_mock.dart';
import 'package:expensor/accounts/model/account.dart';
import 'package:expensor/common/theme_data.dart';
import 'package:expensor/widgets/formatted_number.dart';
import 'package:expensor/common/widgets/space.dart';
import 'package:expensor/widgets/profitability.dart';
import 'package:flutter/material.dart';

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
      decoration: BoxDecoration(color: AppThemeData.selectedPrimaryColor),
      height: MediaQuery.of(context).size.height * 0.1,
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FormattedNumber(
              number: selectedAccount != null
                  ? selectedAccount!.balance
                  : totalBalance,
              style: AppThemeData.appTextTheme.titleLarge,
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
                    spaceSize: SpaceSize.double, spaceType: SpaceType.width),
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
