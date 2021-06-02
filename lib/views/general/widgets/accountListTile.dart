import 'package:flutter/material.dart';
import 'package:madrasty/style/style.dart';
import 'package:madrasty/views/general/widgets/textBackground.dart';

import 'mainColorText.dart';

class AccountListtile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subTitle;

  AccountListtile(
      {@required this.icon, @required this.title, @required this.subTitle});
  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: MainText(text: title),
        subtitle: TextBackground(
          text: subTitle,
        ),
        leading: Icon(
          icon,
          color: mainColor,
        ));
  }
}
