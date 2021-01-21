import 'package:flutter/material.dart';
import 'package:madrasty/models/classroom.dart';
import 'package:madrasty/models/installmentClass.dart';
import 'package:madrasty/models/subject.dart';
import 'package:madrasty/models/user.dart';
import 'package:madrasty/style/style.dart';
import 'package:madrasty/views/attendence/attendenceVIew.dart';
import 'package:madrasty/views/chatUI/homeChat.dart';
import 'package:madrasty/views/child/classWorks.dart';
import 'package:madrasty/views/classrooms/Schedule.dart';
import 'package:madrasty/views/general/General.dart';
import 'package:madrasty/views/notifications/HomeNotfications.dart';
import 'package:madrasty/views/parent/installment/installment.dart';
import 'package:madrasty/views/profileUI/myAcc.dart';

class Home extends StatefulWidget {
  final Parent parent;
  Home(this.parent);
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _children = [
      MyChild(widget.parent),
      ChatsHome(),
      MyProfile(zod)
    ];

    return Scaffold(
      body: SafeArea(child: _children[_currentIndex]),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: mainColor,
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
    );
  }
}

class MyChild extends StatefulWidget {
  final Parent parent;
  MyChild(this.parent);
  @override
  _MyChildState createState() => _MyChildState();
}

class _MyChildState extends State<MyChild> {
  Child selectedChild;
  // ignore: must_call_super
  void initState() {
    selectedChild = spiderMan;
  }

  List<Classworks> classworkslist = [];
  List<Homework> homeWorklist = [];
  List<Projects> projects = [];
  List<Extraclasses> extras = [];
  List<InstallmentClass> installments = [];
  Classroom classroom = spiderMan.classroom;
  Widget _buildAboutDialog(BuildContext context) {
    return new AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      title: Center(child: const Text('Choose Child')),
      content: new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Center(
            child: Wrap(
              children: [
                for (var i in widget.parent.children)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          selectedChild = i;
                          classworkslist = i.classworks;
                          homeWorklist = i.homeworks;
                          extras = i.extraClasses;
                          projects = i.projects;
                          installments = i.installments;
                          classroom = i.classroom;
                        });

                        Navigator.pop(context);
                      },
                      child: Column(
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage(i.imgUrl),
                            backgroundColor: secondryColor,
                            radius: 60,
                            child: i.imgUrl == null
                                ? Icon(
                                    Icons.person,
                                    color: mainColor,
                                  )
                                : Container(),
                          ),
                          Text(i.name, style: smallTitleStyle)
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          )
        ],
      ),
      actions: <Widget>[],
    );
  }

  @override
  Widget build(BuildContext context) {
    print(selectedChild.id);
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) =>
                      _buildAboutDialog(context));
            },
            icon: Icon(
              Icons.switch_account,
              color: mainColor,
            ),
          )
        ],
        title: Text('My Children', style: titleStyle),
        backgroundColor: backgroundColor,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: containerPadding(
          Wrap(
            spacing: 2.0,
            children: [
              homeContainers('assets/icons/notf.png', 'Notifications',
                  HomeNotfications(), context),
              homeContainers(
                  'assets/icons/classwork.png',
                  'Classwork',
                  ClassworksList(classworkslist, 'Classworks', widget.parent),
                  context),
              homeContainers(
                  'assets/icons/homework.png',
                  'Homework',
                  ClassworksList(homeWorklist, 'Homeworks', widget.parent),
                  context),
              homeContainers('assets/icons/projects.png', 'Projects',
                  ClassworksList(projects, 'Projects', widget.parent), context),
              homeContainers(
                  'assets/icons/extraclasses.png',
                  'Extraclasses',
                  ClassworksList(extras, 'Extra Classes', widget.parent),
                  context),
              homeContainers('assets/icons/schedule.png', 'Schedule',
                  Schedule(classroom, selectedChild), context),
              homeContainers(
                  'assets/icons/exams.png',
                  'Exams',
                  ClassworksList(selectedChild.exams, 'Exams', widget.parent),
                  context),
              homeContainers('assets/icons/evulation.png', 'Evaluations',
                  Container(), context),
              homeContainers('assets/icons/attendence.png', 'Attendance',
                  AttendView(selectedChild), context),
              homeContainers('assets/icons/money.png', 'Installments',
                  Installment(installments), context),
            ],
          ),
        ),
      ),
    );
  }
}
