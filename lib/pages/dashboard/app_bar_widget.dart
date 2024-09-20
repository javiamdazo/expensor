import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

CupertinoNavigationBar buildCustomCupertinoNavigationBar(BuildContext context) {
  final brightness = CupertinoTheme.of(context).brightness;

  return CupertinoNavigationBar(
      backgroundColor: brightness == Brightness.dark
                      ? CupertinoColors.black
                      : Colors.white,
      leading: GestureDetector(
        onTap: () {
          // Show the drawer or perform your desired action
          // Here you might implement a modal or another way to show navigation options
        },
        child: Icon(CupertinoIcons.bars, color: brightness == Brightness.dark
                      ? Colors.white
                      : Colors.black,),
      ),
      middle: Row(
        children: [
          CircleAvatar(
            backgroundColor: CupertinoColors.activeBlue,
            child: Text("JA", style: TextStyle(color: brightness == Brightness.dark
                      ? Colors.black
                      : Colors.white)),
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hola de nuevo',
                style: TextStyle(fontSize: 10,color: brightness == Brightness.dark
                      ? Colors.white
                      : Colors.black),
              ),
              Text('Javier Andrés', style: TextStyle(color: brightness == Brightness.dark
                      ? Colors.white
                      : Colors.black),),
            ],
          ),
        ],
      ),
      trailing: GestureDetector(
        onTap: () {
          // Handle notifications tap
        },
        child: Icon(CupertinoIcons.gear, color: brightness == Brightness.dark
                      ? Colors.white
                      : Colors.black,),
      ));
}
