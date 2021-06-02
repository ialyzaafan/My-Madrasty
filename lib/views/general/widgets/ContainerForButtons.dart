import 'package:flutter/material.dart';

class ContainerForButtons extends StatelessWidget {
  final Widget child;
  ContainerForButtons({this.child});
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
          minWidth: MediaQuery.of(context).size.width, minHeight: 48),
      child: child,
    );
  }
}
