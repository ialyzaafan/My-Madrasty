import 'package:flutter/material.dart';
import 'package:madrasty/models/bus.dart';
import 'package:madrasty/style/style.dart';
import 'package:madrasty/views/bus/busView.dart';
import 'package:madrasty/views/general/widgets/smallText.dart';
import 'package:madrasty/views/notifications/notficationMethods.dart';
import 'package:madrasty/views/general/widgets/parentContainer.dart';
import 'package:madrasty/views/general/widgets/roundedCard.dart';

class ListOfBuses extends StatelessWidget {
  List<Bus> buses;
  ListOfBuses(this.buses);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: mainColor),
        elevation: 0,
        backgroundColor: backgroundColor,
        title: Text(
          'Buses',
          style: titleStyle,
        ),
      ),
      backgroundColor: backgroundColor,
      body: ParentContainer(
          child: ListView.builder(
        itemCount: buses.length,
        itemBuilder: (BuildContext context, int index) {
          return RoundedCard(
            color: Colors.white,
            child: ListTile(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => BusView(buses[index])));
              },
              leading: CircleAvatar(
                backgroundColor: backgroundColor,
                child: Image.asset('assets/icons/transport.png'),
              ),
              contentPadding: EdgeInsets.only(top: 20, bottom: 20),
              title: SmallText(
                  text: buses[index].title + ' . ' + buses[index].route.name),
              subtitle: Text(buses[index]
                      .route
                      .checkpoints
                      .expand((s) => s.students)
                      .toList()
                      .length
                      .toString() +
                  '  Students'),
              trailing: Icon(
                Icons.chevron_right,
                color: mainColor,
              ),
            ),
          );
        },
      )),
    );
  }
}
