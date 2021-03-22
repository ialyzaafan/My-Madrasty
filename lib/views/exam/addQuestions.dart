import 'package:flutter/material.dart';
import 'package:madrasty/models/exam.dart';
import 'package:madrasty/views/exam/buildQuestion.dart';

class QuestionsBuilder extends StatefulWidget {
  final List<Question> questions;
  final SectionType type;
  QuestionsBuilder(this.questions, this.type);
  @override
  _QuestionsBuilderState createState() => _QuestionsBuilderState();
}

class _QuestionsBuilderState extends State<QuestionsBuilder> {
  List<Question> _questions;
  String _errorMsg = '';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _questions = widget.questions;
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: _questions.length,
      itemBuilder: (BuildContext context, int index) {
        return widget.type != SectionType.Choose
            ? BuildAddQuestionComplete(_questions[index], () {
                setState(() {
                  _questions.removeAt(index);
                });
              }, index, widget.type)
            : BuildAddQuestionChoose(_questions[index], () {
                setState(() {
                  _questions.removeAt(index);
                });
              }, index + 1);
      },
    );
  }
}
