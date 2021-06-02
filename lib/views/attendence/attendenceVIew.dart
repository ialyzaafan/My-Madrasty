import 'package:flutter/material.dart';
import 'package:madrasty/models/user.dart';
import 'package:madrasty/style/style.dart';
import 'package:madrasty/views/attendence/LeaveRequest.dart';
import 'package:madrasty/views/general/widgets/absentCard.dart';
import 'package:madrasty/views/general/widgets/buttonWithIcon.dart';
import 'package:madrasty/views/general/widgets/containerBlue.dart';
import 'package:madrasty/views/general/widgets/layout.dart';
import 'package:madrasty/views/general/widgets/paratext.dart';
import 'package:madrasty/views/general/widgets/parentContainer.dart';
import 'package:madrasty/views/general/widgets/smallText.dart';
import 'package:madrasty/views/general/widgets/textBackground.dart';

import 'attendCalculate.dart';

class AttendView extends StatelessWidget {
  final user;
  AttendView(this.user);

  @override
  Widget build(BuildContext context) {
    return Layout(
      title: 'Attendence',
      child: Column(
        children: [
          Row(
            children: [
              absentCard(
                  title: 'Absent days',
                  number: user.attendances.length,
                  total: 30,
                  sign: '/'),
              absentCard(
                  title: 'Sick leaves', number: 2, total: null, sign: null),
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        SmallText(
                                            text: user.attendances[index].date
                                                    .isUtc
                                                ? returnMonth(user
                                                    .attendances[index]
                                                    .date
                                                    .month)
                                                : ''),
                                        SmallText(
                                            text: gpa((100 -
                                                    (user.attendances.length /
                                                        30 *
                                                        100))
                                                .round())),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        TextBackground(
                                            text:
                                                'Absent ${user.attendances.length} days'),
                                        TextBackground(
                                            text: (100 -
                                                        (user.attendances
                                                                .length /
                                                            30 *
                                                            100))
                                                    .round()
                                                    .toString() +
                                                '%'),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    LinearProgressIndicator(
                                      value:
                                          (1 - (user.attendances.length / 30)),
                                      backgroundColor: backgroundColor,
                                      valueColor: AlwaysStoppedAnimation<Color>(
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
                      ContainerBlue(
                        child: Column(
                          children: [
                            Paratext(
                                text:
                                    'you have pending request for annual leaves'),
                            TextButton(
                              child: SmallText(text: 'Edit'),
                              onPressed: () {},
                            )
                          ],
                        ),
                      ),
                      ButtonWithIcon(
                          onPress: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (_) => LeaveRequest()));
                          },
                          title: 'Request a day off',
                          icon: false)
                    ],
                  ),
                )
        ],
      ),
    );
  }
}
