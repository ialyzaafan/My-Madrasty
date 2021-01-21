import 'package:madrasty/models/classroom.dart';

class CalenderClass {
  DateTime day;
  String dayName;
  List<TeacherTodoSubject> todo;
  CalenderClass(this.day, this.dayName, this.todo);
}

class TeacherTodoSubject {
  int id;
  DateTime startTime;
  String subjectName;
  Classroom classRoom;
  String description;
  Duration duration;
  TeacherTodoSubject(this.id, this.startTime, this.subjectName, this.classRoom,
      this.description, this.duration);
}

List<CalenderClass> calender1 = [
  CalenderClass(DateTime(2021, 01, 01), 'Sunday', [
    TeacherTodoSubject(
        1,
        DateTime(2021, 1, 15, 07, 0),
        'Arabic',
        Classroom(1, 'assets/icons/classes.png', 'A', '3', class3ASchedule, [],
            'Building 5 floor 2'),
        '',
        Duration(hours: 2)),
    TeacherTodoSubject(
        2,
        DateTime(2021, 1, 15, 09, 33),
        'Religion',
        Classroom(1, 'assets/icons/classes.png', 'B', '1', class3ASchedule, [],
            'Building 5 floor 2'),
        '',
        Duration(hours: 2)),
  ]),
  CalenderClass(DateTime(2021, 01, 02), 'Monday', [
    TeacherTodoSubject(
        2,
        DateTime(2021, 1, 11, 12, 0),
        'English',
        Classroom(2, 'assets/icons/classes.png', 'A', '3', class3ASchedule, [],
            'Building 5 floor 2'),
        '',
        Duration(hours: 2)),
  ]),
  CalenderClass(DateTime(2021, 01, 03), 'Tuesday', [
    TeacherTodoSubject(
        3,
        DateTime(2021, 1, 13, 02, 0),
        'Religion',
        Classroom(3, 'assets/icons/classes.png', 'A', '3', class3ASchedule, [],
            'Building 5 floor 2'),
        '',
        Duration(hours: 2)),
  ]),
  CalenderClass(DateTime(2021, 01, 04), 'Wednesday', [
    TeacherTodoSubject(
        4,
        DateTime(2021, 1, 15, 01, 0),
        'Arabic',
        Classroom(1, 'assets/icons/classes.png', 'A', '3', class3ASchedule, [],
            'Building 5 floor 2'),
        '',
        Duration(hours: 2)),
  ]),
  CalenderClass(DateTime(2021, 01, 05), 'Thursday', [
    TeacherTodoSubject(
        5,
        DateTime(2021, 1, 17, 11, 0),
        'English',
        Classroom(2, 'assets/icons/classes.png', 'A', '3', class3ASchedule, [],
            'Building 5 floor 2'),
        '',
        Duration(hours: 2)),
  ]),
  CalenderClass(DateTime(2021, 01, 06), 'Tuesday', [
    TeacherTodoSubject(
        6,
        DateTime(2021, 1, 11, 03, 0),
        'Religion',
        Classroom(3, 'assets/icons/classes.png', 'A', '3', class3ASchedule, [],
            'Building 5 floor 2'),
        '',
        Duration(hours: 2)),
  ]),
  CalenderClass(DateTime(2021, 01, 07), 'Friday', [
    TeacherTodoSubject(
        7,
        DateTime(2021, 1, 11, 15, 0),
        'Religion',
        Classroom(3, 'assets/icons/classes.png', 'A', '3', class3ASchedule, [],
            'Building 5 floor 2'),
        '',
        Duration(hours: 2)),
  ]),
];
