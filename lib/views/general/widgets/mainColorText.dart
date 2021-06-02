import 'package:flutter/material.dart';
import 'package:madrasty/style/style.dart';

class MainText extends StatelessWidget {
  final String text;
  MainText({@required this.text});
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: mainColorTextStyle,
    );
  }
}
