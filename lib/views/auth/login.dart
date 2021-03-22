import 'package:flutter/material.dart';
import 'package:madrasty/models/user.dart';
import 'package:madrasty/style/style.dart';
import 'package:madrasty/views/auth/forgetPassword.dart';
import 'package:madrasty/views/child/homeChild.dart';
import 'package:madrasty/views/general/General.dart';
import 'package:madrasty/views/parent/tabs/bottomTabs.dart';
import 'package:madrasty/views/princple/homePrinciple.dart';
import 'package:madrasty/views/teacher/teachertabs.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final Map<String, dynamic> _formData = {'username': null, 'password': null};
  void _submitForm() {
    FocusScope.of(context).requestFocus(FocusNode());

    if (!_formKey.currentState.validate()) {
      return;
    } else {
      _formKey.currentState.save();
      _formData['username'] == 'teacher'
          ? Navigator.of(context)
              .pushReplacement(MaterialPageRoute(builder: (_) => TeacherTabs()))
          : _formData['username'] == 'parent'
              ? Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (_) => Home(currentParent)))
              : _formData['username'] == 'student'
                  ? Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (_) => HomeChild()))
                  : Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (_) => HomePrinciple()));
    }
  }

  bool _obscureText = true;

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _userNameFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();
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
        child: containerPadding(
          Form(
            key: _formKey,
            child: ListView(
              children: [
                Center(
                  child: Text(
                    'Enter your account details to access your account',
                    textAlign: TextAlign.center,
                    style: paragraphStyle,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                buildTextFormField(
                    'username', context, _userNameFocusNode, 'Hulk010330',
                    (String value) {
                  if (value.isEmpty) {
                    return 'Username is Required';
                  } else {
                    return null;
                  }
                }, (String value) {
                  _formData['username'] = value;
                }, null, false, 1, Colors.white),
                SizedBox(
                  height: 20,
                ),
                buildTextFormField(
                    'Password', context, _passwordFocusNode, '*******', null,
                    (String value) {
                  _formData['password'] = value;
                },
                    Padding(
                        padding: EdgeInsets.all(5),
                        child: InkWell(
                            onTap: _toggle,
                            child: Icon(
                                _obscureText ? Icons.lock : Icons.lock_open))),
                    _obscureText,
                    1,
                    Colors.white),
                SizedBox(
                  height: 40,
                ),
                buttonWithIcon(context, () {
                  _submitForm();
                }, 'SIGN IN', true),
                FlatButton(
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) => ForgetPassword()));
                    },
                    child: Text(
                      'Forget Password',
                      style: mainColorTextStyle,
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
