import 'package:flutter/material.dart';
import 'package:madrasty/models/notifications.dart';

String notficationType(NotficationType notType) {
  String type;
  switch (notType) {
    case NotficationType.Exam:
      type = 'Exam';
      break;
    case NotficationType.Survey:
      type = 'Survey';
      break;
    case NotficationType.Announcement:
      type = 'Announcement';
      break;
    case NotficationType.Classwork:
      type = 'Classwork';
      break;
    case NotficationType.Library:
      type = 'Library';
      break;
    case NotficationType.Reminder:
      type = 'Reminder';
      break;
    default:
      type = 'Announcement';
      break;
  }
  return type;
}
