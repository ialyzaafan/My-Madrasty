import 'package:madrasty/models/survey.dart';

enum NotficationType {
  Survey,
  Exam,
  Classwork,
  Library,
  Announcement,
  Reminder
}

class Notfications {
  final int id;
  final String title;
  final String description;
  final String imgUrl;
  final String attachmentUrl;
  final List<String> imgsUrl;
  final DateTime time;
  SurveyClass survey;
  NotficationType type;
  Notfications(
      {this.id,
      this.title,
      this.type,
      this.description,
      this.imgUrl,
      this.attachmentUrl,
      this.imgsUrl,
      this.time,
      this.survey});
}

List<Notfications> notfications = [announcment, surveyNot];

final Notfications announcment = new Notfications(
    id: 0,
    title: 'School Emergency Alerts',
    type: NotficationType.Announcement,
    description:
        'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet,consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea',
    imgUrl: 'assets/icons/announcment.png',
    attachmentUrl: 'School-Mangment.pdf',
    imgsUrl: ['assets/images/class1.png', 'assets/images/class2.png'],
    time: DateTime.utc(2020, 10, 10),
    survey: null);

final Notfications surveyNot = new Notfications(
    id: 0,
    title: 'Survey',
    type: NotficationType.Survey,
    description:
        'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet,consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea',
    imgUrl: 'assets/icons/announcment.png',
    attachmentUrl: 'School-Mangment.pdf',
    imgsUrl: ['assets/images/class1.png', 'assets/images/class2.png'],
    time: DateTime.utc(2020, 10, 10),
    survey: survey1);
