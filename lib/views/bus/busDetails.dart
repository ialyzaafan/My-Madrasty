import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/countdown_timer_controller.dart';
import 'package:madrasty/models/bus.dart';
import 'package:madrasty/models/user.dart';
import 'package:madrasty/style/style.dart';
import 'package:madrasty/views/general/General.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';

class BusDetails extends StatefulWidget {
  final User user;
  final Bus bus;
  BusDetails(this.bus, this.user);

  @override
  _BusDetailsState createState() => _BusDetailsState();
}

class _BusDetailsState extends State<BusDetails> {
  int _currentPointIndex;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void onEnd() {
    print('onEnd');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Text(
          'Trip Details',
          style: titleStyle,
        ),
        iconTheme: IconThemeData(color: mainColor),
        elevation: 0,
        backgroundColor: backgroundColor,
      ),
      body: containerPadding(Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${bus1.id}  • ${bus1.route.desc} trip',
            style: smallTitleStyle,
          ),
          Text(sum.length.toString() + ' students on board',
              style: paragraphStyle),
          Expanded(
            child: ListView.builder(
              itemCount: bus1.route.checkpoints.length,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Container(
                          constraints:
                              BoxConstraints(maxHeight: 30, maxWidth: 30),
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            color: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Container(
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    color: _currentPointIndex == index
                                        ? Colors.green
                                        : backgroundColor,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          bus1.route.checkpoints[index].name,
                          style: smallTitleStyle,
                        )
                      ],
                    ),
                    Container(
                        constraints: BoxConstraints(
                            minWidth: MediaQuery.of(context).size.width),
                        child: bus1.route.checkpoints[index].students.length > 0
                            ? roundedCard(
                                Column(
                                  children: [
                                    ListView.builder(
                                      itemCount: bus1.route.checkpoints[index]
                                          .students.length,
                                      shrinkWrap: true,
                                      physics: NeverScrollableScrollPhysics(),
                                      itemBuilder:
                                          (BuildContext context, int idx) {
                                        return ListTile(
                                          contentPadding: EdgeInsets.only(
                                              top: 10, bottom: 10),
                                          subtitle: Row(
                                            children: [
                                              CircleAvatar(
                                                radius: 5,
                                                backgroundColor: disapbledColor,
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                'no Status',
                                                style: paragraphStyle,
                                              ),
                                            ],
                                          ),
                                          leading: CircleAvatar(
                                              backgroundColor: backgroundColor,
                                              backgroundImage: AssetImage(bus1
                                                  .route
                                                  .checkpoints[index]
                                                  .students[idx]
                                                  .imgUrl)),
                                          title: Text(
                                            bus1.route.checkpoints[index]
                                                .students[idx].name,
                                            style: smallTitleStyle,
                                          ),
                                        );
                                      },
                                    ),
                                    widget.user.type == Type.Teacher
                                        ? Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                child: cardButton(
                                                    Icons.time_to_leave,
                                                    mainColor,
                                                    backgroundColor,
                                                    () {}),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 20, right: 20),
                                                child: cardButton(
                                                    Icons.notifications,
                                                    Colors.white,
                                                    Colors.yellow, () {
                                                  setState(() {
                                                    _currentPointIndex = index;
                                                  });
                                                }),
                                              ),
                                              cardButton(
                                                  Icons.timer,
                                                  Colors.white,
                                                  secondryColor, () {
                                                Navigator.of(context).push(
                                                    MaterialPageRoute(
                                                        builder: (_) =>
                                                            CurrentCheckpoint(
                                                                bus1
                                                                    .route
                                                                    .checkpoints[
                                                                        index]
                                                                    .students,
                                                                bus1
                                                                    .route
                                                                    .checkpoints[
                                                                        index]
                                                                    .waitingDuration)));
                                              }),
                                            ],
                                          )
                                        : Container()
                                  ],
                                ),
                                Colors.white,
                                0.0)
                            : Center(
                                child: Text('no students in this checkpoint')))
                  ],
                );
              },
            ),
          )
        ],
      )),
    );
  }
}

class CurrentCheckpoint extends StatefulWidget {
  final List<Child> students;
  final Duration duration;
  CurrentCheckpoint(this.students, this.duration);
  @override
  _CurrentCheckpointState createState() => _CurrentCheckpointState();
}

class _CurrentCheckpointState extends State<CurrentCheckpoint> {
  CountdownTimerController controller;

  int endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 10;
  void initState() {
    super.initState();
    controller = CountdownTimerController(endTime: endTime, onEnd: onEnd);
  }

  void onEnd() {
    print('onEnd');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: mainColor),
          backgroundColor: backgroundColor,
          elevation: 0,
        ),
        backgroundColor: backgroundColor,
        body: containerPadding(
          roundedCard(
              ListView(
                padding: EdgeInsets.all(20),
                children: [
                  Center(
                    child: CountdownTimer(
                      textStyle: titleStyle,
                      onEnd: onEnd,
                      endTime: endTime,
                    ),
                  ),
                  Center(
                      child: Text('Remaining waiting time',
                          style: paragraphStyle)),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: widget.students.length,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  backgroundImage:
                                      AssetImage(widget.students[index].imgUrl),
                                  radius: 30,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  widget.students[index].name,
                                  style: smallTitleStyle,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                InkWell(
                                  onTap: () {},
                                  child: cardWithBorder(
                                      Icon(
                                        Icons.done,
                                        color: mainColor,
                                      ),
                                      mainColor.withOpacity(0.1)),
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: cardWithBorder(
                                      Icon(
                                        Icons.close,
                                        color: Colors.red,
                                      ),
                                      Colors.red.withOpacity(0.1)),
                                ),
                              ],
                            )
                          ],
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  buttonWithIcon(context, () {}, 'Continue Trip', false),
                  SizedBox(
                    height: 10,
                  ),
                  seconderyBtn(context, () {}, 'Call Parent')
                ],
              ),
              Colors.white,
              0.0),
        ));
  }
}
