import 'package:flutter/material.dart';
import 'package:madrasty/views/general/widgets/smallText.dart';

import '../autoClosePage.dart';

class ElevatedButtonSmallText extends StatelessWidget {
  final String text;
  final Function func;
  ElevatedButtonSmallText({
    @required this.func,
    @required this.text,
  });
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(child: SmallText(text: text), onPressed: func);
  }
}
