import 'package:flutter/material.dart';
import 'package:madrasty/style/style.dart';
import 'package:madrasty/views/general/widgets/parentContainer.dart';

class Layout extends StatelessWidget {
  final String title;
  final Widget child;
  final List<Widget> actions;
  Layout({@required this.title, @required this.child, this.actions});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        actions: actions ?? [],
        title: Text(
          title,
          style: titleStyle,
        ),
        elevation: 0,
        backgroundColor: backgroundColor,
        iconTheme: IconThemeData(color: mainColor),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: ParentContainer(
          child: child,
        ),
      ),
    );
  }
}
