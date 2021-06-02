import 'package:age/age.dart';
import 'package:flutter/material.dart';
import 'package:madrasty/assets/my_flutter_app_icons.dart';
import 'package:madrasty/models/user.dart';
import 'package:madrasty/views/general/widgets/accountListTile.dart';
import 'package:madrasty/views/general/widgets/roundedCard.dart';

class InfoCard extends StatelessWidget {
  final dynamic user;
  InfoCard({@required this.user});
  @override
  Widget build(BuildContext context) {
    return RoundedCard(
      color: Colors.white,
      child: Column(
        children: [
          AccountListtile(
              icon: Icons.mail_outline, title: 'Email', subTitle: user.email),
          AccountListtile(
              icon: Icons.mail_outline,
              title: 'Age',
              subTitle: Age.dateDifference(
                      fromDate: user.birthdate, toDate: DateTime.now())
                  .years
                  .toString()),
          AccountListtile(
              icon: MyFlutterApp.b126509, title: 'Phone', subTitle: user.phone),
          AccountListtile(
              icon: Icons.people,
              title: 'Type',
              subTitle: user.type == Type.Parent
                  ? 'Parent'
                  : user.type == Type.Teacher
                      ? 'Teacher'
                      : user.type == Type.Child
                          ? 'Student'
                          : user.type == Type.Guard
                              ? 'Guard'
                              : user.type == Type.Admin
                                  ? 'Admin'
                                  : user.type == Type.BusSupervisor
                                      ? 'Bus Supervisor'
                                      : 'User'),
          AccountListtile(
              icon: Icons.person_outline_outlined,
              title: "Gender",
              subTitle: user.gender),
          user.type == Type.Child
              ? AccountListtile(
                  icon: Icons.mail_outline, title: 'Grade', subTitle: '4')
              : Container(),
          user.type == Type.Child
              ? AccountListtile(
                  icon: Icons.mail_outline, title: 'Class', subTitle: 'A')
              : Container(),
          user.type == Type.Parent
              ? AccountListtile(
                  icon: Icons.child_care_outlined,
                  title: 'Students',
                  subTitle: user.child.foreach(
                    (c) => c.name,
                  ))
              : Container(),
          AccountListtile(
              title: 'Address',
              subTitle: user.address,
              icon: Icons.location_on_outlined),
        ],
      ),
    );
  }
}
