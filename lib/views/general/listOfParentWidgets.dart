import 'package:flutter/material.dart';
import 'package:madrasty/style/style.dart';
import 'package:madrasty/views/general/userList.dart';

import 'General.dart';

class ListofParentWidgets extends StatelessWidget {
  final String title;
  final List list;
  ListofParentWidgets(this.title, this.list);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        iconTheme: IconThemeData(color: mainColor),
        backgroundColor: backgroundColor,
        elevation: 0,
        title: Text(
          title,
          style: titleStyle,
        ),
      ),
      body: containerPadding(
        ListView.builder(
            itemCount: list.length,
            itemBuilder: (BuildContext context, int index) {
              return buildLisTileSimple(
                  context,
                  list[index].title,
                  UsersList(list[index].students, list[index].title, null),
                  list[index].students.length != null ||
                          list[index].students.length != 0
                      ? list[index].students.length
                      : 0,
                  list[index].imgUrl,
                  title == 'Classes' || title == 'My Classes'
                      ? 'Students'
                      : '');
            }),
      ),
    );
  }
}
