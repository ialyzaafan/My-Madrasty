class Attendance {
  int id;
  DateTime date;
  bool absent;
  Attendance(this.id, this.date, this.absent);
}

class Leave {
  int id;
  String description;
  DateTime start;
  DateTime end;
  LeaveType type;
  Leave(this.id, this.description, this.start, this.end, this.type);
}

enum LeaveType { Annual, Sick }
final Attendance jan202021 =
    new Attendance(1, DateTime.utc(2020, 12, 22), false);
final Attendance feb202022 =
    new Attendance(2, DateTime.utc(2020, 12, 23), true);
final Attendance mar202023 =
    new Attendance(3, DateTime.utc(2020, 12, 23), true);
final Attendance apr202024 =
    new Attendance(4, DateTime.utc(2020, 12, 23), true);
