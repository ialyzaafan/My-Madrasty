import 'package:flutter/material.dart';
import 'package:madrasty/style/style.dart';
import 'package:madrasty/views/general/widgets/ContainerForButtons.dart';

class ElevatedButtonSecond extends StatelessWidget {
  final String title;
  final Function onpress;

  ElevatedButtonSecond({@required this.onpress, @required this.title});

  @override
  Widget build(BuildContext context) {
    return ContainerForButtons(
      child: ElevatedButton(
        onPressed: onpress,
        child: Text(
          title,
          style: maincolorLightSmall,
        ),
      ),
    );
  }
}
