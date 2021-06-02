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
import 'package:madrasty/views/general/widgets/smallRichText.dart';
import 'package:madrasty/views/notifications/notficationMethods.dart';
import 'package:madrasty/views/general/listOfParentWidgets.dart';
import 'package:madrasty/views/general/widgets/homeContainers.dart';
import 'package:madrasty/views/general/widgets/parentContainer.dart';
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
        child: ParentContainer(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/avatars/zod.jpg'),
                ),
                SmallRichText(text1: zod.name, text2: 'class'),
                SizedBox(
                  height: 30,
                ),
                user.type == Type.Child
                    ? Wrap(
                        children: [
                          HomeContainers(
                            img: 'assets/icons/classwork.png',
                            title: 'Classwork',
                            child: ClassworksList([], 'Classworks', user),
                          ),
                          HomeContainers(
                            img: 'assets/icons/homework.png',
                            title: 'Homework',
                            child: ClassworksList([], 'Homeworks', user),
                          ),
                          HomeContainers(
                            img: 'assets/icons/projects.png',
                            title: 'Projects',
                            child: ClassworksList([], 'Projects', user),
                          ),
                          HomeContainers(
                            img: 'assets/icons/extraclasses.png',
                            title: 'Extraclasses',
                            child: ClassworksList([], 'Extra classes', user),
                          ),
                          HomeContainers(
                              img: 'assets/icons/library.png',
                              title: 'Library',
                              child: LibraryView(schoolLibrary)),
                          HomeContainers(
                            img: 'assets/icons/schedule.png',
                            title: 'My Schedule',
                            child: TeacherCalender(calender1),
                          ),
                          HomeContainers(
                            img: 'assets/icons/exams.png',
                            title: 'Exams',
                            child: ClassworksList([], 'Exams', user),
                          ),
                          HomeContainers(
                              img: 'assets/icons/evulation.png',
                              title: 'Evaluations',
                              child: Container()),
                          HomeContainers(
                              img: 'assets/icons/attendence.png',
                              title: 'Attendance',
                              child: AttendView(user)),
                        ],
                      )
                    : Wrap(
                        children: [
                          HomeContainers(
                            img: 'assets/icons/balance.png',
                            title: 'My Balance',
                            child: AttendView(user),
                          ),
                          HomeContainers(
                            img: 'assets/icons/classes.png',
                            title: 'My Classes',
                            child: ListofParentWidgets('My Clases', classrooms),
                          ),
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
