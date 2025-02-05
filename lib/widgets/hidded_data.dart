import 'package:flutter/material.dart';

class HiddedData extends StatelessWidget {
  final TextStyle? style;
const HiddedData({ Key? key, required this.style }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Text("******", style: style);
  }
}