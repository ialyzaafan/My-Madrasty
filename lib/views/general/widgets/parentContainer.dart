import 'package:flutter/material.dart';

class ParentContainer extends StatelessWidget {
  final Widget child;
  ParentContainer({this.child});
  @override
  Widget build(BuildContext context) {
    return Container(padding: EdgeInsets.all(20.0), child: child);
  }
}
