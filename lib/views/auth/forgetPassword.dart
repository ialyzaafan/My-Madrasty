import 'package:flutter/material.dart';
import 'package:madrasty/helpers/ensure_visible.dart';
import 'package:madrasty/style/style.dart';
import 'package:madrasty/views/general/General.dart';
import 'package:madrasty/views/general/autoClosePage.dart';

class ForgetPassword extends StatefulWidget {
  @override
  _ForgetPasswordState createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final Map<String, dynamic> _formData = {'email': null};
  void _submitForm() {
    FocusScope.of(context).requestFocus(FocusNode());

    if (!_formKey.currentState.validate()) {
      return;
    } else {
      _formKey.currentState.save();
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (_) => AutoClosePage(
                  'assets/illustrations/check_mail.png',
                  'Check your Email!',
                  'A link was sent to your email address to restore  your account')));
    }
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _userNameFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: mainColor),
        backgroundColor: backgroundColor,
        elevation: 0,
        title: Text(
          'Sign in',
          style: titleStyle,
        ),
      ),
      backgroundColor: backgroundColor,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Container(
          padding: EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                Center(
                  child: Text(
                    'Enter your email to reset password',
                    textAlign: TextAlign.center,
                    style: paragraphStyle,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Email',
                  style: paragraphStyle,
                ),
                SizedBox(
                  height: 5,
                ),
                Theme(
                  data: Theme.of(context).copyWith(
                    cursorColor: mainColor,
                    hintColor: Colors.transparent,
                  ),
                  child: EnsureVisibleWhenFocused(
                    focusNode: _userNameFocusNode,
                    child: TextFormField(
                      focusNode: _userNameFocusNode,
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'Email is Required';
                        } else {
                          return null;
                        }
                      },
                      onSaved: (String value) {
                        _formData['email'] = value;
                      },
                      decoration: InputDecoration(
                          focusedBorder: border,
                          border: border,
                          hintStyle: TextStyle(
                              color: greyPara, fontFamily: "WorkSansLight"),
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Hulk010330'),
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                buttonWithIcon(context, () {
                  _submitForm();
                }, 'Forget Password', true)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
