import 'package:expensor/accounts/entity/account_entity.dart';

class InversionAccount {
  AccountEntity account;
  double pL;
  double totalBalance;

  InversionAccount(
      {required this.account, required this.pL, required this.totalBalance});
}
