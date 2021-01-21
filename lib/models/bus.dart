import 'package:madrasty/models/attendance.dart';
import 'package:madrasty/models/user.dart';

class Driver {
  int id;
  String name;
  String licence;
  int age;
  int phone;
  Driver(this.id, this.name, this.licence, this.age, this.phone);
}

class BusSupervisor extends User {
  int id;
  List<Attendance> attendances;

  BusSupervisor(this.id, this.attendances, final int iD, final String name,
      final String imgUrl, final bool isOnline, bool isSelected)
      : super(
            id: iD,
            name: name,
            imgUrl: imgUrl,
            isOnline: isOnline,
            isSelected: isSelected);
}

class StopCheckpoint {
  int id;
  String name;
  List<Child> students;
  bool isCurrent;
  Duration waitingDuration;
  StopCheckpoint(
      this.id, this.name, this.students, this.isCurrent, this.waitingDuration);
}

class Route {
  int id;
  String desc;
  String name;
  String starttime;
  String endtime;
  List<StopCheckpoint> checkpoints;
  Route(this.id, this.name, this.starttime, this.endtime, this.checkpoints,
      this.desc);
}

class Bus {
  String title;
  String id;
  Driver driver;
  Route route;
  bool arrived;
  BusSupervisor supervisor;
  Bus(this.id, this.title, this.driver, this.route, this.arrived,
      this.supervisor);
}

final BusSupervisor batman = new BusSupervisor(
    20, [jan202021], 1, 'Batman', 'assets/avatars/1.png', false, false);
final Driver superman =
    new Driver(1, 'Superman', '0FX-123-Amg', 43, 01033077223);
final StopCheckpoint elazabi = new StopCheckpoint(
    1, 'El-azabi', [spiderMan], false, Duration(minutes: 0, seconds: 10));
final StopCheckpoint cilantro = new StopCheckpoint(
    2, 'Cilantro Cafe', [superMan], false, Duration(minutes: 0, seconds: 2));
final StopCheckpoint manhal = new StopCheckpoint(3, 'Al-Manhal',
    [spiderMan, superMan], false, Duration(minutes: 0, seconds: 3));
final StopCheckpoint abbas = new StopCheckpoint(
    4, 'Awl-Abbas', [], false, Duration(minutes: 0, seconds: 4));
final StopCheckpoint makram = new StopCheckpoint(
    5, 'Awl-Makram', [], false, Duration(minutes: 0, seconds: 5));

final Route nasrCity = new Route(1, 'Nasr-City', '08:00', '04:00',
    [elazabi, cilantro, manhal, abbas, makram], 'Home to School');
final Bus bus1 = new Bus('M14', 'M14', superman, nasrCity, false, batman);
var sum = bus1.route.checkpoints.expand((e) => e.students).toList();
