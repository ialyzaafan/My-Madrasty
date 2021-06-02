import 'package:flutter/material.dart';
import 'package:madrasty/style/style.dart';

class Paratext extends StatelessWidget {
  final String text;
  Paratext({@required this.text});
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: paragraphStyle,
    );
  }
}
