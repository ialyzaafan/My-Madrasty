import 'package:flutter/material.dart';
import 'package:madrasty/views/general/widgets/whiteSmallText.dart';

class ElevatedButtonWhiteSmall extends StatelessWidget {
  final String text;
  final Function func;
  ElevatedButtonWhiteSmall({
    @required this.func,
    @required this.text,
  });
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: func,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: WhiteSmallText(
            text: text,
          ),
        ));
  }
}
