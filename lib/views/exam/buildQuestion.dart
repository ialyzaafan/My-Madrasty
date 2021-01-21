import 'package:flutter/material.dart';
import 'package:madrasty/models/exam.dart';
import 'package:madrasty/style/style.dart';
import 'package:madrasty/views/general/General.dart';

class BuildAddQuestionChoose extends StatefulWidget {
  final Question question;
  final Function onTap;
  final int index;

  BuildAddQuestionChoose(this.question, this.onTap, this.index);
  @override
  _BuildAddQuestionChooseState createState() => _BuildAddQuestionChooseState();
}

class _BuildAddQuestionChooseState extends State<BuildAddQuestionChoose> {
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
        buildTextFormField(
            'Question ${widget.index}',
            context,
            FocusNode(),
            'What is ....?',
            (String value) {},
            (String value) {},
            InkWell(
              onTap: widget.onTap,
              child: Icon(
                Icons.delete_outline_outlined,
                color: mainColor,
              ),
            ),
            false,
            1,
            Colors.white),
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
                    answerTextFormField(
                        context,
                        FocusNode(),
                        '${index + 1})...',
                        (String value) {},
                        (String value) {},
                        false, () {
                      setState(() {
                        _question.answers.removeAt(index);
                      });
                    }, () {
                      _question.answers[index].isImage = true;
                    }, true, 1, true),
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
        seconderyBtn(context, () {
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
        }, 'ADD OPTION'),
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
    return buildTextFormField(
        '',
        context,
        FocusNode(),
        'Question ${index + 1} ...',
        (String value) {},
        (String value) {},
        InkWell(
          onTap: onTap,
          child: Icon(
            Icons.delete_outline_outlined,
            color: mainColor,
          ),
        ),
        false,
        type == SectionType.Essay ? 8 : 1,
        type == SectionType.Essay ? secondryColor : Colors.white);
  }
}
