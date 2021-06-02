import 'package:flutter/material.dart';

class RoundedCard extends StatelessWidget {
  final Color color;
  final Widget child;
  RoundedCard({@required this.color, this.child});
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.0,
      color: color,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: child,
      ),
    );
  }
}
