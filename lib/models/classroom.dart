import 'package:flutter/material.dart';
import 'package:madrasty/models/subject.dart';
import 'package:madrasty/models/user.dart';

enum DayType { Vacation, Activity, Normal }

class Classroom {
  int id;
  String imgUrl;
  String year;
  String title;
  ScheduleModel schedule;
  List<Child> students;
  String location;
  Classroom(this.id, this.imgUrl, this.title, this.year, this.schedule,
      this.students, this.location);
}

class Scheduling {
  int id;
  String day;
  DayType type;
  String description;
  List<Subject> classes;
  bool selected;
  DateTime dateDay;
  Scheduling(this.id, this.day, this.type, this.description, this.classes,
      this.selected, this.dateDay);
}

class ScheduleModel {
  int id;
  List<Scheduling> week;
  ScheduleModel(this.id, this.week);
}

Iterable<TimeOfDay> getTimes(
    TimeOfDay startTime, TimeOfDay endTime, Duration step) sync* {
  var hour = startTime.hour;
  var minute = startTime.minute;

  do {
    yield TimeOfDay(hour: hour, minute: minute);
    minute += step.inMinutes;
    while (minute >= 60) {
      minute -= 60;
      hour++;
    }
  } while (hour < endTime.hour ||
      (hour == endTime.hour && minute <= endTime.minute));
}

final startTime = TimeOfDay(hour: 8, minute: 0);
final endTime = TimeOfDay(hour: 18, minute: 0);
final step = Duration(minutes: 60);

final ScheduleModel class3ASchedule = new ScheduleModel(1, [
  Scheduling(1, 'Sunday', DayType.Normal, 'description', [arabic, english],
      false, DateTime.utc(2021, 01, 03)),
  Scheduling(2, 'Monday', DayType.Normal, 'description', [arabic, english],
      false, DateTime.utc(2021, 01, 04)),
  Scheduling(3, 'Tuesday', DayType.Normal, 'description', [arabic, english],
      false, DateTime.utc(2021, 01, 05)),
  Scheduling(4, 'wednesday', DayType.Normal, 'description', [arabic, english],
      false, DateTime.utc(2021, 01, 06)),
  Scheduling(5, 'Thursday', DayType.Activity, 'description', [arabic, english],
      false, DateTime.utc(2021, 01, 07)),
  Scheduling(6, 'Friday', DayType.Vacation, 'description', [], false,
      DateTime.utc(2021, 01, 08)),
  Scheduling(7, 'Suterday', DayType.Vacation, 'description', [], false,
      DateTime.utc(2021, 01, 09))
]);

List<Classroom> classrooms = [
  Classroom(1, 'assets/icons/classes.png', 'A', '1', class3ASchedule,
      [spiderMan, superMan], 'Building 1 floor 5'),
  Classroom(2, 'assets/icons/classes.png', 'A', '1', class3ASchedule,
      [spiderMan, superMan], 'Building 1 floor 4'),
  Classroom(3, 'assets/icons/classes.png', 'A', '2', class3ASchedule,
      [spiderMan, superMan], 'Building 2 floor 3'),
  Classroom(4, 'assets/icons/classes.png', 'A', '2', class3ASchedule,
      [spiderMan, superMan], 'Building 2 floor 3'),
  Classroom(5, 'assets/icons/classes.png', 'A', '3', class3ASchedule,
      [spiderMan], 'Building 3 floor 2'),
  Classroom(6, 'assets/icons/classes.png', 'A', '3', class3ASchedule,
      [superMan], 'Building 3 floor 2'),
  Classroom(7, 'assets/icons/classes.png', 'A', '4', class3ASchedule, [],
      'Building 4 floor 1'),
  Classroom(8, 'assets/icons/classes.png', 'A', '5', class3ASchedule,
      [spiderMan, superMan], 'Building 5 floor 1'),
];
