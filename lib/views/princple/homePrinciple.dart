import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:madrasty/models/bus.dart';
import 'package:madrasty/models/subject.dart';
import 'package:madrasty/models/user.dart';
import 'package:madrasty/style/style.dart';
import 'package:madrasty/views/bus/listofBuses.dart';
import 'package:madrasty/views/chatUI/homeChat.dart';
import 'package:madrasty/views/child/classWorks.dart';
import 'package:madrasty/views/classrooms/schedule.dart';
import 'package:madrasty/views/general/General.dart';
import 'package:madrasty/views/profileUI/myAcc.dart';

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
            icon: new Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: 'Messages',
            icon: new Icon(Icons.mail),
          ),
          BottomNavigationBarItem(
            label: 'Account',
            icon: Icon(Icons.person),
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
      body: containerPadding(
        SingleChildScrollView(
          child: Wrap(
            children: [
              homeContainers('assets/icons/stuff.png', 'Staff',
                  ListOfStaff('Staff', staff), context),
              homeContainers('assets/icons/students.png', 'Students',
                  ListOfStaff('Grades', grades), context),
              homeContainers('assets/icons/transport.png', 'Buses',
                  ListOfBuses([bus1]), context),
              homeContainers('assets/icons/schedule.png', 'Schedule',
                  Schedule(spiderMan.classroom, User()), context),
            ],
          ),
        ),
      ),
    );
  }
}
