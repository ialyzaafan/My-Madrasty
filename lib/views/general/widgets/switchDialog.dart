import 'package:flutter/material.dart';
import 'package:madrasty/style/style.dart';
import 'package:madrasty/views/general/widgets/smallText.dart';
import 'package:madrasty/views/general/widgets/textBackground.dart';

class SwitchDialog extends StatefulWidget {
  @override
  _SwitchDialogState createState() => _SwitchDialogState();
}

class _SwitchDialogState extends State<SwitchDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      content: new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          CircleAvatar(
            backgroundColor: backgroundColor,
            radius: 120,
            child: Image.asset('assets/illustrations/illus2.png'),
          ),
          SizedBox(
            height: 20,
          ),
          SmallText(text: 'Switch to Teacher account?'),
          SizedBox(
            height: 20,
          ),
          TextBackground(
              text:
                  'By switching your account you will be able to manage your classes at this school.'),
          SizedBox(
            height: 10,
          ),
          RaisedButton(
            onPressed: () {},
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child:
                  Text('Switch Account', style: TextStyle(color: Colors.white)),
            ),
            color: mainColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
          )
        ],
      ),
      actions: <Widget>[],
    );
  }
}
