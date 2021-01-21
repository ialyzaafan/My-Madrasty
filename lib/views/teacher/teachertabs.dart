import 'package:flutter/material.dart';
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
            icon: new Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: 'Messages',
            icon: new Icon(Icons.mail),
          ),
          BottomNavigationBarItem(
            label: 'Bus',
            icon: Icon(Icons.drive_eta),
          ),
          BottomNavigationBarItem(
            label: 'Account',
            icon: Icon(Icons.person),
          ),
          BottomNavigationBarItem(
            label: 'Categories',
            icon: Icon(Icons.category_outlined),
          ),
        ],
      ),
    );
  }
}
