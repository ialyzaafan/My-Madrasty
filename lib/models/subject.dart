import 'package:madrasty/models/classroom.dart';
import 'package:madrasty/models/user.dart';

import 'exam.dart';

enum SubjectType {
  Break,
  Normal,
  TeacherAbsent,
  Extra,
  Exam,
  Classwork,
  Homwork,
  Projects
}

class Subject {
  int id;
  String imgUrl;
  String title;
  String start;
  String end;
  int maxHr;
  int minHr;
  String note;
  User teacher;
  SubjectType type;
  Subject(
      {this.id,
      this.imgUrl,
      this.title,
      this.start,
      this.end,
      this.maxHr,
      this.minHr,
      this.teacher,
      this.note,
      this.type});
}

class Classworks extends Subject {
  int iD;
  DateTime date;
  String descriptions;
  bool isRead;
  String pdfFile;
  bool selected;

  Classworks(
      this.iD,
      this.date,
      this.descriptions,
      this.isRead,
      this.pdfFile,
      this.selected,
      int id,
      String imgUrl,
      String subjectName,
      String start,
      String end,
      int maxHr,
      int minHr,
      bool isExtra,
      User teacher,
      String note,
      SubjectType type)
      : super(
            id: id,
            imgUrl: imgUrl,
            title: subjectName,
            start: start,
            end: end,
            maxHr: maxHr,
            minHr: minHr,
            teacher: teacher,
            note: note,
            type: type);
}

final Subject arabic = new Subject(
    id: 1,
    title: 'Arabic',
    start: '05:00',
    end: '06:00',
    maxHr: 32,
    minHr: 27,
    teacher: zod,
    type: SubjectType.Normal);
final Subject english = new Subject(
    id: 2,
    title: 'English',
    start: '05:00',
    end: '06:00',
    maxHr: 32,
    minHr: 27,
    teacher: zod,
    type: SubjectType.Normal);

final Subject breakClass = new Subject(
    id: 3,
    title: 'Break',
    start: '05:00',
    end: '06:00',
    maxHr: 32,
    minHr: 27,
    teacher: zod,
    type: SubjectType.Break);

final Classworks arabicClassWork = Classworks(
    1,
    DateTime.utc(2020, 12, 24),
    'Lorem Ipsum is simply dummy text of the printing and typesetting industry',
    false,
    null,
    true,
    1,
    'assets/icons/projects.png',
    'Arabic',
    '05:00',
    '06:00',
    32,
    27,
    false,
    zod,
    'Superman is coming',
    SubjectType.Classwork);

final Classworks englishClassWork = Classworks(
    30,
    DateTime.utc(2020, 12, 24),
    'Lorem Ipsum is simply dummy text of the printing and typesetting industry',
    false,
    null,
    false,
    2,
    'assets/icons/projects.png',
    'English',
    '05:00',
    '06:00',
    32,
    27,
    false,
    zod,
    'Superman is coming',
    SubjectType.Classwork);

final List<Classworks> classworks = [arabicClassWork, englishClassWork];
final List<Classworks> todayClassworks =
    classworks.where((d) => d.date == DateTime.utc(2020, 12, 24)).toList();

final Classworks arabicHW = new Classworks(
    1,
    DateTime.utc(2020, 12, 24),
    'Lorem Ipsum is simply dummy text of the printing and typesetting industry',
    false,
    'Superman Secret wepon',
    false,
    1,
    'assets/icons/projects.png',
    'Arabic',
    '05:00',
    '06:00',
    32,
    27,
    false,
    zod,
    '',
    SubjectType.Homwork);

final Classworks arabicExtra = new Classworks(
    1,
    DateTime.utc(2020, 12, 24),
    'Lorem Ipsum is simply dummy text of the printing and typesetting industry',
    false,
    'Superman Secret wepon',
    false,
    1,
    'assets/icons/projects.png',
    'Arabic',
    '05:00',
    '06:00',
    32,
    27,
    false,
    zod,
    '',
    SubjectType.Extra);

final Classworks arabicProject = new Classworks(
    1,
    DateTime.utc(2020, 12, 24),
    'Lorem Ipsum is simply dummy text of the printing and typesetting industry',
    false,
    'Superman Secret wepon',
    false,
    1,
    'assets/icons/projects.png',
    'Arabic',
    '05:00',
    '06:00',
    32,
    27,
    false,
    zod,
    '',
    SubjectType.Projects);
final List<Classworks> homeworks = [arabicHW];
final List<Classworks> todayHomeworks =
    homeworks.where((d) => d.date == DateTime.utc(2020, 12, 24)).toList();
final List<Classworks> projects = [arabicProject];
final List<Classworks> todayProjects =
    projects.where((d) => d.date == DateTime.utc(2020, 12, 24)).toList();
final List<Classworks> extras = [arabicExtra];
final List<Classworks> todayExtra =
    extras.where((d) => d.date == DateTime.utc(2020, 12, 24)).toList();

class Grade {
  int id;
  String imgURL;
  String title;
  List<Classroom> classrooms;
  Grade(this.id, this.imgURL, this.title, this.classrooms);
}

final Grade gradeOne = new Grade(1, 'assets/icons/1.png', '1', classrooms);
final Grade gradeTwo = new Grade(2, 'assets/icons/2.png', '2', []);
final Grade gradeThree = new Grade(3, 'assets/icons/3.png', '3', []);

List<Grade> grades = [gradeOne, gradeTwo, gradeThree];
List<Map> userExamed = [
  {'User': spiderMan, 'Exam': arabicExam},
  {'User': superMan, 'Exam': arabicExam},
];
List<Classworks> classworkss = [
  arabicClassWork,
  englishClassWork,
  arabicHW,
  arabicProject,
  arabicExtra
];
