import 'package:flutter/material.dart';
import 'package:madrasty/style/style.dart';

class TextBackground extends StatelessWidget {
  final String text;
  TextBackground({@required this.text});
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: backgroundTextStyle,
      overflow: TextOverflow.ellipsis,
      maxLines: 2,
    );
  }
}
