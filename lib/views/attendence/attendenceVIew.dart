import 'package:flutter/material.dart';
import 'package:madrasty/models/user.dart';
import 'package:madrasty/style/style.dart';
import 'package:madrasty/views/attendence/LeaveRequest.dart';
import 'package:madrasty/views/general/General.dart';

class AttendView extends StatelessWidget {
  final user;
  AttendView(this.user);
  String gpa(int grade) {
    String gradeGpa;
    if (grade >= 95) {
      gradeGpa = 'A+';
    } else if (grade >= 90 && grade < 95) {
      gradeGpa = 'A';
    } else if (grade >= 85 && grade < 80) {
      gradeGpa = 'B+';
    } else if (grade >= 80 && grade < 85) {
      gradeGpa = 'B';
    } else {
      gradeGpa = 'C';
    }

    return gradeGpa;
  }

  Widget buildAbsentCard(BuildContext context, title, number, total, sign) {
    return Container(
      constraints: BoxConstraints(
          minWidth: MediaQuery.of(context).size.width / 2 - 20,
          maxWidth: MediaQuery.of(context).size.width),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                  textAlign: TextAlign.start,
                  text: TextSpan(children: [
                    TextSpan(text: number, style: maincolorLightBig),
                    TextSpan(text: sign, style: maincolorLightSmall),
                    TextSpan(
                      text: total,
                      style: maincolorLightSmall,
                    )
                  ])),
              Text(
                title,
                style: smallTitleStyle,
              )
            ],
          ),
        ),
      ),
    );
  }

  String _returnMonth(int month) {
    String monthString;
    switch (month) {
      case 1:
        monthString = 'January';
        break;
      case 2:
        monthString = 'February';
        break;
      case 3:
        monthString = 'March';
        break;
      case 4:
        monthString = 'April';
        break;
      case 5:
        monthString = 'May';
        break;
      case 6:
        monthString = 'June';
        break;
      case 7:
        monthString = 'July';
        break;
      case 8:
        monthString = 'August';
        break;
      case 9:
        monthString = 'September';
        break;
      case 10:
        monthString = 'October';
        break;
      case 11:
        monthString = 'November';
        break;
      case 12:
        monthString = 'December';
        break;
    }
    return monthString;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Attendance',
          style: titleStyle,
        ),
        elevation: 0,
        backgroundColor: backgroundColor,
        iconTheme: IconThemeData(color: mainColor),
      ),
      backgroundColor: backgroundColor,
      body: containerPadding(
        Column(
          children: [
            Row(
              children: [
                buildAbsentCard(context, 'Absent days',
                    '${user.attendances.length}', '30', '/'),
                buildAbsentCard(context, 'Sick leaves', '2', null, null),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            user.type == Type.Child
                ? Expanded(
                    child: ListView.builder(
                        itemCount: user.attendances.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            constraints: BoxConstraints(
                              minWidth: MediaQuery.of(context).size.width - 20,
                            ),
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12)),
                              child: Padding(
                                  padding: EdgeInsets.all(8),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            user.attendances[index].date.isUtc
                                                ? _returnMonth(user
                                                    .attendances[index]
                                                    .date
                                                    .month)
                                                : '',
                                            style: smallTitleStyle,
                                          ),
                                          Text(
                                            gpa((100 -
                                                    (user.attendances.length /
                                                        30 *
                                                        100))
                                                .round()),
                                            style: smallTitleStyle,
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Absent ${user.attendances.length} days',
                                            style: backgroundTextStyle,
                                          ),
                                          Text(
                                            (100 -
                                                        (user.attendances
                                                                .length /
                                                            30 *
                                                            100))
                                                    .round()
                                                    .toString() +
                                                '%',
                                            style: backgroundTextStyle,
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      LinearProgressIndicator(
                                        value: (1 -
                                            (user.attendances.length / 30)),
                                        backgroundColor: backgroundColor,
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                                mainColor),
                                        minHeight: 5,
                                      ),
                                    ],
                                  )),
                            ),
                          );
                        }),
                  )
                : Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Text(
                                  'You have a pending request for an annual leaves',
                                  style: paragraphStyle,
                                  maxLines: 3,
                                ),
                                FlatButton(
                                  child: Text(
                                    'Edit',
                                    style: smallTitleStyle,
                                  ),
                                  onPressed: () {},
                                )
                              ],
                            ),
                          ),
                          decoration: BoxDecoration(
                              color: secondryColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12))),
                        ),
                        buttonWithIcon(context, () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (_) => LeaveRequest()));
                        }, 'Request a day off', false)
                      ],
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
