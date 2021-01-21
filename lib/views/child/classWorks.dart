import 'package:flutter/material.dart';
import 'package:madrasty/models/exam.dart';
import 'package:madrasty/models/subject.dart';
import 'package:madrasty/models/user.dart';
import 'package:madrasty/style/style.dart';
import 'package:madrasty/views/child/workDetails.dart';
import 'package:madrasty/views/exam/exam.dart';
import 'package:madrasty/views/filter/filter.dart';
import 'package:madrasty/views/general/General.dart';
import 'package:madrasty/views/general/userList.dart';

class ClassworksList extends StatefulWidget {
  final List list;
  final String title;
  final User user;
  ClassworksList(this.list, this.title, this.user);
  @override
  _ClassworksListState createState() => _ClassworksListState();
}

class _ClassworksListState extends State<ClassworksList> {
  List<dynamic> lists;
  @override
  Widget build(BuildContext context) {
    Widget _buildIsReadDialog(BuildContext context) {
      return new AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        content: Text(
          'This exam is already submited for details go to exams page from your Profile.',
          style: paragraphStyle,
        ),
        actions: <Widget>[
          RaisedButton(
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              color: backgroundColor,
              child: Text(
                'OK',
                style: mainColorTextStyle,
              ),
              onPressed: () {
                Navigator.pop(context);
              }),
        ],
      );
    }

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: mainColor, //change your color here
        ),
        actions: [
          IconButton(
              icon: Icon(Icons.filter),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => FilterLists(widget.list, widget.title,
                            'Subjects', widget.user)));
              })
        ],
        elevation: 0,
        backgroundColor: backgroundColor,
        title: Text(
          widget.title,
          style: titleStyle,
        ),
      ),
      backgroundColor: backgroundColor,
      body: containerPadding(
        ListView.builder(
            itemCount: widget.list.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  child: ListTile(
                    contentPadding: EdgeInsets.all(20),
                    onTap: () {
                      widget.list[index].type == SubjectType.Exam &&
                              widget.user.type == Type.Child
                          ? Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => ExamView(arabicExam)))
                          : widget.list[index].type == SubjectType.Exam &&
                                  widget.user.type == Type.Teacher
                              ? Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => UsersList(
                                          [spiderMan, superMan],
                                          'Arabic Exam',
                                          1)))
                              : Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) =>
                                          WorkDetails(widget.list[index])));
                    },
                    title: Text(
                      widget.list[index].title,
                      style: smallTitleStyle,
                    ),
                    subtitle: widget.user.type != Type.Teacher
                        ? Text(
                            'Mr. ${widget.list[index].teacher.name}',
                            style: backgroundTextStyle,
                          )
                        : Text(
                            '${widget.list[index].date.toLocal()}'
                                .split(' ')[0],
                            style: backgroundTextStyle,
                          ),
                    trailing: Icon(
                      widget.list[index].isRead
                          ? Icons.done
                          : Icons.chevron_right,
                      color: mainColor,
                    ),
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundColor: backgroundColor,
                      child: Image.asset(widget.list[index].imgUrl),
                    ),
                  ));
            }),
      ),
    );
  }
}