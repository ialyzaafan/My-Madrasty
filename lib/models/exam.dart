import 'package:madrasty/models/subject.dart';
import 'package:madrasty/models/user.dart';

class Exam extends Subject {
  int id;
  String descriptions;
  bool isRead;
  DateTime date;
  String note;
  String pdfFile;
  int mark;
  int totalMark;
  String examType;
  bool reviewd;
  List<Section> sections;
  Exam(
      this.id,
      this.descriptions,
      this.isRead,
      this.date,
      this.note,
      this.pdfFile,
      this.sections,
      this.totalMark,
      this.mark,
      this.examType,
      this.reviewd,
      int iD,
      String imgUrl,
      String subjectName,
      String start,
      String end,
      int maxHr,
      int minHr,
      bool isExtra,
      User teacher,
      SubjectType type)
      : super(
            id: iD,
            imgUrl: imgUrl,
            title: subjectName,
            start: start,
            end: end,
            maxHr: maxHr,
            minHr: minHr,
            teacher: teacher,
            type: type);
}

class Section {
  int id;
  SectionType type;
  List<Question> questions;
  Section(this.id, this.type, this.questions);
}

class Answers {
  String id;
  String answer;
  bool rightAnswer;
  bool selected;
  bool isImage;
  String imgUrl;
  Answers(this.id, this.answer, this.rightAnswer, this.selected, this.isImage,
      this.imgUrl);
}

enum SectionType { Choose, Complpete, Essay }

class Question {
  int id;
  String question;
  int mark;
  List<Answers> answers;
  Question(
    this.id,
    this.question,
    this.mark,
    this.answers,
  );
}

final Exam arabicExam = new Exam(
    1,
    'Lorem Ipsum is simply dummy text of the printing and typesetting industry',
    false,
    DateTime.utc(2020, 12, 24),
    'Superman is coming',
    'pdfFile',
    [
      Section(1, SectionType.Choose, [
        Question(1, 'What is Spiderman super power?', 40, [
          Answers('a', '12', false, false, false, ''),
          Answers('a', '12', false, false, false, ''),
          Answers('a', '12', false, false, false, ''),
        ]),
        Question(1, 'What is Spiderman Age?', 40, [
          Answers('a', '12', false, false, false, ''),
          Answers('a', '12', false, false, false, ''),
          Answers('a', '12', false, false, false, ''),
        ]),
        Question(1, 'What is Spiderman Name?', 40, [
          Answers('a', '12', false, false, false, ''),
          Answers('a', '12', false, false, false, ''),
          Answers('a', '12', false, false, false, ''),
        ]),
      ]),
      Section(1, SectionType.Essay, [
        Question(1, 'What is Spiderman Age?', 40, [
          Answers('a', '12', false, false, false, ''),
          Answers('a', '12', false, false, false, ''),
          Answers('a', '12', false, false, false, ''),
        ]),
      ]),
      Section(1, SectionType.Complpete, [
        Question(1, 'What is Spiderman Age?', 40, [
          Answers('a', '12', false, false, false, ''),
          Answers('a', '12', false, false, false, ''),
          Answers('a', '12', false, false, false, ''),
        ]),
      ])
    ],
    40,
    null,
    'Monthly Exam',
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
    SubjectType.Exam);
final List<Exam> todayExams = [arabicExam];
