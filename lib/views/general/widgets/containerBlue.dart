import 'package:flutter/material.dart';
import 'package:madrasty/style/style.dart';

class ContainerBlue extends StatelessWidget {
  final Widget child;
  ContainerBlue({@required this.child});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
          color: secondryColor,
          borderRadius: BorderRadius.all(Radius.circular(12))),
    );
  }
}
