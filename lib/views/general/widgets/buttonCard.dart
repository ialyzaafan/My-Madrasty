import 'package:flutter/material.dart';
import 'package:madrasty/views/general/widgets/roundedCard.dart';

class ButtonCard extends StatelessWidget {
  final Function function;
  final Color iconColor;
  final Color color;
  final IconData icon;
  ButtonCard({this.icon, this.color, this.iconColor, this.function});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: function,
      child: RoundedCard(
        color: color,
        child: Icon(
          icon,
          size: 30,
          color: iconColor,
        ),
      ),
    );
  }
}
