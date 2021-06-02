import 'package:flutter/material.dart';
import 'package:madrasty/assets/my_flutter_app_icons.dart';
import 'package:madrasty/models/bus.dart';
import 'package:madrasty/models/exam.dart';
import 'package:madrasty/models/subject.dart';
import 'package:madrasty/models/user.dart';
import 'package:madrasty/style/style.dart';
import 'package:madrasty/views/bus/busView.dart';
import 'package:madrasty/views/chatUI/homeChat.dart';
import 'package:madrasty/views/child/classWorks.dart';
import 'package:madrasty/views/notifications/notficationMethods.dart';
import 'package:madrasty/views/general/widgets/parentContainer.dart';

import 'package:madrasty/views/profileUI/profileOut.dart';

class HomeChild extends StatefulWidget {
  @override
  _HomeChildState createState() => _HomeChildState();
}

class _HomeChildState extends State<HomeChild> {
  int _currentIndex = 0;

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  final List<Widget> _children = [
    HomeChildList(spiderMan),
    ChatsHome(),
    BusView(bus1),
    ProfileChild(spiderMan)
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
            icon: Icon(MyFlutterApp.location),
          ),
          BottomNavigationBarItem(
            label: 'Account',
            icon: Icon(MyFlutterApp.user__1_),
          )
        ],
      ),
    );
  }
}

class HomeChildList extends StatefulWidget {
  final User user;
  HomeChildList(this.user);
  @override
  _HomeChildListState createState() => _HomeChildListState();
}

class _HomeChildListState extends State<HomeChildList> {
  bool checkAvatar(List classworks) {
    var contain = classworks.where((element) => element.isRead == false);
    return contain.isEmpty ? true : false;
  }

  Widget buildListTile(
      String img, String title, Widget route, BuildContext context, List list) {
    Color color;

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: ListTile(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) => route));
        },
        contentPadding: EdgeInsets.all(20),
        leading: CircleAvatar(
          radius: 30.0,
          backgroundColor: backgroundColor,
          child: Image.asset(img),
        ),
        title: Text(title),
        subtitle: Text(''),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        actions: [],
        backgroundColor: backgroundColor,
        elevation: 0,
        title: Text(
          'Today',
          style: titleStyle,
        ),
      ),
      body: ParentContainer(
        child: ListView(
          children: [
            widget.user.type == Type.Child
                ? buildListTile(
                    'assets/icons/classwork.png',
                    'Classwork',
                    ClassworksList(todayClassworks, 'Classworks', widget.user),
                    context,
                    todayClassworks)
                : Container(),
            buildListTile(
                'assets/icons/homework.png',
                'Homework',
                ClassworksList(todayHomeworks, 'Homeworks', widget.user),
                context,
                todayHomeworks),
            buildListTile(
                'assets/icons/projects.png',
                'Projects',
                ClassworksList(todayProjects, 'Projects', widget.user),
                context,
                todayProjects),
            buildListTile(
                'assets/icons/exams.png',
                'Exams',
                ClassworksList(todayExams, 'Exams', widget.user),
                context,
                todayExams),
            widget.user.type == Type.Child
                ? buildListTile(
                    'assets/icons/extraclasses.png',
                    'Extra Classes',
                    ClassworksList(todayExtra, 'Extra classes', widget.user),
                    context,
                    todayExtra)
                : Container(),
            buildListTile(
                'assets/icons/evulation.png',
                'Evaluations',
                ClassworksList(todayProjects, 'Projects', widget.user),
                context,
                todayProjects),
          ],
        ),
      ),
    );
  }
}
