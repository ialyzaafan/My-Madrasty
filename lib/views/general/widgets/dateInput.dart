import 'package:flutter/material.dart';
import 'package:madrasty/helpers/ensure_visible.dart';
import 'package:madrasty/views/general/widgets/paratext.dart';
import 'package:madrasty/views/general/widgets/roundedCard.dart';

class DateInput extends StatefulWidget {
  DateTime selectedDate = DateTime.now();

  @override
  _DateInputState createState() => _DateInputState();
}

class _DateInputState extends State<DateInput> {
  _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: widget.selectedDate, // Refer step 1
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
      builder: (context, child) {
        return Theme(
          data: ThemeData.dark(), // This will change to light theme.
          child: child,
        );
      },
    );
    if (picked != null && picked != widget.selectedDate)
      setState(() {
        widget.selectedDate = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    return EnsureVisibleWhenFocused(
      focusNode: FocusNode(),
      child: InkWell(
        focusNode: FocusNode(),
        onTap: () => _selectDate(context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Paratext(text: 'Date'),
            SizedBox(
              height: 5,
            ),
            Container(
              child: RoundedCard(
                color: Colors.white,
                child: Paratext(
                    text: "${widget.selectedDate.toLocal()}".split(' ')[0]),
              ),
              constraints: BoxConstraints(
                  minHeight: 70, minWidth: MediaQuery.of(context).size.width),
            ),
          ],
        ),
      ),
    );
  }
}
