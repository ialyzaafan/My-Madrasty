import 'package:madrasty/models/user.dart';

class Message {
  final User sender;
  final DateTime time;
  final String text;
  bool isRead;
  Message({this.sender, this.time, this.text, this.isRead});
}

//chats on home screen
List<Message> chats = [
  Message(
      sender: zod,
      time: DateTime.utc(2017, 12, 20),
      text: 'Activity is On',
      isRead: true),
  Message(
      sender: spiderMan,
      time: DateTime.utc(2017, 12, 20),
      text: 'Absent fot two days',
      isRead: false),
  Message(
      sender: spiderMan,
      time: DateTime.utc(2017, 12, 20),
      text:
          'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo',
      isRead: false),
  Message(
      sender: zod,
      time: DateTime.utc(2017, 12, 20),
      text: 'What is the H.W?',
      isRead: false),
  Message(
      sender: superMan,
      time: DateTime.utc(2017, 12, 20),
      text: 'Lorem ipsum dolor sit amet',
      isRead: false),
  Message(
      sender: zod,
      time: DateTime.utc(2017, 12, 20),
      text:
          'consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut',
      isRead: false),
  Message(
      sender: spiderMan,
      time: DateTime.utc(2017, 12, 20),
      text:
          'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor',
      isRead: false),
];
