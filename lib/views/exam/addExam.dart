import 'package:flutter/material.dart';
import 'package:madrasty/helpers/ensure_visible.dart';
import 'package:madrasty/style/style.dart';
import 'package:madrasty/views/exam/buildExam.dart';
import 'package:madrasty/views/notifications/notficationMethods.dart';
import 'package:madrasty/views/general/widgets/parentContainer.dart';
import 'package:madrasty/views/general/widgets/roundedCard.dart';
import 'package:madrasty/views/general/widgets/maintextfield.dart';

class AddExam extends StatefulWidget {
  @override
  _AddExamState createState() => _AddExamState();
}

class _AddExamState extends State<AddExam> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final Map<String, dynamic> _addFormData = {
    'subject': null,
    'type': null,
    'total_marks': null,
    'sections': null
  };

  List sections = [];
  @override
  Widget build(BuildContext context) {
    print(_addFormData['subject']);
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
        child: Form(
          key: _formKey,
          child: ParentContainer(
              child: ListView(
            children: [
              Text(
                'Subject',
                style: paragraphStyle,
              ),
              SizedBox(
                height: 5,
              ),
              EnsureVisibleWhenFocused(
                focusNode: FocusNode(),
                child: RoundedCard(
                  color: Colors.white,
                  child: DropdownButton(
                    underline: Container(),
                    iconSize: 30,
                    icon: Icon(Icons.arrow_drop_down),
                    hint: Text(
                      'Arabic',
                      style: paragraphStyle,
                    ),
                    onChanged: (value) {
                      setState(() {
                        _addFormData['subject'] = value;
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
                    value: _addFormData['subject'],
                  ),
                ),
              ),
              Text(
                'Type',
                style: paragraphStyle,
              ),
              SizedBox(
                height: 5,
              ),
              EnsureVisibleWhenFocused(
                focusNode: FocusNode(),
                child: RoundedCard(
                  color: Colors.white,
                  child: DropdownButton(
                    underline: Container(),
                    iconSize: 30,
                    icon: Icon(Icons.arrow_drop_down),
                    hint: Text(
                      'Monthly Exam',
                      style: paragraphStyle,
                    ),
                    onChanged: (value) {
                      setState(() {
                        _addFormData['type'] = value;
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
                    value: _addFormData['type'],
                  ),
                ),
              ),
              BuildTextFormField(
                  maxlin: 1,
                  definer: 'Total Marks',
                  hint: '40/40',
                  validator: (String value) {},
                  onsave: (String value) {},
                  suffix: null,
                  obscureText: false,
                  color: Colors.white),
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
              Container(child: BuildExam([]))
            ],
          )),
        ),
      ),
    );
  }
}
