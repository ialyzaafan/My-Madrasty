import 'package:flutter/material.dart';
import 'package:madrasty/models/user.dart';
import 'package:madrasty/style/style.dart';
import 'package:madrasty/views/general/widgets/smallText.dart';
import 'package:madrasty/views/general/widgets/textBackground.dart';
import 'package:madrasty/views/notifications/notficationMethods.dart';
import 'package:madrasty/views/general/widgets/buildAvatar.dart';
import 'package:madrasty/views/general/widgets/parentContainer.dart';

class InfoChat extends StatefulWidget {
  final String groupName;
  InfoChat({this.groupName});
  @override
  _InfoChatState createState() => _InfoChatState();
}

class _InfoChatState extends State<InfoChat> {
  final myController = TextEditingController();
  String _groupName;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _groupName = widget.groupName;
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  Widget _buildChangeName(BuildContext context) {
    return new AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      title: Center(child: const Text('Edit Group Name')),
      content: new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          TextField(
              controller: myController,
              decoration: InputDecoration(
                filled: true,
                fillColor: lightMainColor.withOpacity(0.1),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                  ),
                ),
                hintText: 'eg. Class 3A parents',
              )),
          SizedBox(
            height: 20,
          ),
          RaisedButton(
            onPressed: () {
              setState(() {
                _groupName = myController.text;
                Navigator.pop(context);
              });
            },
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text('Save', style: TextStyle(color: Colors.white)),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              icon: Icon(
                Icons.edit_outlined,
                color: mainColor,
              ),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) =>
                        _buildChangeName(context));
              })
        ],
        iconTheme: IconThemeData(
          color: mainColor, //change your color here
        ),
        elevation: 0,
        backgroundColor: backgroundColor,
      ),
      backgroundColor: backgroundColor,
      body: ParentContainer(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              BuildAvatar(
                  img: '',
                  title: 'Aly Hassan + 30 more',
                  description:
                      _groupName != null ? _groupName : 'Group Message'),
              SizedBox(
                height: 10,
              ),
              Container(
                constraints:
                    BoxConstraints(minWidth: MediaQuery.of(context).size.width),
                child: RaisedButton(
                  elevation: 0,
                  onPressed: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text('Add Recipients',
                        style: TextStyle(color: mainColor)),
                  ),
                  color: lightMainColor.withOpacity(0.1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                  child: ListView.builder(
                      itemCount: availableUsers.length,
                      padding: EdgeInsets.all(8),
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          trailing: Icon(
                            Icons.remove_circle_rounded,
                            color: mainColor,
                          ),
                          subtitle: TextBackground(text: 'Class 3A'),
                          title: SmallText(text: availableUsers[index].name),
                          leading: CircleAvatar(
                            backgroundColor: secondryColor,
                            backgroundImage:
                                AssetImage(availableUsers[index].imgUrl),
                            child: availableUsers[index].imgUrl != null
                                ? Container(
                                    child: null,
                                  )
                                : Icon(Icons.person, color: mainColor),
                          ),
                        );
                      }),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
