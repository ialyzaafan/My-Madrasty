import 'package:flutter/material.dart';
import 'package:madrasty/helpers/ensure_visible.dart';
import 'package:madrasty/style/style.dart';
import 'package:madrasty/views/general/widgets/paratext.dart';
import 'package:madrasty/views/general/widgets/roundedCard.dart';

class DropDownItem extends StatefulWidget {
  String value;
  DropDownItem({@required this.value});

  @override
  _DropDownItemState createState() => _DropDownItemState();
}

class _DropDownItemState extends State<DropDownItem> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Paratext(text: 'Leave Type'),
        SizedBox(
          height: 5,
        ),
        Container(
          constraints: BoxConstraints(
              minWidth: MediaQuery.of(context).size.width, maxHeight: 70),
          child: RoundedCard(
            color: Colors.white,
            child: EnsureVisibleWhenFocused(
              focusNode: FocusNode(),
              child: DropdownButton(
                focusNode: FocusNode(),
                underline: Container(),
                iconSize: 30,
                icon: Icon(Icons.arrow_drop_down),
                hint: Paratext(text: 'Anuual'),
                onChanged: (valuee) {
                  setState(() {
                    widget.value = valuee;
                  });
                },
                items: [
                  DropdownMenuItem(
                    child: Paratext(
                      text: "Sick Leave",
                    ),
                    value: 'Sick',
                  ),
                  DropdownMenuItem(
                    child: Paratext(
                      text: "Anuual Leave",
                    ),
                    value: 'Anuual',
                  ),
                ],
                value: widget.value,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
