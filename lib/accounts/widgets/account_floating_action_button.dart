import 'package:expensor/accounts/page/account_form_page.dart';
import 'package:expensor/utils/ux_colors.dart';
import 'package:expensor/widgets/bottom_modal.dart';
import 'package:flutter/material.dart';

class AccountFloatingActionButton extends StatelessWidget {
  const AccountFloatingActionButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () =>
          {BottomModal.showBottomModal(context, const AccountFormPage())},
      backgroundColor: Theme.of(context).colorScheme.primary,
      child: Icon(
        Icons.add,
        color: UxColors.clouds.value,
      ),
    );
  }
}
