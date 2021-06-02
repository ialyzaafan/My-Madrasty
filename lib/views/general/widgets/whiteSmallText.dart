import 'package:flutter/material.dart';
import 'package:madrasty/style/style.dart';

class WhiteSmallText extends StatelessWidget {
  final String text;
  WhiteSmallText({@required this.text});
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: whiteSmallTitleStyle,
    );
  }
}
