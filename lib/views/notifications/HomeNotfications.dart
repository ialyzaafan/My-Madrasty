import 'package:flutter/material.dart';
import 'package:madrasty/models/notifications.dart';
import 'package:madrasty/style/style.dart';
import 'package:madrasty/views/general/widgets/smallText.dart';
import 'package:madrasty/views/general/widgets/textBackground.dart';
import 'package:madrasty/views/notifications/notficationMethods.dart';
import 'package:madrasty/views/general/widgets/parentContainer.dart';
import 'package:madrasty/views/notifications/NotficationsDetails.dart';

class HomeNotfications extends StatefulWidget {
  @override
  _HomeNotficationsState createState() => _HomeNotficationsState();
}

class _HomeNotficationsState extends State<HomeNotfications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Text(
          'Notfications',
          style: titleStyle,
        ),
        iconTheme: IconThemeData(
          color: mainColor, //change your color here
        ),
        elevation: 0,
        backgroundColor: backgroundColor,
      ),
      body: ParentContainer(
        child: Center(
          child: notfications.length < 1
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: MediaQuery.of(context).size.width / 2.5,
                      backgroundColor: Colors.white,
                      child: Image.asset('assets/illustrations/notfi.png'),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SmallText(text: 'No Notifications'),
                    SizedBox(
                      height: 10,
                    ),
                    TextBackground(
                        text: 'Your notifications will appear here.'),
                  ],
                )
              : ListView.builder(
                  itemCount: notfications.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Container(
                        child: ListTile(
                          contentPadding: EdgeInsets.all(20),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => NotificationsDetails(
                                        notfications[index])));
                          },
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  TextBackground(
                                      text: notficationType(
                                          notfications[index].type)),
                                  TextBackground(
                                      text:
                                          '${notfications[index].time.toLocal()}'
                                              .split(' ')[0])
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              SmallText(text: notfications[index].title),
                            ],
                          ),
                          subtitle: TextBackground(
                              text: notfications[index].description),
                          trailing: Icon(Icons.chevron_right),
                          leading: CircleAvatar(
                            radius: 30,
                            backgroundColor: backgroundColor,
                            child: Image.asset(notfications[index].imgUrl),
                          ),
                        ),
                      ),
                    );
                  }),
        ),
      ),
    );
  }
}
