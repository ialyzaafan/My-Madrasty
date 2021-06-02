import 'package:flutter/material.dart';
import 'package:madrasty/models/bus.dart';
import 'package:madrasty/models/user.dart';
import 'package:madrasty/style/style.dart';
import 'package:madrasty/views/bus/busDetails.dart';
import 'package:madrasty/views/general/widgets/smallText.dart';
import 'package:madrasty/views/general/widgets/textBackground.dart';
import 'package:madrasty/views/notifications/notficationMethods.dart';
import 'package:madrasty/views/general/widgets/buttonWithIcon.dart';

class BusView extends StatelessWidget {
  final Bus bus;
  BusView(this.bus);
  Widget buildIndicator(String checkpoint, String checkpoint1, String time,
      String time1, bool arrived, bool arrived1) {
    Widget buildDotIndicator(bool arrived) {
      return CircleAvatar(
        radius: 15,
        backgroundColor: secondryColor,
        child: Card(
          color: arrived ? mainColor : whiteoff,
          child: Container(
            constraints: BoxConstraints(maxHeight: 15, maxWidth: 15),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
        ),
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Column(
          children: [
            buildDotIndicator(arrived),
            Container(
              color: secondryColor,
              constraints:
                  BoxConstraints(maxWidth: 8, minHeight: 50, minWidth: 5),
            ),
            buildDotIndicator(arrived1),
          ],
        ),
        SizedBox(
          width: 10,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SmallText(text: checkpoint),
            TextBackground(text: time),
            SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 20,
            ),
            SmallText(text: checkpoint1),
            TextBackground(text: time1),
          ],
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        iconTheme: IconThemeData(color: mainColor),
        elevation: 0,
        backgroundColor: backgroundColor,
        actions: [],
        title: Text(
          'Bus',
          style: titleStyle,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Stack(
                children: [
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: ListTile(
                      contentPadding: EdgeInsets.only(
                          top: 20, bottom: 20, left: 8, right: 8),
                      leading: CircleAvatar(
                        radius: 30,
                        backgroundColor: backgroundColor,
                        child: Image.asset('assets/icons/transport.png'),
                      ),
                      title: Row(
                        children: [
                          SmallText(text: bus.id),
                          SizedBox(
                            width: 10,
                            child: Divider(),
                          ),
                          SmallText(text: bus.route.name),
                          SizedBox(
                            width: 2,
                          ),
                        ],
                      ),
                      subtitle: Row(
                        children: [
                          CircleAvatar(
                            radius: 5,
                            backgroundColor: mainColor,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(bus.arrived ? 'On Trip' : 'Approaching')
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    right: 20,
                    top: 10,
                    bottom: 10,
                    child: CircleAvatar(
                      child: Icon(Icons.call, color: Colors.white),
                      backgroundColor: mainColor,
                    ),
                  )
                ],
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Container(
                  padding: EdgeInsets.all(8),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                              flex: 1,
                              child: ListTile(
                                leading: Icon(Icons.drive_eta_rounded,
                                    color: mainColor),
                                title: TextBackground(text: 'Supervisor'),
                                subtitle: SmallText(text: bus.supervisor.name),
                              )),
                          Expanded(
                              flex: 1,
                              child: ListTile(
                                leading: Icon(Icons.drive_eta_rounded,
                                    color: mainColor),
                                title: TextBackground(text: 'Driver'),
                                subtitle: SmallText(text: bus.driver.name),
                              )),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      buildIndicator('Nasr City', '39 El-Dokki', '08:00 AM',
                          '08:45 AM', true, false),
                      SizedBox(
                        height: 30,
                      ),
                      buildIndicator('Maadi ', '39 El-Dokki', '08:00 AM',
                          '08:45 AM', false, false),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                          constraints: BoxConstraints(
                              minWidth: MediaQuery.of(context).size.width),
                          child: ButtonWithIcon(
                            onPress: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (_) => BusDetails(bus1, zod)));
                            },
                            title: 'Track Bus',
                            icon: false,
                          ))
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
