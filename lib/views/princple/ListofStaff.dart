import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:madrasty/models/user.dart';

import 'package:madrasty/style/style.dart';
import 'package:madrasty/views/general/General.dart';
import 'package:madrasty/views/general/listOfParentWidgets.dart';

class ListOfStaff extends StatefulWidget {
  final String title;
  final List list;
  ListOfStaff(this.title, this.list);
  @override
  _ListOfStaffState createState() => _ListOfStaffState();
}

class _ListOfStaffState extends State<ListOfStaff> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          actions: [],
          backgroundColor: backgroundColor,
          elevation: 0,
          iconTheme: IconThemeData(color: mainColor),
          title: Text(
            widget.title,
            style: titleStyle,
          ),
        ),
        body: containerPadding(
          ListView.builder(
            itemCount: widget.list.length,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () {},
                child: buildLisTileSimple(
                    context,
                    widget.list[index].title,
                    ListofParentWidgets(
                        widget.title == 'Grades'
                            ? 'Classes'
                            : widget.list[index].type == Type.Teacher
                                ? 'Teachers'
                                : widget.list[index].type == Type.Admin
                                    ? 'Admins'
                                    : widget.list[index].type == Type.Guard
                                        ? 'Guards'
                                        : widget.list[index].type ==
                                                Type.Supervisor
                                            ? 'Supervisors'
                                            : 'Bus Supervisors',
                        widget.title == 'Grades'
                            ? widget.list[index].classrooms
                            : widget.list[index].classes),
                    widget.title == 'Grades'
                        ? widget.list[index].classrooms.length
                        : widget.list[index].classes.length,
                    widget.list[index].imgURL,
                    widget.title == 'Grades' ? 'Classes' : 'Departments'),
              );
            },
          ),
        ));
  }
}
