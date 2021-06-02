import 'package:flutter/material.dart';
import 'package:madrasty/models/user.dart';
import 'package:madrasty/style/style.dart';
import 'package:madrasty/views/general/widgets/elevatedButtonWithWhite.dart';
import 'package:madrasty/views/general/widgets/layout.dart';
import 'package:madrasty/views/general/widgets/switchDialog.dart';
import 'package:madrasty/views/general/widgets/buildAvatar.dart';
import 'package:madrasty/views/profileUI/infoCard.dart';

class MyProfile extends StatefulWidget {
  final dynamic user;
  MyProfile(this.user);
  @override
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  @override
  Widget build(BuildContext context) {
    return Layout(
      title: 'My Info',
      actions: [
        widget.user.type == Type.Teacher || widget.user.type == Type.Parent
            ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) => SwitchDialog());
                  },
                  child: Container(
                      padding: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                          color: mainColor,
                          borderRadius:
                              BorderRadius.all(Radius.circular(12.0))),
                      child: Icon(
                        Icons.swap_horizontal_circle_sharp,
                        color: Colors.white,
                      )),
                ),
              )
            : Container()
      ],
      child: Center(
        child: ListView(
          padding: EdgeInsets.all(8),
          children: [
            BuildAvatar(
              img: widget.user.imgUrl,
              title: widget.user.type == Type.Parent
                  ? 'Parent'
                  : widget.user.type == Type.Teacher
                      ? 'Teacher'
                      : widget.user.type == Type.Child
                          ? 'Student'
                          : widget.user.type == Type.Supervisor
                              ? 'Supervisor'
                              : 'Principle',
              description: widget.user.name,
            ),
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
            InfoCard(user: widget.user),
            SizedBox(
              height: 10,
            ),
            widget.user.id == zod.id
                ? Container()
                : ElevatedButtonWhiteSmall(func: () {}, text: 'Call'),
            SizedBox(
              height: 10,
            ),
            widget.user.id == zod.id
                ? Container()
                : ElevatedButtonWhiteSmall(func: () {}, text: 'Message'),
          ],
        ),
      ),
    );
  }
}
