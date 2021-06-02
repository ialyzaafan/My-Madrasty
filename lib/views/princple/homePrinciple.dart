import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:madrasty/assets/my_flutter_app_icons.dart';
import 'package:madrasty/models/bus.dart';
import 'package:madrasty/models/calenderClass.dart';
import 'package:madrasty/models/subject.dart';
import 'package:madrasty/models/user.dart';
import 'package:madrasty/style/style.dart';
import 'package:madrasty/views/bus/listofBuses.dart';
import 'package:madrasty/views/chatUI/homeChat.dart';
import 'package:madrasty/views/classrooms/schedule.dart';
import 'package:madrasty/views/notifications/notficationMethods.dart';
import 'package:madrasty/views/general/widgets/homeContainers.dart';
import 'package:madrasty/views/general/widgets/parentContainer.dart';
import 'package:madrasty/views/profileUI/myAcc.dart';
import 'package:madrasty/views/teacher/teacherCalender.dart';

import 'ListofStaff.dart';

class HomePrinciple extends StatefulWidget {
  @override
  _HomePrincipleState createState() => _HomePrincipleState();
}

class _HomePrincipleState extends State<HomePrinciple> {
  int _currentIndex = 0;
  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  final List<Widget> _children = [
    PrincpleManagment(),
    ChatsHome(),
    MyProfile(zod)
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: _children[_currentIndex]),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: mainColor,
        unselectedItemColor: Colors.grey,
        onTap: onTabTapped,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex:
            _currentIndex, // this will be set when a new tab is tapped
        items: [
          BottomNavigationBarItem(
            label: 'Home',
            icon: new Icon(MyFlutterApp.browser),
          ),
          BottomNavigationBarItem(
            label: 'Messages',
            icon: new Icon(MyFlutterApp.group_13),
          ),
          BottomNavigationBarItem(
            label: 'Account',
            icon: Icon(MyFlutterApp.user__1_),
          )
        ],
      ),
      backgroundColor: backgroundColor,
    );
  }
}

class PrincpleManagment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        title: Text('School Managment', style: titleStyle),
        elevation: 0,
      ),
      backgroundColor: backgroundColor,
      body: ParentContainer(
        child: SingleChildScrollView(
          child: Wrap(
            children: [
              HomeContainers(
                img: 'assets/icons/stuff.png',
                title: 'Staff',
                child: ListOfStaff('Staff', staff),
              ),
              HomeContainers(
                img: 'assets/icons/students.png',
                title: 'Students',
                child: ListOfStaff('Grades', grades),
              ),
              HomeContainers(
                img: 'assets/icons/transport.png',
                title: 'Buses',
                child: ListOfBuses([bus1]),
              ),
              HomeContainers(
                  img: 'assets/icons/schedule.png',
                  title: 'Schedule',
                  child: TeacherCalender(calender1)),
            ],
          ),
        ),
      ),
    );
  }
}
