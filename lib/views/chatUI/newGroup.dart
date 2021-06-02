import 'package:flutter/material.dart';
import 'package:madrasty/models/user.dart';
import 'package:madrasty/style/style.dart';
import 'package:madrasty/views/general/widgets/smallText.dart';
import 'package:madrasty/views/general/widgets/textBackground.dart';

class NewGroup extends StatefulWidget {
  @override
  _NewGroupState createState() => _NewGroupState();
}

class _NewGroupState extends State<NewGroup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(
          color: mainColor, //change your color here
        ),
        centerTitle: true,
        title: Text(
          'Choose recipients',
          style: mainColorTitleTextStyle,
        ),
        actions: [
          TextButton(
              onPressed: () {},
              child: Text(
                'OK',
                style: mainColorTextStyle,
              ))
        ],
        backgroundColor: backgroundColor,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextField(
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      ),
                    ),
                    hintText: 'Search for recipients',
                    suffixIcon: Container(
                        child: Icon(Icons.search, color: Colors.white),
                        decoration: BoxDecoration(
                          color: mainColor,
                          borderRadius: BorderRadius.all(
                            Radius.circular(12.0),
                          ),
                        )))),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                    child: RaisedButton(
                  onPressed: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text('Individuals'),
                  ),
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        bottomLeft: Radius.circular(12)),
                  ),
                )),
                Expanded(
                    child: RaisedButton(
                  disabledColor: disapbledColor,
                  onPressed: null,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text('Classes'),
                  ),
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(12),
                        bottomRight: Radius.circular(12)),
                  ),
                ))
              ],
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: availableUsers.length,
                  padding: EdgeInsets.all(8),
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      child: RadioListTile(
                        secondary: CircleAvatar(
                          backgroundColor: secondryColor,
                          child: availableUsers[index].imgUrl != null
                              ? Icon(Icons.person, color: mainColor)
                              : Container(
                                  child: null,
                                ),
                          backgroundImage: AssetImage(
                              availableUsers[index].imgUrl != null
                                  ? availableUsers[index].imgUrl
                                  : ''),
                        ),
                        selected: true,
                        value: index,
                        groupValue: index,
                        onChanged: (val) {
                          print(val);
                        },
                        activeColor: mainColor,
                        title: SmallText(text: availableUsers[index].name),
                        subtitle: TextBackground(text: 'Teacher'),
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
