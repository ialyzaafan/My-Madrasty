import 'package:madrasty/models/attendance.dart';
import 'package:madrasty/models/bus.dart';
import 'package:madrasty/models/classroom.dart';
import 'package:madrasty/models/library.dart';
import 'package:madrasty/models/subject.dart';
import 'package:madrasty/models/installmentClass.dart';

import 'exam.dart';

enum Type {
  Parent,
  Teacher,
  Child,
  Guard,
  Supervisor,
  BusSupervisor,
  Admin,
  Principle
}

class User {
  final int id;
  final DateTime birthdate;
  final String email;
  final String phone;
  final String gender;
  final String name;
  final String imgUrl;
  final bool isOnline;
  final String address;
  bool isSelected;
  Type type;
  User(
      {this.id,
      this.birthdate,
      this.name,
      this.imgUrl,
      this.isOnline,
      this.isSelected,
      this.type,
      this.email,
      this.phone,
      this.gender,
      this.address});
}

class Admin extends User {
  List<String> rules;
  List<Attendance> attendances;
  Admin(
      this.rules,
      this.attendances,
      int id,
      String name,
      String imgUrl,
      bool isOnline,
      bool isSelected,
      Type type,
      String email,
      String phone,
      String gender,
      String address,
      DateTime birthday)
      : super(
            id: id,
            name: name,
            imgUrl: imgUrl,
            isOnline: isOnline,
            isSelected: isSelected,
            type: type,
            phone: phone,
            email: email,
            gender: gender,
            address: address,
            birthdate: birthday);
}

class Guard extends User {
  List<String> rules;
  List<Attendance> attendances;
  Guard(
      this.rules,
      this.attendances,
      int id,
      String name,
      String imgUrl,
      bool isOnline,
      bool isSelected,
      Type type,
      String email,
      String phone,
      String gender,
      String address,
      DateTime birthday)
      : super(
            id: id,
            name: name,
            imgUrl: imgUrl,
            isOnline: isOnline,
            isSelected: isSelected,
            type: type,
            email: email,
            phone: phone,
            gender: gender,
            address: address,
            birthdate: birthday);
}

class Principle extends User {
  List<String> rules;
  List<Attendance> attendances;
  Principle(
      this.rules,
      this.attendances,
      int id,
      String name,
      String imgUrl,
      bool isOnline,
      bool isSelected,
      Type type,
      String email,
      String phone,
      String gender,
      String address,
      DateTime birthday)
      : super(
            id: id,
            name: name,
            imgUrl: imgUrl,
            isOnline: isOnline,
            isSelected: isSelected,
            type: type,
            email: email,
            phone: phone,
            gender: gender,
            address: address,
            birthdate: birthday);
}

class Supervisor extends User {
  List<String> rules;
  Supervisor(
      this.rules,
      int id,
      String name,
      String imgUrl,
      bool isOnline,
      bool isSelected,
      Type type,
      String phone,
      String email,
      String gender,
      String address,
      DateTime birthday)
      : super(
            id: id,
            name: name,
            imgUrl: imgUrl,
            isOnline: isOnline,
            isSelected: isSelected,
            type: type,
            phone: phone,
            email: email,
            gender: gender,
            address: address,
            birthdate: birthday);
}

class Child extends User {
  Classroom classroom;
  List<Attendance> attendances;
  List<Book> booksBorrowed;
  List<Classworks> classworks;
  List<Homework> homeworks;
  List<Projects> projects;
  List<Extraclasses> extraClasses;
  List<InstallmentClass> installments;
  List<Exam> exams;
  Child(
      this.classroom,
      this.attendances,
      this.booksBorrowed,
      this.classworks,
      this.homeworks,
      this.projects,
      this.extraClasses,
      this.installments,
      this.exams,
      int id,
      String name,
      String imgUrl,
      bool isOnline,
      bool isSelected,
      Type type,
      String email,
      String phone,
      String gender,
      String address,
      DateTime birthday)
      : super(
            id: id,
            name: name,
            imgUrl: imgUrl,
            isOnline: isOnline,
            isSelected: isSelected,
            type: type,
            email: email,
            phone: phone,
            gender: gender,
            address: address,
            birthdate: birthday);
}

