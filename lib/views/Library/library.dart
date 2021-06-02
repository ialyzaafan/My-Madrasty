import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:madrasty/models/library.dart';
import 'package:madrasty/style/style.dart';
import 'package:madrasty/views/general/widgets/smallText.dart';
import 'package:madrasty/views/general/widgets/textBackground.dart';
import 'package:madrasty/views/notifications/notficationMethods.dart';
import 'package:madrasty/views/general/widgets/parentContainer.dart';
import 'package:madrasty/views/general/widgets/roundedCard.dart';

class LibraryView extends StatelessWidget {
  final Library library;
  LibraryView(this.library);
  double _precentageLibrary(DateTime borrow, DateTime returnDate) {
    double percent;
    var totalDays = returnDate.day - borrow.day;
    var daysLef = returnDate.day - DateTime.now().day;
    percent = (daysLef / totalDays);

    return percent;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: mainColor),
        elevation: 0,
        backgroundColor: backgroundColor,
        title: Text(
          'School Library',
          style: titleStyle,
        ),
      ),
      backgroundColor: backgroundColor,
      body: ParentContainer(
          child: ListView.builder(
        itemCount: library.books.length,
        itemBuilder: (BuildContext context, int index) {
          return RoundedCard(
            color: Colors.white,
            child: Column(
              children: [
                ListTile(
                  contentPadding: EdgeInsets.only(top: 10, bottom: 10),
                  title: SmallText(text: library.books[index].name),
                  subtitle: TextBackground(
                      text: DateFormat('yyyy-MM-dd')
                          .format(library.books[index].borrowedDate)
                          .toString()),
                  leading: CircleAvatar(
                    radius: 30,
                    backgroundColor: backgroundColor,
                    child: Image.asset('assets/icons/book.png'),
                  ),
                ),
                _precentageLibrary(library.books[index].borrowedDate,
                            library.books[index].returnDate) <
                        1
                    ? LinearProgressIndicator(
                        value: _precentageLibrary(
                            library.books[index].borrowedDate,
                            library.books[index].returnDate),
                        backgroundColor: backgroundColor,
                        valueColor: AlwaysStoppedAnimation<Color>(mainColor),
                        minHeight: 5,
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          CircleAvatar(
                            radius: 15,
                            backgroundColor: mainColor,
                            child: Icon(Icons.done, color: Colors.white),
                          )
                        ],
                      )
              ],
            ),
          );
        },
      )),
    );
  }
}
