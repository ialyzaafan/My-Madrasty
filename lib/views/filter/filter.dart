import 'package:flutter/material.dart';
import 'package:madrasty/models/user.dart';
import 'package:madrasty/style/style.dart';
import 'package:madrasty/views/child/classWorks.dart';
import 'package:madrasty/views/general/General.dart';

class FilterLists extends StatefulWidget {
  final String title;
  final List<dynamic> list;
  final String filterdListTitle;
  final User user;
  FilterLists(this.list, this.title, this.filterdListTitle, this.user);
  @override
  _FilterListsState createState() => _FilterListsState();
}

class _FilterListsState extends State<FilterLists> {
  DateTime _selectedDate = DateTime.now();
  String _selectedFilter;
  List filteredList;

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
            Wrap(
              children: widget.list
                  .map((e) => InkWell(
                        onTap: () {
                          setState(() {
                            _selectedFilter = e.title;
                          });
                        },
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Text(
                              e.title,
                              style: _selectedFilter == e.title
                                  ? whiteSmallTitleStyle
                                  : smallTitleStyle,
                            ),
                          ),
                          elevation: 0,
                          color: _selectedFilter == e.title
                              ? mainColor
                              : secondryColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                        ),
                      ))
                  .toList(),
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
                onPressed: _selectedFilter != null
                    ? () {
                        setState(() {
                          filteredList = widget.list
                              .where((e) =>
                                  e.title == _selectedFilter ||
                                  e.date == _selectedDate)
                              .toList();
                        });
                        Navigator.pop(context);
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (_) => ClassworksList(
                                    filteredList, widget.title, widget.user)));
                      }
                    : null,
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
}
