import 'package:flutter/material.dart';
import 'package:madrasty/models/subject.dart';
import 'package:madrasty/models/user.dart';
import 'package:madrasty/style/style.dart';
import 'package:madrasty/views/child/classWorks.dart';
import 'package:madrasty/views/general/General.dart';

class FilterLists extends StatefulWidget {
  final String title;
  final String filterdListTitle;
  final User user;
  FilterLists(this.title, this.filterdListTitle, this.user);
  @override
  _FilterListsState createState() => _FilterListsState();
}

class _FilterListsState extends State<FilterLists> {
  DateTime _selectedDate = DateTime.now();
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
      body: containerPadding(
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.filterdListTitle,
              style: smallTitleStyle,
            ),
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
            Text(
              'Date',
              style: smallTitleStyle,
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width / 2),
              child: InkWell(
                onTap: () => _selectDate(context),
                child: Card(
                  elevation: 0,
                  child: Center(
                      child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      "${_selectedDate.toLocal()}".split(' ')[0],
                      style: paragraphStyle,
                    ),
                  )),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
              ),
            ),
            Expanded(child: Container()),
            Container(
              constraints:
                  BoxConstraints(minWidth: MediaQuery.of(context).size.width),
              child: RaisedButton(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    'Apply Filter',
                    style: whiteSmallTitleStyle,
                  ),
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                elevation: 0,
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ClassworksList(
                            classworkss, 'Classworks', widget.user)),
                  );
                },
                color: mainColor,
              ),
            )
          ],
        ),
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
