import 'package:flutter/material.dart';
import 'package:madrasty/style/style.dart';
import 'package:madrasty/views/general/widgets/dateInput.dart';
import 'package:madrasty/views/general/widgets/dropDownItem.dart';

import 'package:madrasty/views/general/autoClosePage.dart';
import 'package:madrasty/views/general/widgets/buttonWithIcon.dart';
import 'package:madrasty/views/general/widgets/layout.dart';
import 'package:madrasty/views/general/widgets/parentContainer.dart';
import 'package:madrasty/views/general/widgets/maintextfield.dart';

class LeaveRequest extends StatefulWidget {
  @override
  _LeaveRequestState createState() => _LeaveRequestState();
}

class _LeaveRequestState extends State<LeaveRequest> {
  final Map<String, dynamic> _formData = {
    'type': null,
    'start': null,
    'end': null,
    'description': null
  };

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _value;
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Layout(
      title: 'Request Leave',
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  DropDownItem(value: _value),
                  DateInput(),
                  BuildTextFormField(
                      definer: 'reason',
                      hint: 'descripte your reason',
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'reason is Required';
                        } else {
                          return null;
                        }
                      },
                      onsave: (String value) {},
                      suffix: null,
                      obscureText: _obscureText,
                      maxlin: 1,
                      color: Colors.white)
                ],
              ),
            ),
            ButtonWithIcon(
                onPress: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (_) => AutoClosePage(
                          'assets/illustrations/leavereq.png',
                          ' Request successfully  sent !',
                          'Your leave request has been successfully  sent . You will receive  an confirmation shortly.')));
                },
                title: 'Send Request',
                icon: false)
          ],
        ),
      ),
    );
  }
}
