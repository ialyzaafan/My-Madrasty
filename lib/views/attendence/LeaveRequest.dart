import 'package:flutter/material.dart';
import 'package:madrasty/helpers/ensure_visible.dart';
import 'package:madrasty/style/style.dart';
import 'package:madrasty/views/general/General.dart';
import 'package:madrasty/views/general/autoClosePage.dart';

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

  final _typeFocusKey = FocusNode();

  final _startFocusKey = FocusNode();

  DateTime _selectedDate = DateTime.now();

  final _descriptionFocusKey = FocusNode();
  String _value;
  bool _obscureText = true;

  void _submitForm() {
    FocusScope.of(context).requestFocus(FocusNode());

    if (!_formKey.currentState.validate()) {
      return;
    } else {
      _formKey.currentState.save();
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        iconTheme: IconThemeData(color: mainColor),
        elevation: 0,
        backgroundColor: backgroundColor,
        title: Text(
          'Request Leave',
          style: titleStyle,
        ),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: containerPadding(Form(
          key: _formKey,
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    EnsureVisibleWhenFocused(
                      focusNode: _typeFocusKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Leave Type',
                            style: paragraphStyle,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            constraints: BoxConstraints(
                                minWidth: MediaQuery.of(context).size.width,
                                maxHeight: 70),
                            child: roundedCard(
                                DropdownButton(
                                  focusNode: _typeFocusKey,
                                  underline: Container(),
                                  iconSize: 30,
                                  icon: Icon(Icons.arrow_drop_down),
                                  hint: Text(
                                    'Anuual',
                                    style: paragraphStyle,
                                  ),
                                  onChanged: (value) {
                                    setState(() {
                                      _value = value;
                                    });
                                  },
                                  items: [
                                    DropdownMenuItem(
                                      child: Text(
                                        "Sick Leave",
                                        style: paragraphStyle,
                                      ),
                                      value: 'Sick',
                                    ),
                                    DropdownMenuItem(
                                      child: Text(
                                        "Anuual Leave",
                                        style: paragraphStyle,
                                      ),
                                      value: 'Anuual',
                                    ),
                                  ],
                                  value: _value,
                                ),
                                Colors.white,
                                0.0),
                          ),
                        ],
                      ),
                    ),
                    EnsureVisibleWhenFocused(
                      focusNode: _startFocusKey,
                      child: InkWell(
                        focusNode: _startFocusKey,
                        onTap: () => _selectDate(context),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Date',
                              style: paragraphStyle,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              child: roundedCard(
                                  Text(
                                    "${_selectedDate.toLocal()}".split(' ')[0],
                                    style: paragraphStyle,
                                  ),
                                  Colors.white,
                                  0.0),
                              constraints: BoxConstraints(
                                  minHeight: 70,
                                  minWidth: MediaQuery.of(context).size.width),
                            ),
                          ],
                        ),
                      ),
                    ),
                    buildTextFormField('reason', context, _descriptionFocusKey,
                        'descripte your reason', (String value) {
                      if (value.isEmpty) {
                        return 'reason is Required';
                      } else {
                        return null;
                      }
                    }, (String value) {}, null, _obscureText, 1, Colors.white)
                  ],
                ),
              ),
              buttonWithIcon(context, () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (_) => AutoClosePage(
                        'assets/illustrations/leavereq.png',
                        ' Request successfully  sent !',
                        'Your leave request has been successfully  sent . You will receive  an confirmation shortly.')));
              }, 'Send Request', false)
            ],
          ),
        )),
      ),
    );
  }

  _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate, // Refer step 1
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
      builder: (context, child) {
        return Theme(
          data: ThemeData.dark(), // This will change to light theme.
          child: child,
        );
      },
    );
    if (picked != null && picked != _selectedDate)
      setState(() {
        _selectedDate = picked;
      });
  }
}
