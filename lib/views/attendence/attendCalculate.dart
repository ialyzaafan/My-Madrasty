import 'package:flutter/material.dart';

String gpa(int grade) {
  String gradeGpa;
  if (grade >= 95) {
    gradeGpa = 'A+';
  } else if (grade >= 90 && grade < 95) {
    gradeGpa = 'A';
  } else if (grade >= 85 && grade < 80) {
    gradeGpa = 'B+';
  } else if (grade >= 80 && grade < 85) {
    gradeGpa = 'B';
  } else {
    gradeGpa = 'C';
  }

  return gradeGpa;
}

String returnMonth(int month) {
  String monthString;
  switch (month) {
    case 1:
      monthString = 'January';
      break;
    case 2:
      monthString = 'February';
      break;
    case 3:
      monthString = 'March';
      break;
    case 4:
      monthString = 'April';
      break;
    case 5:
      monthString = 'May';
      break;
    case 6:
      monthString = 'June';
      break;
    case 7:
      monthString = 'July';
      break;
    case 8:
      monthString = 'August';
      break;
    case 9:
      monthString = 'September';
      break;
    case 10:
      monthString = 'October';
      break;
    case 11:
      monthString = 'November';
      break;
    case 12:
      monthString = 'December';
      break;
  }
  return monthString;
}
