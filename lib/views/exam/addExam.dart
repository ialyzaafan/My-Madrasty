import 'package:flutter/material.dart';
import 'package:madrasty/helpers/ensure_visible.dart';
import 'package:madrasty/style/style.dart';
import 'package:madrasty/views/exam/buildExam.dart';
import 'package:madrasty/views/general/General.dart';

class AddExam extends StatefulWidget {
  @override
  _AddExamState createState() => _AddExamState();
}

class _AddExamState extends State<AddExam> {
  final _subject = FocusNode();
  final _examType = FocusNode();
  final _marks = FocusNode();
  String _valueSubj;
  String _valueExam;
  List sections = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(color: mainColor),
        backgroundColor: backgroundColor,
        title: Text(
          'Add Exam',
          style: titleStyle,
        ),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: containerPadding(ListView(
          children: [
            Text(
              'Subject',
              style: paragraphStyle,
            ),
            SizedBox(
              height: 5,
            ),
            EnsureVisibleWhenFocused(
              focusNode: _subject,
              child: roundedCard(
                  DropdownButton(
                    focusNode: _subject,
                    underline: Container(),
                    iconSize: 30,
                    icon: Icon(Icons.arrow_drop_down),
                    hint: Text(
                      'Arabic',
                      style: paragraphStyle,
                    ),
                    onChanged: (value) {
                      setState(() {
                        _valueSubj = value;
                      });
                    },
                    items: [
                      DropdownMenuItem(
                        child: Text(
                          "Religion",
                          style: paragraphStyle,
                        ),
                        value: 'Religion',
                      ),
                      DropdownMenuItem(
                        child: Text(
                          "Arabic",
                          style: paragraphStyle,
                        ),
                        value: 'Arabic',
                      ),
                    ],
                    value: _valueSubj,
                  ),
                  Colors.white,
                  0.0),
            ),
            Text(
              'Subject',
              style: paragraphStyle,
            ),
            SizedBox(
              height: 5,
            ),
            EnsureVisibleWhenFocused(
              focusNode: _examType,
              child: roundedCard(
                  DropdownButton(
                    focusNode: _examType,
                    underline: Container(),
                    iconSize: 30,
                    icon: Icon(Icons.arrow_drop_down),
                    hint: Text(
                      'Monthly Exam',
                      style: paragraphStyle,
                    ),
                    onChanged: (value) {
                      setState(() {
                        _valueExam = value;
                      });
                    },
                    items: [
                      DropdownMenuItem(
                        child: Text(
                          "Quiz",
                          style: paragraphStyle,
                        ),
                        value: 'Quiz',
                      ),
                      DropdownMenuItem(
                        child: Text(
                          "Monthly Exam",
                          style: paragraphStyle,
                        ),
                        value: 'Monthly Exam',
                      ),
                    ],
                    value: _valueExam,
                  ),
                  Colors.white,
                  0.0),
            ),
            buildTextFormField(
                'Total Marks',
                context,
                _marks,
                '40/40',
                (String value) {},
                (String value) {},
                null,
                false,
                1,
                Colors.white),
            SizedBox(
              height: 5,
            ),
            Text(
              'Exam Details',
              style: paragraphStyle,
            ),
            SizedBox(
              height: 5,
            ),
            Container(child: BuildExam())
          ],
        )),
      ),
    );
  }
}