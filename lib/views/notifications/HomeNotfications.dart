import 'package:flutter/material.dart';
import 'package:madrasty/models/notifications.dart';
import 'package:madrasty/style/style.dart';
import 'package:madrasty/views/general/General.dart';
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
      body: containerPadding(
        Center(
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
                    Text(
                      'No Notifications',
                      style: smallTitleStyle,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Your notifications will appear here.',
                      style: backgroundTextStyle,
                    ),
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
                                  Text(
                                    notficationType(notfications[index].type),
                                    style: backgroundTextStyle,
                                  ),
                                  Text(
                                    '${notfications[index].time.toLocal()}'
                                        .split(' ')[0],
                                    style: backgroundTextStyle,
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                notfications[index].title,
                                style: smallTitleStyle,
                              ),
                            ],
                          ),
                          subtitle: Text(
                            notfications[index].description,
                            style: backgroundTextStyle,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
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
