import 'package:flutter/material.dart';
import 'package:madrasty/models/calenderClass.dart';
import 'package:madrasty/models/classroom.dart';
import 'package:madrasty/models/library.dart';

import 'package:madrasty/models/user.dart';
import 'package:madrasty/style/style.dart';
import 'package:madrasty/views/Library/library.dart';
import 'package:madrasty/views/attendence/attendenceVIew.dart';

import 'package:madrasty/views/child/classWorks.dart';
import 'package:madrasty/views/classrooms/schedule.dart';
import 'package:madrasty/views/general/General.dart';
import 'package:madrasty/views/general/listOfParentWidgets.dart';
import 'package:madrasty/views/teacher/teacherCalender.dart';

import 'myAcc.dart';

class ProfileChild extends StatelessWidget {
  final User user;
  ProfileChild(this.user);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        actions: [
          IconButton(
              color: mainColor,
              icon: Icon(
                Icons.info_outline,
                color: mainColor,
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => MyProfile(zod)));
              })
        ],
        title: Text(
          'Profile',
          style: titleStyle,
        ),
        backgroundColor: backgroundColor,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: containerPadding(
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/avatars/zod.jpg'),
                ),
                RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(children: [
                      TextSpan(text: zod.name, style: smallTitleStyle),
                      TextSpan(text: '\n'),
                      TextSpan(
                        text: 'class',
                        style: backgroundTextStyle,
                      )
                    ])),
                SizedBox(
                  height: 30,
                ),
                user.type == Type.Child
                    ? Wrap(
                        children: [
                          homeContainers(
                              'assets/icons/classwork.png',
                              'Classwork',
                              ClassworksList([], 'Classworks', user),
                              context),
                          homeContainers(
                              'assets/icons/homework.png',
                              'Homework',
                              ClassworksList([], 'Homeworks', user),
                              context),
                          homeContainers(
                              'assets/icons/projects.png',
                              'Projects',
                              ClassworksList([], 'Projects', user),
                              context),
                          homeContainers(
                              'assets/icons/extraclasses.png',
                              'Extraclasses',
                              ClassworksList([], 'Extra classes', user),
                              context),
                          homeContainers('assets/icons/library.png', 'Library',
                              LibraryView(schoolLibrary), context),
                          homeContainers(
                              'assets/icons/schedule.png',
                              'My Schedule',
                              TeacherCalender(calender1),
                              context),
                          homeContainers('assets/icons/exams.png', 'Exams',
                              ClassworksList([], 'Exams', user), context),
                          homeContainers('assets/icons/evulation.png',
                              'Evaluations', Container(), context),
                          homeContainers('assets/icons/attendence.png',
                              'Attendance', AttendView(user), context),
                        ],
                      )
                    : Wrap(
                        children: [
                          homeContainers('assets/icons/balance.png',
                              'My Balance', AttendView(user), context),
                          homeContainers(
                              'assets/icons/classes.png',
                              'My Classes',
                              ListofParentWidgets('My Clases', classrooms),
                              context),
                        ],
                      )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
