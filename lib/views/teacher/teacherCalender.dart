import 'package:flutter/material.dart';
import 'package:madrasty/assets/my_flutter_app_icons.dart';
import 'package:madrasty/models/calenderClass.dart';
import 'package:madrasty/models/user.dart';
import 'package:madrasty/style/style.dart';
import 'package:madrasty/views/general/General.dart';
import 'package:intl/intl.dart';
import 'package:madrasty/views/notifications/HomeNotfications.dart';

class TeacherCalender extends StatefulWidget {
  final List<CalenderClass> _clndrList;
  TeacherCalender(this._clndrList);
  @override
  _TeacherCalenderState createState() => _TeacherCalenderState();
}

class _TeacherCalenderState extends State<TeacherCalender>
    with TickerProviderStateMixin {
  int _index = 0;
  bool _isPlaying = false;
  AnimationController _animationController;
  Animation<double> _pulseAnimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));

    _pulseAnimation = Tween<double>(begin: 1.0, end: 1.2).animate(
        CurvedAnimation(parent: _animationController, curve: Curves.easeIn));

    _pulseAnimation.addStatusListener((status) {
      if (status == AnimationStatus.completed)
        _animationController.reverse();
      else if (status == AnimationStatus.dismissed)
        _animationController.forward();
    });
    if (_isPlaying)
      _animationController.stop();
    else
      _animationController.forward();
  }

  @override
  dispose() {
    _animationController.dispose(); // you need this

    super.dispose();
  }

  Widget _buildCalender(index, starttime, hrs, mins, duration, length, location,
      subjName, year, title) {
    return Column(
      children: [
        Row(
          children: [
            DateTime.now().isAfter(starttime) &&
                    DateTime.now().isBefore(starttime.add(duration))
                ? ScaleTransition(
                    scale: _pulseAnimation,
                    child: Container(
                      child: Image.asset('assets/icons/timer.png'),
                    ),
                  )
                : Icon(
                    Icons.timer,
                    size: 20,
                    color: mainColor,
                  ),
            SizedBox(
              width: 5,
            ),
            Text(
              (TimeOfDay(hour: hrs, minute: mins)).hour.toString() +
                  ':' +
                  (TimeOfDay(hour: hrs, minute: mins)).minute.toString() +
                  ' ' +
                  (TimeOfDay(hour: hrs, minute: mins).period == DayPeriod.am
                      ? 'AM'
                      : 'PM'),
              style: paragraphStyle,
            ),
          ],
        ),
        Container(
            constraints:
                BoxConstraints(minWidth: MediaQuery.of(context).size.width),
            child: cardWithBorder(
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      subjName,
                      style: smallTitleStyle,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.alarm_add_outlined,
                          size: 20,
                          color: mainColor,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          duration.inHours.toString() + ' Hrs',
                          style: paragraphStyle,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Icon(
                          MyFlutterApp.child,
                          color: mainColor,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          students.length.toString() + ' Students',
                          style: paragraphStyle,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Icon(
                          MyFlutterApp.location,
                          color: mainColor,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          year + title + ' ' + location,
                          style: paragraphStyle,
                        )
                      ],
                    ),
                  ],
                ),
                backgroundColor))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: mainColor),
        title: Text(
          'Calender',
          style: titleStyle,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => HomeNotfications()));
              },
              child: Icon(
                Icons.notifications_outlined,
                color: mainColor,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            color: Colors.white,
            height: 120,
            child: ListView.builder(
              itemCount: widget._clndrList.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        _index = index;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          constraints: BoxConstraints(minWidth: 70),
                          child: roundedCard(
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    DateFormat('EEEE')
                                        .format(widget._clndrList[index].day)
                                        .substring(0, 3),
                                    style: _index == index
                                        ? whiteSmallTitleStyle
                                        : smallTitleStyle,
                                  ),
                                  Text(
                                    widget._clndrList[index].day.day.toString(),
                                    style: _index == index
                                        ? whiteParagraphStyle
                                        : paragraphStyle,
                                  )
                                ],
                              ),
                              _index == index ? mainColor : backgroundColor,
                              0.0),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 2, bottom: 0),
                          child: CircleAvatar(
                              radius: 5,
                              backgroundColor:
                                  _index == index ? mainColor : Colors.white),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: containerPadding(ListView.builder(
              itemCount: widget._clndrList[_index].todo.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: _buildCalender(
                      index,
                      widget._clndrList[_index].todo[index].startTime,
                      widget._clndrList[_index].todo[index].startTime.hour,
                      widget._clndrList[_index].todo[index].startTime.minute,
                      widget._clndrList[_index].todo[index].duration,
                      widget._clndrList[_index].todo[index].classRoom.students
                          .length,
                      widget._clndrList[_index].todo[index].classRoom.location,
                      widget._clndrList[_index].todo[index].subjectName,
                      widget._clndrList[_index].todo[index].classRoom.year,
                      widget._clndrList[_index].todo[index].classRoom.title),
                );
              },
            )),
          )
        ],
      ),
      backgroundColor: backgroundColor,
    );
  }
}
