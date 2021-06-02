/*import 'package:flutter/material.dart';
import 'package:madrasty/style/style.dart';
import 'package:madrasty/views/auth/login.dart';

class GettingStarted extends StatefulWidget {
  GettingStarted({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _GettingStartedState createState() => new _GettingStartedState();
}

class _GettingStartedState extends State<GettingStarted> {
  //Create a list of PageModel to be set on the onBoarding Screens.
  final pageList = [
    PageModel(
        color: backgroundColor,
        heroImagePath: 'assets/slides/slide1.png',
        title: Text('Follow Your Child Homework', style: smallTitleStyle),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
              'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy',
              textAlign: TextAlign.center,
              style: paragraphStyle),
        ),
        icon: Icon(
          Icons.home_work,
          color: mainColor,
        )),
    PageModel(
      color: thirdColor,
      heroImagePath: 'assets/slides/slide2.png',
      title: Text('Track Your Child Bus', style: whiteSmallTitleStyle),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Text(
            'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy',
            textAlign: TextAlign.center,
            style: whiteParagraphStyle),
      ),
      icon: Icon(
        Icons.bus_alert,
        color: mainColor,
      ),
    ),
    PageModel(
      color: backgroundColor,
      heroImagePath: 'assets/slides/slide3.png',
      title: Text('All Materials in one place', style: smallTitleStyle),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Text(
            'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy',
            textAlign: TextAlign.center,
            style: paragraphStyle),
      ),
      icon: Icon(
        Icons.book_online_outlined,
        color: mainColor,
      ),
    ),
    PageModel(
      color: thirdColor,
      heroImagePath: 'assets/slides/slide4.png',
      title: Text('Follow Your Child Evalaution', style: whiteSmallTitleStyle),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Text(
            'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy',
            textAlign: TextAlign.center,
            style: whiteParagraphStyle),
      ),
      icon: Icon(
        Icons.library_books_outlined,
        color: mainColor,
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Pass pageList and the mainPage route.
      body: FancyOnBoarding(
        doneButtonText: "Done",
        skipButtonText: "Skip",
        pageList: pageList,
        onDoneButtonPressed: () => Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (_) => Login())),
        onSkipButtonPressed: () => Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (_) => Login())),
      ),
    );
  }
}
*/