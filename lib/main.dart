import 'package:flutter/material.dart';
import 'package:madrasty/models/exam.dart';
import 'package:madrasty/models/user.dart';
import 'package:madrasty/views/child/homeChild.dart';
import 'package:madrasty/views/exam/addExam.dart';
import 'package:madrasty/views/exam/buildExam.dart';
import 'package:madrasty/views/exam/exam.dart';
import 'package:madrasty/views/exam/reviewExam.dart';
import 'package:madrasty/views/gettingStarted.dart';
import 'package:madrasty/views/parent/tabs/bottomTabs.dart';
import 'package:madrasty/views/princple/homePrinciple.dart';
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
        home: GettingStarted());
  }
}
