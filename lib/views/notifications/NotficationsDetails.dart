import 'package:flutter/material.dart';
import 'package:madrasty/models/notifications.dart';
import 'package:madrasty/style/style.dart';
import 'package:madrasty/views/general/General.dart';
import 'package:madrasty/views/survey/surveyPage.dart';

class NotificationsDetails extends StatelessWidget {
  final Notfications notify;
  NotificationsDetails(this.notify);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Text(
          'Notfications Details',
          style: titleStyle,
        ),
        backgroundColor: backgroundColor,
        elevation: 0,
        iconTheme: IconThemeData(
          color: mainColor, //change your color here
        ),
      ),
      body: containerPadding(
        roundedCard(
            ListView(
              padding: EdgeInsets.all(8),
              children: [
                ListTile(
                  contentPadding: EdgeInsets.only(top: 20, bottom: 20),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => NotificationsDetails(announcment)));
                  },
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        notficationType(notify.type),
                        style: paragraphStyle,
                      ),
                    ],
                  ),
                  subtitle: Text(
                    notify.title,
                    style: smallTitleStyle,
                  ),
                  leading: CircleAvatar(
                    radius: 30,
                    backgroundColor: backgroundColor,
                    child: Image.asset(notify.imgUrl),
                  ),
                  trailing: Text(
                    '${notify.time.toLocal()}'.split(' ')[0],
                    style: paragraphStyle,
                  ),
                ),
                Text(
                  notify.description,
                  style: paragraphStyle,
                ),
                SizedBox(
                  height: 20,
                ),
                for (var i in notify.imgsUrl)
                  ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(i)),
                SizedBox(
                  height: 20,
                ),
                notify.attachmentUrl != null
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.attach_file_outlined),
                          SizedBox(
                            width: 10,
                          ),
                          Text(notify.attachmentUrl)
                        ],
                      )
                    : Container(
                        child: null,
                      ),
                SizedBox(
                  height: 20,
                ),
                notify.type == NotficationType.Survey && !notify.survey.done
                    ? RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        color: mainColor,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => Survey(notify.survey)));
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text(
                            'Take Survey',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ))
                    : Container()
              ],
            ),
            Colors.white,
            0.0),
      ),
    );
  }
}
