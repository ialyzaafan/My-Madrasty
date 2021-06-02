import 'package:flutter/material.dart';
import 'package:madrasty/models/exam.dart';
import 'package:madrasty/style/style.dart';
import 'package:madrasty/views/general/autoClosePage.dart';
import 'package:madrasty/views/general/widgets/elevatedButtonSmallText.dart';
import 'package:madrasty/views/general/widgets/parentContainer.dart';
import 'package:madrasty/views/general/widgets/roundedCard.dart';
import 'package:madrasty/views/general/widgets/smallRichText.dart';
import 'package:madrasty/views/general/widgets/smallText.dart';
import 'package:madrasty/views/general/widgets/whiteSmallText.dart';

class ExamView extends StatefulWidget {
  final Exam exam;
  ExamView(this.exam);

  @override
  _ExamViewState createState() => _ExamViewState();
}

class _ExamViewState extends State<ExamView> {
  var _list = [];

  Widget _buildSubmitDialog(BuildContext context) {
    return new AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      title: Center(child: SmallText(text: 'Submit Exam')),
      content: new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SmallRichText(
              text1: 'Are you sure that you want to submit this exam?',
              text2: 'Note that: this action is not reversable'),
        ],
      ),
      actions: <Widget>[
        RaisedButton(
            elevation: 0,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            color: backgroundColor,
            child: Text(
              'Cancel',
              style: mainColorTextStyle,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
        ElevatedButtonSmallText(
            func: () {
              Navigator.pop(context);

              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (_) => AutoClosePage(
                          'assets/illustrations/emaxSubmited.png',
                          'Exam Submited',
                          'Your exam answers have been submitted. Your teacher will review your answers and correct the exam soon.')));
            },
            text: 'Submit'),
      ],
    );
  }

  Widget buildChoose(List<Question> questions, int index) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        (index + 1).toString() + ')  ' + questions[index].question,
        style: paragraphStyle,
      ),
      ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        itemCount: questions[index].answers.length,
        itemBuilder: (BuildContext context, int index2) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                setState(() {
                  questions[index].answers.forEach((e) => e.selected = false);
                  questions[index].answers[index2].selected = true;
                });
              },
              child: Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                    border: Border.all(
                        color: questions[index].answers[index2].selected
                            ? mainColor
                            : backgroundColor),
                    color: backgroundColor,
                    borderRadius: BorderRadius.circular(12)),
                constraints: BoxConstraints(),
                child: Text(
                  (index2 + 1).toString() +
                      ')  ' +
                      questions[index].answers[index2].answer,
                  style: paragraphStyle,
                ),
              ),
            ),
          );
        },
        shrinkWrap: true,
      )
    ]);
  }

  Widget buildComplete(List<Question> questions, int index, maxline) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          questions[index].id.toString() +
              ')  ' +
              'Spiderman lover is ..............',
          style: paragraphStyle,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: TextFormField(
              maxLines: maxline,
              cursorColor: mainColor,
              decoration: new InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  contentPadding:
                      EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                  hintText: "Hint here"),
            ),
          ),
        )
      ],
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _list = widget.exam.sections.expand((e) => e.questions).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: mainColor),
        elevation: 0,
        backgroundColor: backgroundColor,
        title: Text(
          'Exam Details',
          style: titleStyle,
        ),
      ),
      backgroundColor: backgroundColor,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: ParentContainer(
          child: ListView(children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              SmallRichText(
                  text1: '${arabicExam.title}', text2: arabicExam.examType),
              SmallRichText(
                  text1:
                      '${arabicExam.sections.expand((e) => e.questions).toList().length} Questions',
                  text2:
                      '${arabicExam.sections.expand((e) => e.questions).toList().fold(0, (sum, item) => sum + item.mark)} Marks'),
            ]),
            SizedBox(
              height: 20,
            ),
            RoundedCard(
              color: Colors.white,
              child: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: widget.exam.sections.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SmallText(text: 'Section ${index + 1}'),
                      Text(
                        widget.exam.sections[index].type == SectionType.Choose
                            ? 'Choose Questions Type'
                            : widget.exam.sections[index].type ==
                                    SectionType.Complpete
                                ? 'Fill in the blanks'
                                : 'Write an Essay',
                        style: paragraphStyle,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: widget.exam.sections[index].questions.length,
                        itemBuilder: (BuildContext context, int index7) {
                          return widget.exam.sections[index].type ==
                                  SectionType.Choose
                              ? buildChoose(
                                  widget.exam.sections[index].questions, index7)
                              : widget.exam.sections[index].type ==
                                      SectionType.Complpete
                                  ? buildComplete(
                                      widget.exam.sections[index].questions,
                                      index7,
                                      1)
                                  : buildComplete(
                                      widget.exam.sections[index].questions,
                                      index7,
                                      8);
                        },
                      )
                    ],
                  );
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
                constraints: BoxConstraints(
                    minWidth: MediaQuery.of(context).size.width - 30),
                child: ElevatedButtonSmallText(
                    func: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) =>
                              _buildSubmitDialog(context));
                    },
                    text: 'Submit'))
          ]),
        ),
      ),
    );
  }
}