class Parent extends User {
  List<Child> children;
  Parent(
      this.children,
      int id,
      String name,
      String imgUrl,
      bool isOnline,
      bool isSelected,
      Type type,
      String email,
      String phone,
      String gender,
      String address,
      DateTime birthday)
      : super(
            id: id,
            name: name,
            imgUrl: imgUrl,
            isOnline: isOnline,
            isSelected: isSelected,
            type: type,
            email: email,
            phone: phone,
            gender: gender,
            address: address,
            birthdate: birthday);
}

class Teacher extends User {
  List<Attendance> attendances;
  List<Book> booksBorrowed;

  Teacher(
      this.attendances,
      this.booksBorrowed,
      int id,
      String name,
      String imgUrl,
      bool isOnline,
      bool isSelected,
      Type type,
      String email,
      String phone,
      String gender,
      String address,
      DateTime birthday)
      : super(
            id: id,
            name: name,
            imgUrl: imgUrl,
            isOnline: isOnline,
            isSelected: isSelected,
            type: type,
            email: email,
            phone: phone,
            gender: gender,
            address: address,
            birthdate: birthday);
}

final Parent currentParent = new Parent(
    [spiderMan, superMan],
    2,
    'Aly Hassan',
    'assets/avatars/aly.jpeg',
    true,
    false,
    Type.Parent,
    'ialyZaafan@gmail.com',
    '01033077223',
    'M',
    '39 Hamdy St Elzaher',
    DateTime.utc(1994, 09, 15));

final Child spiderMan = Child(
    Classroom(1, 'assets/icons/classes.png', 'A', '3', class3ASchedule, [],
        'Building 5 floor 2'),
    [Attendance(70, DateTime.now(), true)],
    [avengers, avengers2],
    [],
    [],
    [],
    [],
    [],
    [],
    1,
    'Spider Man',
    'assets/avatars/spiderman.png',
    true,
    false,
    Type.Child,
    'iSpiderman@gmail.com',
    '01119255735',
    'M',
    'NasrCity',
    DateTime.utc(1994, DateTime.september, 10));
final Child superMan = Child(
    Classroom(1, 'assets/icons/classes.png', 'A', '3', class3ASchedule, [],
        'Building 5 floor 2'),
    [jan202021, Attendance(70, DateTime.now(), true)],
    [avengers, avengers2],
    [arabicClassWork],
    [arabicHW],
    [arabicProject],
    [arabicExtra],
    [],
    [arabicExam],
    2,
    'SuperMan',
    'assets/avatars/superman.jpg',
    true,
    false,
    Type.Child,
    'isuperman@gmail.com',
    '01033077223',
    'M',
    'NasrCity',
    DateTime.utc(1994, DateTime.september, 10));

final Teacher zod = new Teacher(
    [jan202021, Attendance(70, DateTime.now(), true)],
    [],
    4,
    'Zod',
    'assets/avatars/zod.jpg',
    false,
    false,
    Type.Teacher,
    'izod@gmail.com',
    '01119255735',
    'M',
    'NasrCity',
    DateTime.utc(1994, DateTime.september, 10));

final Teacher antman = new Teacher(
    [feb202022, jan202021, Attendance(70, DateTime.now(), true)],
    [],
    11,
    'Ant-Man',
    'assets/avatars/antman.png',
    false,
    false,
    Type.Teacher,
    'iantman@gmail.com',
    '01119255735',
    'M',
    'NasrCity',
    DateTime.utc(1994, DateTime.september, 10));

