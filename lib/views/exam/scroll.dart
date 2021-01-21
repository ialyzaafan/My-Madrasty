import 'package:flutter/material.dart';
import 'package:madrasty/models/exam.dart';
import 'package:madrasty/models/user.dart';
import 'package:madrasty/style/style.dart';
import 'package:madrasty/views/exam/reviewExam.dart';

class SamplePage extends StatefulWidget {
  final List<Map> userExamed;
  SamplePage(this.userExamed);
  @override
  _SamplePageState createState() => _SamplePageState();
}

class _SamplePageState extends State<SamplePage> {
  List<Widget> _samplePages;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _samplePages = widget.userExamed
        .map((p) => ReviewExam(arabicExam, p['User'], zod))
        .toList();
  }

  final _controller = new PageController();
  static const _kDuration = const Duration(milliseconds: 300);
  static const _kCurve = Curves.ease;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Stack(
        children: <Widget>[
          PageView.builder(
            controller: _controller,
            itemCount: _samplePages.length,
            itemBuilder: (BuildContext context, int index) {
              return _samplePages[index % _samplePages.length];
            },
          ),
          Positioned(
            top: 185,
            left: 40,
            right: 40,
            child: Container(
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      _controller.previousPage(
                          duration: _kDuration, curve: _kCurve);
                    },
                    child: CircleAvatar(
                      radius: 20,
                      backgroundColor: mainColor,
                      child: Icon(Icons.chevron_left, color: Colors.white),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      _controller.nextPage(
                          duration: _kDuration, curve: _kCurve);
                    },
                    child: CircleAvatar(
                      radius: 20,
                      backgroundColor: mainColor,
                      child: Icon(Icons.chevron_right, color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
