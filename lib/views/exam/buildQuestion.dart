import 'package:flutter/material.dart';
import 'package:madrasty/models/exam.dart';
import 'package:madrasty/style/style.dart';
import 'package:madrasty/views/notifications/notficationMethods.dart';
import 'package:madrasty/views/general/widgets/answerTextField.dart';
import 'package:madrasty/views/general/widgets/elevatedButtonSecond.dart';
import 'package:madrasty/views/general/widgets/maintextfield.dart';

class BuildAddQuestionChoose extends StatefulWidget {
  final Question question;
  final Function onTap;
  final int index;

  BuildAddQuestionChoose(this.question, this.onTap, this.index);
  @override
  _BuildAddQuestionChooseState createState() => _BuildAddQuestionChooseState();
}

class _BuildAddQuestionChooseState extends State<BuildAddQuestionChoose> {
  final Map<String, dynamic> _data = {
    'id': null,
    'question': null,
    'answers': null
  };
  String _errorMsg = '';
  Question _question;
  @override
  void initState() {
    super.initState();
    _question = widget.question;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BuildTextFormField(
            definer: 'Question ${widget.index}',
            hint: 'What is ....?',
            validator: (String value) {},
            onsave: (String value) {
              setState(() {
                _data['question'] = value;
              });
            },
            suffix: Icon(
              Icons.delete_outline_outlined,
              color: mainColor,
            ),
            obscureText: false,
            maxlin: 1,
            color: Colors.white),
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: _question.answers.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    AnswerTextfield(
                        hint: '${index + 1})...',
                        onsave: (String value) {},
                        validator: (String value) {},
                        obscureText: false,
                        delete: () {
                          setState(() {
                            _question.answers.removeAt(index);
                          });
                        },
                        perfix: () {
                          _question.answers[index].isImage = true;
                        },
                        ismultiple: true,
                        maxline: 1,
                        containImg: true),
                    _question.answers[index].isImage
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.asset(_question.answers[index].imgUrl))
                        : Container(),
                  ],
                ),
              ),
            );
          },
        ),
        SizedBox(
          height: 5,
        ),
        ElevatedButtonSecond(
            onpress: () {
              if (_question.answers.length < 3) {
                setState(() {
                  _question.answers.add(Answers(
                      '', '', false, false, false, 'assets/images/class1.png'));
                });
              } else {
                setState(() {
                  _errorMsg = 'You cannot add more than three Choices!..';
                });
              }
            },
            title: 'ADD OPTION'),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            _errorMsg,
            style: TextStyle(color: Colors.red),
          ),
        ),
      ],
    );
  }
}

class BuildAddQuestionComplete extends StatelessWidget {
  final Question question;
  final Function onTap;
  final int index;
  final SectionType type;
  BuildAddQuestionComplete(this.question, this.onTap, this.index, this.type);
  @override
  Widget build(BuildContext context) {
    return BuildTextFormField(
        definer: '',
        hint: 'Question ${index + 1} ...',
        validator: (String value) {},
        onsave: (String value) {},
        suffix: Icon(
          Icons.delete_outline_outlined,
          color: mainColor,
        ),
        obscureText: false,
        maxlin: type == SectionType.Essay ? 8 : 1,
        color: type == SectionType.Essay ? secondryColor : Colors.white);
  }
}
