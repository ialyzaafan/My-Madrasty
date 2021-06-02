import 'package:flutter/material.dart';
import 'package:madrasty/models/exam.dart';
import 'package:madrasty/style/style.dart';
import 'package:madrasty/views/exam/addQuestions.dart';
import 'package:madrasty/views/general/widgets/smallText.dart';
import 'package:madrasty/views/notifications/notficationMethods.dart';
import 'package:madrasty/views/general/widgets/buttonWithIcon.dart';
import 'package:madrasty/views/general/widgets/roundedCard.dart';

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
                SmallText(text: 'Section ${index + 1}'),
                RoundedCard(
                  color: Colors.white,
                  child: Column(
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
                      ButtonWithIcon(
                          onPress: () {
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
                          },
                          title: 'ADD QUESTION',
                          icon: false),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
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
        ButtonWithIcon(
            onPress: () {
              if (widget.sections.length < 3) {
                setState(() {
                  widget.sections.add(Section(1, SectionType.Essay, []));
                });
              } else {
                setState(() {
                  _errorMsg = 'You can not add more than three sections!..';
                });
              }
            },
            title: 'ADD SECTION',
            icon: false),
      ],
    );
  }
}