final Teacher blackCanary = new Teacher([], [],
    13,
    'Black Canary',
    'assets/avatars/canary.jpg',
    false,
    false,
    Type.Teacher,
    'iblackcanary@gmail.com',
    '01119255735',
    'M',
    'NasrCity',
    DateTime.utc(1994, DateTime.september, 10));

final Teacher daredevil = new Teacher([], [],
    14,
    'Daredevil',
    'assets/avatars/dare.jpg',
    false,
    false,
    Type.Teacher,
    'idaredevil@gmail.com',
    '01119255735',
    'M',
    'NasrCity',
    DateTime.utc(1994, DateTime.september, 10));

final Teacher greenArrow = new Teacher([], [],
    15,
    'Green Arrow',
    'assets/avatars/green.jpg',
    false,
    false,
    Type.Teacher,
    'igreenarrow@gmail.com',
    '01119255735',
    'M',
    'NasrCity',
    DateTime.utc(1994, DateTime.september, 10));

final Admin thor = new Admin(
    [],
    [feb202022, Attendance(70, DateTime.now(), true)],
    8,
    'Thor',
    'assets/avatars/thor.jpg',
    false,
    false,
    Type.Admin,
    'ithor@gmail.com',
    '01119255735',
    'M',
    'NasrCity',
    DateTime.utc(1994, DateTime.september, 10));

final Guard hulk = new Guard(
    [],
    [mar202023, Attendance(70, DateTime.now(), true)],
    9,
    'The Hulk',
    'assets/avatars/hulk.jpg',
    false,
    false,
    Type.Guard,
    'ihulk@gmail.com',
    '01119255735',
    'M',
    'NasrCity',
    DateTime.utc(1994, DateTime.september, 10));

final Supervisor captinAmerica = new Supervisor([],
    9,
    'Captin America',
    'assets/avatars/capten.jpg',
    false,
    false,
    Type.Supervisor,
    'ialyzaafan@gmail.com',
    '01119255735',
    'M',
    'NasrCity',
    DateTime.utc(1994, DateTime.september, 10));

class Staff {
  int iD;
  String imgURL;
  String title;
  List<Departments> classes;
  Type type;
  Staff(this.iD, this.imgURL, this.title, this.classes, this.type);
}

final Principle ironMan = new Principle(
    [],
    [mar202023, Attendance(70, DateTime.now(), true)],
    99,
    'Iron man',
    'assets/avatars/hulk.jpg',
    false,
    false,
    Type.Principle,
    'ironMan@gmail.com',
    '01119255735',
    'M',
    'NasrCity',
    DateTime.utc(1994, DateTime.september, 10));
final Staff guardsStaff =
    new Staff(1, 'assets/icons/arab.png', 'Guards', [], Type.Guard);
final Staff teachingStaff = new Staff(2, 'assets/icons/arab.png', 'Teachers',
    [arabicDepartment, englishDepartment], Type.Teacher);
final Staff adminsStaff =
    new Staff(3, 'assets/icons/arab.png', 'Admins', [], Type.Admin);
var staff = [guardsStaff, teachingStaff, adminsStaff];

class Departments {
  int id;
  String imgUrl;
  String title;
  List<Child> students;
  List<Subject> subjects;

  Departments(this.id, this.imgUrl, this.title, this.subjects, this.students);
}

final Departments arabicDepartment =
    new Departments(1, 'assets/icons/arab.png', 'Arabic', [arabic], students);

final Departments englishDepartment =
    new Departments(2, 'assets/icons/arab.png', 'English', [arabic], students);
List<Child> students = [spiderMan];

List<Departments> departments = [arabicDepartment, englishDepartment];

List<User> availableUsers = [superMan, spiderMan];

List<Teacher> teachers = [zod];
List<Guard> guards = [hulk];
List<Admin> admins = [thor];
List<Supervisor> supervisors = [captinAmerica];
List<BusSupervisor> buSupervisors = [batman];
