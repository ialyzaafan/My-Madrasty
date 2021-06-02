import 'package:flutter/material.dart';
import 'package:madrasty/models/messages.dart';
import 'package:madrasty/style/style.dart';
import 'package:madrasty/views/chatUI/chat.dart';
import 'package:madrasty/views/chatUI/newGroup.dart';
import 'package:madrasty/views/general/widgets/smallText.dart';
import 'package:madrasty/views/general/widgets/textBackground.dart';
import 'package:madrasty/views/notifications/notficationMethods.dart';
import 'package:madrasty/views/general/widgets/parentContainer.dart';
import 'package:madrasty/views/general/widgets/roundedCard.dart';

class ChatsHome extends StatefulWidget {
  @override
  _ChatsHomeState createState() => _ChatsHomeState();
}

class _ChatsHomeState extends State<ChatsHome> {
  Widget _buildNoMessages(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: Colors.white,
            radius: MediaQuery.of(context).size.width / 2.5,
            child: Image.asset('assets/illustrations/nomail.png'),
          ),
          SizedBox(
            height: 30.0,
          ),
          SmallText(text: 'No Messages received'),
          SizedBox(height: 20.0),
          Container(
            width: MediaQuery.of(context).size.width / 1.5,
            child: Text(
              'Your messages will appear here. Tab to create a new message.',
              maxLines: 2,
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: backgroundColor,
        title: Text(
          'Messages',
          style: titleStyle,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => NewGroup()));
              },
              child: Container(
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                    color: mainColor,
                    borderRadius: BorderRadius.all(Radius.circular(12.0))),
                child: Icon(Icons.add),
              ),
            ),
          )
        ],
      ),
      body: chats.length != 0
          ? ParentContainer(
              child: RoundedCard(
                color: Colors.white,
                child: ListView.builder(
                    itemCount: chats.length,
                    itemBuilder: (BuildContext context, int index) {
                      final Message chat = chats[index];
                      return Container(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => ChatScreen(
                                          user: chat.sender,
                                        )));
                            setState(() {
                              chat.isRead = true;
                            });
                          },
                          child: Row(
                            children: [
                              Container(
                                child: CircleAvatar(
                                    backgroundColor: secondryColor,
                                    child: chat.sender.imgUrl != null
                                        ? null
                                        : Icon(
                                            Icons.person,
                                            color: mainColor,
                                          ),
                                    radius: 30.0,
                                    backgroundImage: chat.sender.imgUrl != null
                                        ? AssetImage(chat.sender.imgUrl)
                                        : null),
                                decoration: chat.isRead
                                    ? BoxDecoration(
                                        shape: BoxShape.circle,
                                        boxShadow: [
                                            BoxShadow(
                                                color: Colors.grey
                                                    .withOpacity(0.5),
                                                spreadRadius: 2,
                                                blurRadius: 5)
                                          ])
                                    : BoxDecoration(
                                        border: Border.all(
                                            width: 2, color: mainColor),
                                        shape: BoxShape.circle,
                                        boxShadow: [
                                            BoxShadow(
                                                color: Colors.grey
                                                    .withOpacity(0.5),
                                                spreadRadius: 2,
                                                blurRadius: 5)
                                          ]),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.60,
                                padding: EdgeInsets.all(10.0),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          alignment: Alignment.topLeft,
                                          child: Text(
                                            'Student - Class 3A',
                                            textAlign: TextAlign.start,
                                            maxLines: 1,
                                            softWrap: true,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        TextBackground(
                                            text: chat.time.day.toString() +
                                                ' , ' +
                                                chat.time.minute.toString() +
                                                ':' +
                                                chat.time.second.toString())
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        SmallText(text: chat.sender.name),
                                      ],
                                    ),
                                    Container(
                                      alignment: Alignment.topLeft,
                                      padding: EdgeInsets.only(top: 5.0),
                                      child: Text(
                                        chat.text,
                                        textAlign: TextAlign.start,
                                        maxLines: 1,
                                        softWrap: true,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    Divider(
                                      thickness: 1,
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    }),
              ),
            )
          : _buildNoMessages(context),
    );
  }
}
