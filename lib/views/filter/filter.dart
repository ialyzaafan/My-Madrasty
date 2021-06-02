import 'package:flutter/material.dart';
import 'package:madrasty/models/subject.dart';
import 'package:madrasty/models/user.dart';
import 'package:madrasty/style/style.dart';
import 'package:madrasty/views/child/classWorks.dart';
import 'package:madrasty/views/general/widgets/dateInput.dart';
import 'package:madrasty/views/general/widgets/elevatedButtonWithWhite.dart';
import 'package:madrasty/views/general/widgets/smallText.dart';
import 'package:madrasty/views/general/widgets/parentContainer.dart';

class FilterLists extends StatefulWidget {
  final String title;
  final String filterdListTitle;
  final User user;
  FilterLists(this.title, this.filterdListTitle, this.user);
  @override
  _FilterListsState createState() => _FilterListsState();
}

class _FilterListsState extends State<FilterLists> {
  List filteredList = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: mainColor),
        backgroundColor: backgroundColor,
        elevation: 0,
        title: Text(
          widget.title,
          style: titleStyle,
        ),
      ),
      backgroundColor: backgroundColor,
      body: ParentContainer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SmallText(text: widget.filterdListTitle),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 50,
              child: _buildChips(classworkss),
            ),
            SizedBox(
              height: 20,
            ),
            SmallText(text: 'Date'),
            SizedBox(
              height: 10,
            ),
            Container(
              constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width / 2),
              child: DateInput(),
            ),
            Expanded(child: Container()),
            Container(
              constraints:
                  BoxConstraints(minWidth: MediaQuery.of(context).size.width),
              child: ElevatedButtonWhiteSmall(
                  func: () {
                    Navigator.pop(context);
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ClassworksList(
                              classworkss, 'Classworks', widget.user)),
                    );
                  },
                  text: 'Apply Filter'),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildChips(options) {
    return ListView.builder(
      itemCount: options.length,
      // This next line does the trick.
      scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: FilterChip(
            checkmarkColor: Colors.white,
            selected: options[index].selected,
            label: Text(options[index].title,
                style: TextStyle(color: Colors.white)),
            elevation: 1,
            pressElevation: 5,
            shadowColor: Colors.teal,
            backgroundColor: disapbledColor,
            selectedColor: mainColor,
            onSelected: (bool selected) {
              setState(() {
                options[index].selected = selected;
              });
            },
          ),
        );
      },
    );
  }
}
