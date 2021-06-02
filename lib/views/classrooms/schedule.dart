import 'package:flutter/material.dart';
import 'package:madrasty/models/classroom.dart';
import 'package:madrasty/models/subject.dart';
import 'package:madrasty/models/user.dart';
import 'package:madrasty/style/style.dart';
import 'package:intl/intl.dart';

/*class Schedule extends StatefulWidget {
  final User user;
  final Classroom classroom;
  Schedule(this.classroom, this.user);
  @override
  _ScheduleState createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {
  bool _compareDate(DateTime dateToCheck) {
    bool isToday;
    final now = DateTime.now();
    final nowName = DateFormat('EEEE').format(now);
    final checkName = DateFormat('EEEE').format(dateToCheck);

    if (nowName == checkName) {
      isToday = true;
    } else {
      isToday = false;
    }
    return isToday;
  }

  @override
  Widget build(BuildContext context) {
    final times = getTimes(startTime, endTime, step)
        .map((tod) => tod.format(context))
        .toList();
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        actions: [
          widget.user.type == Type.Teacher ||
                  widget.user.type == Type.Admin ||
                  widget.user.type == Type.Principle
              ? IconButton(
                  onPressed: () {}, icon: Icon(Icons.filter, color: mainColor))
              : Container()
        ],
        title: Text(
          'School  Schedule',
          style: titleStyle,
        ),
        elevation: 0,
        backgroundColor: backgroundColor,
        iconTheme: IconThemeData(
          color: mainColor, //change your color here
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Wrap(
                children: [
                  widget.user.type == Type.Teacher ||
                          widget.user.type == Type.Admin ||
                          widget.user.type == Type.Principle
                      ? Container(
                          constraints: BoxConstraints(
                              maxWidth:
                                  MediaQuery.of(context).size.width / 3.5),
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  CircleAvatar(
                                    backgroundColor: backgroundColor,
                                    child: Icon(Icons.close, color: mainColor),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8),
                                    child: Text(
                                      '${widget.classroom.year}' +
                                          '${widget.classroom.title}',
                                      style: smallTitleStyle,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                          ),
                        )
                      : Container()
                ],
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: Card(
                    elevation: 5,
                    color: backgroundColor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: times
                          .map((e) => Padding(
                                padding:
                                    const EdgeInsets.only(left: 20, top: 60),
                                child: Column(
                                  children: [
                                    Text(e),
                                    SizedBox(
                                      height: 60,
                                    )
                                  ],
                                ),
                              ))
                          .toList(),
                    ),
                  ),
                ),
                Expanded(
                    flex: 3,
                    child: Container(
                      child: Stack(
                        children: [
                          Column(
                            children: times
                                .map((e) => Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20, top: 60),
                                      child: Column(
                                        children: [
                                          Divider(),
                                          SizedBox(
                                            height: 60,
                                          )
                                        ],
                                      ),
                                    ))
                                .toList(),
                          ),
                          Positioned(
                              top: 0,
                              left: 20,
                              right: 0,
                              bottom: 0,
                              child: Container(
                                  child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount:
                                    widget.classroom.schedule.week.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        constraints: BoxConstraints(
                                            minWidth: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                1.8),
                                        child: Card(
                                            color: _compareDate(widget
                                                        .classroom
                                                        .schedule
                                                        .week[index]
                                                        .dateDay) &&
                                                    widget.classroom.schedule
                                                            .week[index].type ==
                                                        DayType.Normal
                                                ? mainColor
                                                : _compareDate(widget
                                                            .classroom
                                                            .schedule
                                                            .week[index]
                                                            .dateDay) &&
                                                        widget
                                                                .classroom
                                                                .schedule
                                                                .week[index]
                                                                .type ==
                                                            DayType.Vacation
                                                    ? Colors.greenAccent
                                                    : secondryColor,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Center(
                                                child: Text(
                                                  widget.classroom.schedule
                                                      .week[index].day,
                                                  style: whiteSmallTitleStyle,
                                                ),
                                              ),
                                            )),
                                      ),
                                      SizedBox(
                                        height: 30,
                                      ),
                                      for (var i in widget.classroom.schedule
                                          .week[index].classes)
                                        Column(
                                          children: [
                                            Container(
                                              padding:
                                                  EdgeInsets.only(left: 20),
                                              constraints: BoxConstraints(
                                                minHeight: 100,
                                                minWidth: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    2,
                                              ),
                                              child: i.title != 'Break'
                                                  ? Card(
                                                      color: i.type ==
                                                              SubjectType.Extra
                                                          ? secondryColor
                                                          : Colors.white,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12.0),
                                                      ),
                                                      child: Center(
                                                          child: Text(i.title)))
                                                  : Container(),
                                            ),
                                            SizedBox(
                                              height: 40,
                                            )
                                          ],
                                        )
                                    ],
                                  );
                                },
                              )))
                        ],
                      ),
                    ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
*/
