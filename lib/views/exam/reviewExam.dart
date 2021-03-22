import 'package:flutter/material.dart';
import 'package:madrasty/models/exam.dart';
import 'package:madrasty/models/user.dart';
import 'package:madrasty/style/style.dart';
import 'package:madrasty/views/general/General.dart';

class ReviewExam extends StatelessWidget {
  final User userExamed;
  final User user;
  final Exam exam;
  ReviewExam(this.exam, this.userExamed, this.user);

  Widget buildChooseSubmited(List<Question> questions, int index) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        questions[index].id.toString() + ')  ' + questions[index].question,
        style: paragraphStyle,
      ),
      ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.all(12),
        itemCount: questions[index].answers.length,
        itemBuilder: (BuildContext context, int index2) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                  border: Border.all(
                      color: questions[index].answers[index2].selected &&
                              questions[index].answers[index2].rightAnswer
                          ? Colors.green
                          : questions[index].answers[index2].selected &&
                                  !questions[index].answers[index2].rightAnswer
                              ? Colors.red
                              : backgroundColor),
                  color: backgroundColor,
                  borderRadius: BorderRadius.circular(12)),
              constraints: BoxConstraints(),
              child: Text(
                questions[index].answers[index2].id +
                    ')  ' +
                    questions[index].answers[index2].answer,
                style: paragraphStyle,
              ),
            ),
          );
        },
        shrinkWrap: true,
      )
    ]);
  }

  Widget buildCompleteSubmited(List<Question> questions, int index, maxline) {
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
              readOnly: true,
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
      body: containerPadding(
        ListView(
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              RichText(
                  textAlign: TextAlign.start,
                  text: TextSpan(children: [
                    TextSpan(text: '${exam.title}', style: smallTitleStyle),
                    TextSpan(text: '\n'),
                    TextSpan(
                      text: arabicExam.examType,
                      style: backgroundTextStyle,
                    )
                  ])),
              RichText(
                  textAlign: TextAlign.start,
                  text: TextSpan(children: [
                    TextSpan(
                        text:
                            '${exam.sections.expand((e) => e.questions).toList().length} Questions',
                        style: backgroundTextStyle),
                    TextSpan(text: '\n'),
                    TextSpan(
                      text:
                          '${exam.mark} / ${exam.sections.expand((e) => e.questions).toList().fold(0, (sum, item) => sum + item.mark)} marks',
                      style: backgroundTextStyle,
                    )
                  ])),
            ]),
            user.type == Type.Teacher
                ? SizedBox(
                    height: 10,
                  )
                : Container(),
            user.type == Type.Teacher
                ? roundedCard(
                    ListTile(
                      title: Text(
                        userExamed.name,
                        style: smallTitleStyle,
                      ),
                      leading: CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage(userExamed.imgUrl),
                      ),
                      contentPadding: EdgeInsets.only(
                          left: 70, right: 50, top: 20, bottom: 20),
                    ),
                    Colors.white,
                    0.0)
                : Container(),
            SizedBox(
              height: 20,
            ),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.all(12),
                  shrinkWrap: true,
                  itemCount: exam.sections.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Section ${index + 1}',
                          style: smallTitleStyle,
                        ),
                        Text(
                          exam.sections[index].type == SectionType.Choose
                              ? 'Choose Questions Type'
                              : exam.sections[index].type ==
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
                          itemCount: exam.sections[index].questions.length,
                          itemBuilder: (BuildContext context, int index7) {
                            return exam.sections[index].type ==
                                    SectionType.Choose
                                ? buildChooseSubmited(
                                    exam.sections[index].questions, index7)
                                : exam.sections[index].type ==
                                        SectionType.Complpete
                                    ? buildCompleteSubmited(
                                        exam.sections[index].questions,
                                        index7,
                                        1)
                                    : buildCompleteSubmited(
                                        exam.sections[index].questions,
                                        index7,
                                        8);
                          },
                        ),
                      ],
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
