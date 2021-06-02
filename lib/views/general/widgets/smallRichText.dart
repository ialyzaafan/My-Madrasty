import 'package:flutter/material.dart';
import 'package:madrasty/style/style.dart';

class SmallRichText extends StatelessWidget {
  final String text1;
  final String text2;
  SmallRichText({
    @required this.text1,
    @required this.text2,
  });
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: text1,
        style: smallTitleStyle,
        children: [TextSpan(text: text2, style: backgroundTextStyle)],
      ),
    );
  }
}
