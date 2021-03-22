import 'package:flutter/material.dart';
import 'package:madrasty/models/exam.dart';
import 'package:madrasty/style/style.dart';
import 'package:madrasty/views/exam/addQuestions.dart';
import 'package:madrasty/views/general/General.dart';

class BuildExam extends StatefulWidget {
  final List<Section> sections;
  BuildExam(this.sections);
  @override
  _BuildExamState createState() => _BuildExamState();
}

class _BuildExamState extends State<BuildExam> {
  String _errorMsg = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView.builder(
          shrinkWrap: true,
          itemCount: widget.sections.length,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Section ${index + 1}',
                  style: smallTitleStyle,
                ),
                roundedCard(
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        DropdownButton(
                          value: widget.sections[index].type,
                          iconSize: 30,
                          underline: Container(),
                          hint: Text('Section Type'),
                          items: [
                            DropdownMenuItem(
                              child: Text(
                                'Essay',
                                style: paragraphStyle,
                              ),
                              value: SectionType.Essay,
                            ),
                            DropdownMenuItem(
                              child: Text(
                                'Complete',
                                style: paragraphStyle,
                              ),
                              value: SectionType.Complpete,
                            ),
                            DropdownMenuItem(
                              child: Text(
                                'Choose',
                                style: paragraphStyle,
                              ),
                              value: SectionType.Choose,
                            ),
                          ],
                          onChanged: (value) {
                            setState(() {
                              widget.sections[index].type = value;
                            });
                          },
                        ),
                        QuestionsBuilder(widget.sections[index].questions,
                            widget.sections[index].type),
                        SizedBox(
                          height: 10,
                        ),
                        buttonWithIcon(context, () {
                          if (widget.sections[index].questions.length <= 10) {
                            setState(() {
                              widget.sections[index].questions
                                  .add(Question(index + 1, '', 40, []));
                            });
                          } else {
                            setState(() {
                              _errorMsg =
                                  'you can not add more than 10 questions for exam';
                            });
                          }
                        }, 'ADD QUESTION', false),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                    Colors.white,
                    0.0),
              ],
            );
          },
        ),
        Text(
          _errorMsg,
          style: TextStyle(color: Colors.red),
        ),
        SizedBox(
          height: 10,
        ),
        buttonWithIcon(context, () {
          if (widget.sections.length < 3) {
            setState(() {
              widget.sections.add(Section(1, SectionType.Essay, []));
            });
          } else {
            setState(() {
              _errorMsg = 'You can not add more than three sections!..';
            });
          }
        }, 'ADD SECTION', false),
      ],
    );
  }
}
