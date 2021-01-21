import 'package:flutter/material.dart';
import 'package:madrasty/models/user.dart';
import 'package:madrasty/style/style.dart';
import 'package:madrasty/views/general/General.dart';
import 'package:age/age.dart';

class MyProfile extends StatefulWidget {
  final dynamic user;
  MyProfile(this.user);
  @override
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  Widget _switchTeacherParent(BuildContext context) {
    return new AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      content: new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          CircleAvatar(
            backgroundColor: backgroundColor,
            radius: 120,
            child: Image.asset('assets/illustrations/illus2.png'),
          ),
          SizedBox(
            height: 20,
          ),
          Text('Switch to Teacher account?', style: smallTitleStyle),
          SizedBox(
            height: 20,
          ),
          Text(
              'By switching your account you will be able to manage your classes at this school.',
              maxLines: 2,
              style: backgroundTextStyle),
          SizedBox(
            height: 10,
          ),
          RaisedButton(
            onPressed: () {},
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child:
                  Text('Switch Account', style: TextStyle(color: Colors.white)),
            ),
            color: mainColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
          )
        ],
      ),
      actions: <Widget>[],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        actions: [
          widget.user.type == Type.Teacher || widget.user.type == Type.Parent
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) =>
                              _switchTeacherParent(context));
                    },
                    child: Container(
                        padding: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                            color: mainColor,
                            borderRadius:
                                BorderRadius.all(Radius.circular(12.0))),
                        child: Icon(Icons.switch_account)),
                  ),
                )
              : Container()
        ],
        iconTheme: IconThemeData(
          color: mainColor, //change your color here
        ),
        elevation: 0,
        backgroundColor: backgroundColor,
        title: Text(
          'My Info',
          style: titleStyle,
        ),
      ),
      body: containerPadding(
        Center(
          child: ListView(
            padding: EdgeInsets.all(8),
            children: [
              buildAvatar(
                  widget.user.imgUrl,
                  widget.user.type == Type.Parent
                      ? 'Parent'
                      : widget.user.type == Type.Teacher
                          ? 'Teacher'
                          : widget.user.type == Type.Child
                              ? 'Student'
                              : widget.user.type == Type.Supervisor
                                  ? 'Supervisor'
                                  : 'Principle',
                  widget.user.name,
                  context),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.all(15),
                child: Center(
                    child: Text(
                  'Info',
                  style: mainColorTextStyle,
                )),
                constraints:
                    BoxConstraints(minWidth: MediaQuery.of(context).size.width),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    color: lightMainColor.withOpacity(0.1)),
              ),
              SizedBox(
                height: 10,
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                child: Column(
                  children: [
                    ListTile(
                        title: Text('Email', style: mainColorTextStyle),
                        subtitle: Text(
                          widget.user.email,
                          style: backgroundTextStyle,
                        ),
                        leading: Icon(
                          Icons.mail_outline,
                          color: mainColor,
                        )),
                    ListTile(
                        title: Text('Age', style: mainColorTextStyle),
                        subtitle: Text(
                          Age.dateDifference(
                                  fromDate: widget.user.birthdate,
                                  toDate: DateTime.now())
                              .years
                              .toString(),
                          style: backgroundTextStyle,
                        ),
                        leading: Icon(
                          Icons.mail_outline,
                          color: mainColor,
                        )),
                    ListTile(
                        title: Text('Phone', style: mainColorTextStyle),
                        subtitle: Text(
                          widget.user.phone,
                          style: backgroundTextStyle,
                        ),
                        leading: Icon(
                          Icons.phone_outlined,
                          color: mainColor,
                        )),
                    ListTile(
                        title: Text('Type', style: mainColorTextStyle),
                        subtitle: Text(
                          widget.user.type == Type.Parent
                              ? 'Parent'
                              : widget.user.type == Type.Teacher
                                  ? 'Teacher'
                                  : widget.user.type == Type.Child
                                      ? 'Student'
                                      : widget.user.type == Type.Guard
                                          ? 'Guard'
                                          : widget.user.type == Type.Admin
                                              ? 'Admin'
                                              : widget.user.type ==
                                                      Type.BusSupervisor
                                                  ? 'Bus Supervisor'
                                                  : 'User',
                          style: backgroundTextStyle,
                        ),
                        leading: Icon(
                          Icons.people,
                          color: mainColor,
                        )),
                    ListTile(
                        title: Text('Gender', style: mainColorTextStyle),
                        subtitle: Text(
                          widget.user.gender,
                          style: backgroundTextStyle,
                        ),
                        leading: Icon(
                          Icons.mail_outline,
                          color: mainColor,
                        )),
                    widget.user.type == Type.Child
                        ? ListTile(
                            title: Text('Grade', style: mainColorTextStyle),
                            subtitle: Text(
                              '4',
                              style: backgroundTextStyle,
                            ),
                            leading: Icon(
                              Icons.mail_outline,
                              color: mainColor,
                            ))
                        : Container(),
                    widget.user.type == Type.Child
                        ? ListTile(
                            title: Text('Class', style: mainColorTextStyle),
                            subtitle: Text(
                              'A',
                              style: backgroundTextStyle,
                            ),
                            leading: Icon(
                              Icons.mail_outline,
                              color: mainColor,
                            ))
                        : Container(),
                    widget.user.type == Type.Parent
                        ? ListTile(
                            title: Row(
                              children: [
                                Text('Students', style: mainColorTextStyle),
                              ],
                            ),
                            subtitle: widget.user.child.foreach((c) => Text(
                                  c.name,
                                  style: backgroundTextStyle,
                                )),
                            leading: Icon(
                              Icons.child_care_outlined,
                              color: mainColor,
                            ))
                        : Container(),
                    ListTile(
                        title: Text('Address', style: mainColorTextStyle),
                        subtitle: Text(
                          widget.user.address,
                          style: backgroundTextStyle,
                        ),
                        leading: Icon(
                          Icons.location_on_outlined,
                          color: mainColor,
                        )),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              widget.user.id == zod.id
                  ? Container()
                  : RaisedButton(
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          'Call',
                          style: whiteSmallTitleStyle,
                        ),
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      onPressed: () {},
                      color: lightMainColor.withOpacity(0.7),
                      elevation: 0,
                    ),
              SizedBox(
                height: 10,
              ),
              widget.user.id == zod.id
                  ? Container()
                  : RaisedButton(
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          'Message',
                          style: whiteSmallTitleStyle,
                        ),
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      onPressed: () {},
                      color: lightMainColor.withOpacity(0.7),
                      elevation: 0,
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
