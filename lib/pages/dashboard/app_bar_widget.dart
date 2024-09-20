import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

CupertinoNavigationBar buildCustomCupertinoNavigationBar(BuildContext context, String title) {
  final brightness = CupertinoTheme.of(context).brightness;

  return CupertinoNavigationBar(
      backgroundColor:
          brightness == Brightness.dark ? CupertinoColors.black : Colors.white,
      automaticallyImplyLeading: false,
      middle: Text(
        title,
        style: TextStyle(
            fontSize: 18,
            color: brightness == Brightness.dark ? Colors.white : Colors.black),
      ),
      trailing: GestureDetector(
        onTap: () {
          // Handle notifications tap
        },
        child: Icon(
          CupertinoIcons.person,
          color: brightness == Brightness.dark ? Colors.white : Colors.black,
        ),
      ));
}
