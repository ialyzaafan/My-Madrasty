import 'package:flutter/material.dart';
import 'package:madrasty/models/user.dart';
import 'package:madrasty/views/attendence/attendenceVIew.dart';
import 'package:madrasty/views/auth/login.dart';
import 'package:madrasty/views/profileUI/myAcc.dart';
import 'package:madrasty/views/teacher/teachertabs.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Madrasty Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: TeacherTabs());
  }
}
