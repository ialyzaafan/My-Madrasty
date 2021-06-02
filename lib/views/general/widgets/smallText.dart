import 'package:flutter/material.dart';
import 'package:madrasty/style/style.dart';

class SmallText extends StatelessWidget {
  final String text;
  SmallText({@required this.text});
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: smallTitleStyle,
    );
  }
}
