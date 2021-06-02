import 'package:flutter/material.dart';
import 'package:madrasty/assets/my_flutter_app_icons.dart';
import 'package:madrasty/models/calenderClass.dart';
import 'package:madrasty/models/classroom.dart';
import 'package:madrasty/models/installmentClass.dart';
import 'package:madrasty/models/subject.dart';
import 'package:madrasty/models/user.dart';
import 'package:madrasty/style/style.dart';
import 'package:madrasty/views/attendence/attendenceVIew.dart';
import 'package:madrasty/views/chatUI/homeChat.dart';
import 'package:madrasty/views/child/classWorks.dart';
import 'package:madrasty/views/classrooms/Schedule.dart';
import 'package:madrasty/views/general/widgets/smallText.dart';
import 'package:madrasty/views/notifications/notficationMethods.dart';
import 'package:madrasty/views/general/widgets/homeContainers.dart';
import 'package:madrasty/views/general/widgets/parentContainer.dart';
import 'package:madrasty/views/notifications/HomeNotfications.dart';
import 'package:madrasty/views/parent/installment/installment.dart';
import 'package:madrasty/views/profileUI/myAcc.dart';
import 'package:madrasty/views/teacher/teacherCalender.dart';

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
            icon: new Icon(MyFlutterApp.browser),
          ),
          BottomNavigationBarItem(
              label: 'Messages',
              icon: new Icon(
                MyFlutterApp.group_13,
              )),
          BottomNavigationBarItem(
            label: 'Account',
            icon: Icon(MyFlutterApp.user__1_),
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
                          SmallText(text: i.name)
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
        child: ParentContainer(
          child: Wrap(
            spacing: 2.0,
            children: [
              HomeContainers(
                  img: 'assets/icons/notf.png',
                  title: 'Notifications',
                  child: HomeNotfications()),
              HomeContainers(
                img: 'assets/icons/classwork.png',
                title: 'Classwork',
                child:
                    ClassworksList(classworkslist, 'Classworks', widget.parent),
              ),
              HomeContainers(
                img: 'assets/icons/homework.png',
                title: 'Homework',
                child: ClassworksList(
                    classworkslist
                        .where((i) => i.type == SubjectType.Homwork)
                        .toList(),
                    'Homeworks',
                    widget.parent),
              ),
              HomeContainers(
                img: 'assets/icons/projects.png',
                title: 'Projects',
                child: ClassworksList(
                    classworkslist
                        .where((i) => i.type == SubjectType.Projects)
                        .toList(),
                    'Projects',
                    widget.parent),
              ),
              HomeContainers(
                img: 'assets/icons/extraclasses.png',
                title: 'Extraclasses',
                child: ClassworksList(
                    classworkslist
                        .where((i) => i.type == SubjectType.Extra)
                        .toList(),
                    'Extra Classes',
                    widget.parent),
              ),
              HomeContainers(
                  img: 'assets/icons/schedule.png',
                  title: 'Schedule',
                  child: TeacherCalender(calender1)),
              HomeContainers(
                img: 'assets/icons/exams.png',
                title: 'Exams',
                child:
                    ClassworksList(selectedChild.exams, 'Exams', widget.parent),
              ),
              HomeContainers(
                  img: 'assets/icons/evulation.png',
                  title: 'Evaluations',
                  child: Container()),
              HomeContainers(
                  img: 'assets/icons/attendence.png',
                  title: 'Attendance',
                  child: AttendView(selectedChild)),
              HomeContainers(
                  img: 'assets/icons/money.png',
                  title: 'Installments',
                  child: Installment(installments)),
            ],
          ),
        ),
      ),
    );
  }
}
