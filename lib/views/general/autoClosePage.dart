import 'package:flutter/material.dart';
import 'package:madrasty/style/style.dart';
import 'dart:async';

class AutoClosePage extends StatefulWidget {
  final image;
  final title;
  final description;
  AutoClosePage(this.image, this.title, this.description);
  @override
  _AutoClosePageState createState() => _AutoClosePageState();
}

class _AutoClosePageState extends State<AutoClosePage> {
  @override
  initState() {
    super.initState();
    new Timer(const Duration(seconds: 5), onClose);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(elevation: 0, backgroundColor: backgroundColor),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(widget.image),
                SizedBox(
                  height: 20,
                ),
                Text(
                  widget.title,
                  style: smallTitleStyle,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  widget.description,
                  style: paragraphStyle,
                  textAlign: TextAlign.center,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void onClose() {
    Navigator.of(context).pop();
  }
}
