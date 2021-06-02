import 'package:madrasty/models/exam.dart';
import 'package:madrasty/models/searchDelegate.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:madrasty/models/user.dart';
import 'package:madrasty/style/style.dart';
import 'package:madrasty/views/exam/reviewExam.dart';
import 'package:madrasty/views/exam/scroll.dart';
import 'package:madrasty/views/general/widgets/buttonWithIcon.dart';
import 'package:madrasty/views/general/widgets/listSimple2.dart';
import 'package:madrasty/views/general/widgets/parentContainer.dart';
import 'package:madrasty/views/profileUI/myAcc.dart';

import '../notifications/notficationMethods.dart';

class UsersList extends StatefulWidget {
  final List users;
  final String title;
  final int pageId;
  UsersList(this.users, this.title, this.pageId);

  @override
  _UsersListState createState() => _UsersListState();
}

class _UsersListState extends State<UsersList> {
  List _list = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _list = widget.users;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              icon: Icon(
                Icons.search,
                color: mainColor,
              ),
              onPressed: () {
                showSearch(
                    context: context, delegate: DataSearch(widget.users, []));
              }),
        ],
        backgroundColor: backgroundColor,
        elevation: 0,
        title: Text(
          widget.title,
          style: titleStyle,
        ),
        iconTheme: IconThemeData(color: mainColor),
      ),
      backgroundColor: backgroundColor,
      body: ParentContainer(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: widget.users.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListSimple2(
                        attendances: widget.users[index].attendances,
                        title: widget.users[index].name,
                        imgUrl: widget.users[index].imgUrl,
                        route: widget.pageId == 1
                            ? ReviewExam(arabicExam, widget.users[index], zod)
                            : MyProfile(widget.users[index]));
                  }),
            ),
            widget.pageId == 1
                ? ButtonWithIcon(
                    onPress: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (_) => SamplePage([
                                {'User': spiderMan, 'Exam': arabicExam},
                                {'User': superMan, 'Exam': arabicExam},
                              ])));
                    },
                    title: 'REVIEW ALL',
                    icon: false)
                : Container()
          ],
        ),
      ),
    );
  }
}
