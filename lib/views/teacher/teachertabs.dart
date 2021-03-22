import 'package:flutter/material.dart';
import 'package:madrasty/assets/my_flutter_app_icons.dart';
import 'package:madrasty/models/bus.dart';
import 'package:madrasty/models/calenderClass.dart';
import 'package:madrasty/models/user.dart';
import 'package:madrasty/style/style.dart';
import 'package:madrasty/views/bus/busView.dart';
import 'package:madrasty/views/chatUI/homeChat.dart';
import 'package:madrasty/views/child/homeChild.dart';
import 'package:madrasty/views/profileUI/profileOut.dart';
import 'package:madrasty/views/teacher/teacherCalender.dart';

class TeacherTabs extends StatefulWidget {
  @override
  _TeacherTabsState createState() => _TeacherTabsState();
}

class _TeacherTabsState extends State<TeacherTabs> {
  int _currentIndex = 0;

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  final List<Widget> _children = [
    TeacherCalender(calender1),
    ChatsHome(),
    BusView(bus1),
    ProfileChild(zod),
    HomeChildList(zod),
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
            icon: new Icon(MyFlutterApp.calendar__1_),
          ),
          BottomNavigationBarItem(
            label: 'Messages',
            icon: new Icon(MyFlutterApp.group_13),
          ),
          BottomNavigationBarItem(
            label: 'Bus',
            icon: Icon(MyFlutterApp.location),
          ),
          BottomNavigationBarItem(
            label: 'Account',
            icon: Icon(MyFlutterApp.user__1_),
          ),
          BottomNavigationBarItem(
            label: 'Categories',
            icon: Icon(MyFlutterApp.open_menu),
          ),
        ],
      ),
    );
  }
}
