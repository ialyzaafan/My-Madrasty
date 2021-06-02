import 'package:flutter/material.dart';
import 'package:madrasty/style/style.dart';
import 'package:madrasty/views/general/userList.dart';
import 'package:madrasty/views/general/widgets/buildListSimple.dart';
import 'package:madrasty/views/general/widgets/parentContainer.dart';

import '../notifications/notficationMethods.dart';

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
      body: ParentContainer(
        child: ListView.builder(
            itemCount: list.length,
            itemBuilder: (BuildContext context, int index) {
              return BuildListSimple(
                  title: list[index].title,
                  route:
                      UsersList(list[index].students, list[index].title, null),
                  length: list[index].students.length != null ||
                          list[index].students.length != 0
                      ? list[index].students.length
                      : 0,
                  imgUrl: list[index].imgUrl,
                  title2: title == 'Classes' || title == 'My Classes'
                      ? 'Students'
                      : '');
            }),
      ),
    );
  }
}
