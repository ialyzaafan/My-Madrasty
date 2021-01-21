import 'package:flutter/material.dart';
import 'package:madrasty/models/survey.dart';
import 'package:madrasty/style/style.dart';
import 'package:madrasty/views/general/General.dart';

class Survey extends StatefulWidget {
  final SurveyClass survy;
  Survey(this.survy);
  @override
  _SurveyState createState() => _SurveyState();
}

class _SurveyState extends State<Survey> {
  int currentStep;
  int selectedAnswer;
  @override
  void initState() {
    this.currentStep = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Text(
          'Survey',
          style: titleStyle,
        ),
        elevation: 0,
        backgroundColor: backgroundColor,
        iconTheme: IconThemeData(
          color: mainColor, //change your color here
        ),
      ),
      body: containerPadding(
        Column(
          children: [
            StepProgressBar(
              key: UniqueKey(),
              currentStep: currentStep,
              totalSteps: widget.survy.questions.length,
            ),
            Expanded(
              child: Container(
                constraints:
                    BoxConstraints(minWidth: MediaQuery.of(context).size.width),
                padding: const EdgeInsets.only(top: 20),
                child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Container(
                      padding: EdgeInsets.all(8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Question  ${this.currentStep + 1} of   ${widget.survy.questions.length}',
                            key: UniqueKey(),
                            style: backgroundTextStyle,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: Text(
                              '${widget.survy.questions[currentStep].question}',
                              key: UniqueKey(),
                              style: smallTitleStyle,
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          for (var i
                              in widget.survy.questions[currentStep].answers)
                            Container(
                              padding: EdgeInsets.all(5),
                              constraints: BoxConstraints(
                                  minWidth: MediaQuery.of(context).size.width),
                              child: RaisedButton(
                                key: UniqueKey(),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                onPressed: () {
                                  selectedAnswer = widget
                                      .survy.questions[currentStep].answers
                                      .indexOf(i);
                                  if (currentStep <
                                      widget.survy.questions.length - 1) {
                                    setState(() {
                                      selectedAnswer = widget
                                          .survy.questions[currentStep].answers
                                          .indexOf(i);

                                      currentStep++;
                                    });
                                  }
                                },
                                color: backgroundColor,
                                elevation: 0,
                                child: Text(i),
                              ),
                            ),
                        ],
                      ),
                    )),
              ),
            ),
            Row(
              children: [
                currentStep > 0
                    ? Expanded(
                        flex: 1,
                        child: RaisedButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: Text('Back'),
                            color: secondryColor,
                            onPressed: () {
                              setState(() {
                                currentStep--;
                              });
                            }))
                    : Container(),
                SizedBox(
                  width: 10,
                ),
                currentStep == widget.survy.questions.length - 1
                    ? Expanded(
                        flex: 2,
                        child: RaisedButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: Text(
                              'Continune',
                              style: TextStyle(color: Colors.white),
                            ),
                            color: mainColor,
                            onPressed: () {
                              setState(() {
                                widget.survy.done = true;
                              });
                              Navigator.pop(context);
                            }))
                    : Container()
              ],
            )
          ],
        ),
      ),
    );
  }
}

class StepProgressBar extends StatelessWidget {
  const StepProgressBar({
    Key key,
    this.currentStep,
    this.totalSteps,
  }) : super(key: key);

  final int currentStep;
  final int totalSteps;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    // if you are wrapping this widget in some padding
    const leftPadding = 20.0;
    const rightPadding = 20.0;

    // width of the separete widget
    const separatedWidth = 1.0;

    return Padding(
      padding: const EdgeInsets.only(
          top: 20, left: leftPadding, right: rightPadding, bottom: 0),
      child: Container(
        constraints: BoxConstraints(maxHeight: 2, maxWidth: screenWidth),
        child: ListView.separated(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: totalSteps,
          separatorBuilder: (context, index) => const SizedBox(
            width: separatedWidth,
          ),
          itemBuilder: (context, position) {
            return Container(
              width: (screenWidth -
                      ((totalSteps - 1) * separatedWidth) -
                      (leftPadding + rightPadding)) /
                  totalSteps,
              decoration: BoxDecoration(
                  color: secondryColor,
                  borderRadius: BorderRadius.circular(20)),
              child: Container(
                height: 2,
                decoration: BoxDecoration(
                    color: currentStep >= position
                        ? mainColor
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(20)),
              ),
            );
          },
        ),
      ),
    );
  }
}
