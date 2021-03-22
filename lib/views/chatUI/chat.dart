import 'package:flutter/material.dart';
import 'package:madrasty/models/messages.dart';
import 'package:madrasty/models/user.dart';
import 'package:madrasty/style/style.dart';
import 'package:madrasty/views/chatUI/infoChat.dart';
import 'package:madrasty/views/general/General.dart';

class ChatScreen extends StatefulWidget {
  final User user;
  ChatScreen({this.user});
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  _sendMessageArea() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      height: 70,
      color: Colors.white,
      child: Row(
        children: [
          IconButton(
              iconSize: 25,
              color: mainColor,
              icon: Icon(
                Icons.photo_outlined,
                color: mainColor,
              ),
              onPressed: () {}),
          Expanded(
            child: TextField(
              decoration: InputDecoration.collapsed(hintText: 'Send a Message'),
              textCapitalization: TextCapitalization.sentences,
            ),
          ),
          IconButton(
              iconSize: 25,
              color: mainColor,
              icon: Icon(
                Icons.send,
                color: mainColor,
              ),
              onPressed: () {})
        ],
      ),
    );
  }

  _chatBubble(Message message, bool isMe, isSameUser) {
    if (isMe) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
              alignment: Alignment.topRight,
              constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width * 0.80),
              child: Text(
                message.text,
                style: TextStyle(color: Colors.white),
              ),
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                  color: mainColor,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5)
                  ])),
          !isSameUser
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      message.time.minute.toString() +
                          ':' +
                          message.time.second.toString(),
                      style: backgroundTextStyle,
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    Container(
                      padding: EdgeInsets.all(2),
                      child: CircleAvatar(
                          backgroundColor: secondryColor,
                          radius: 15.0,
                          backgroundImage: AssetImage(message.sender.imgUrl)),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 5)
                          ]),
                    ),
                  ],
                )
              : Container(
                  child: null,
                )
        ],
      );
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              alignment: Alignment.topLeft,
              constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width * 0.80),
              child: Text(message.text),
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5)
                  ])),
          !isSameUser
              ? Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(2),
                      child: CircleAvatar(
                          backgroundColor: secondryColor,
                          radius: 15.0,
                          backgroundImage: AssetImage(message.sender.imgUrl)),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 5)
                          ]),
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    Text(
                      message.time.minute.toString() +
                          ':' +
                          message.time.second.toString(),
                      style: backgroundTextStyle,
                    )
                  ],
                )
              : Container(
                  child: null,
                )
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    int prevUserId;
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: mainColor, //change your color here
        ),
        actions: [
          IconButton(
              icon: Icon(
                Icons.info_outline,
                color: mainColor,
              ),
              onPressed: () => Navigator.push(
                  context, MaterialPageRoute(builder: (_) => InfoChat())))
        ],
        backgroundColor: backgroundColor,
        centerTitle: true,
        title: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(children: [
              TextSpan(text: widget.user.name, style: smallTitleStyle),
              TextSpan(text: '\n'),
              TextSpan(
                text: 'Group Message',
                style: backgroundTextStyle,
              )
            ])),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(20),
              reverse: true,
              itemCount: chats.length,
              itemBuilder: (BuildContext context, int index) {
                final Message message = chats[index];
                final bool isMe = message.sender.id == spiderMan.id;
                final isSameUser = prevUserId == message.sender.id;
                prevUserId = message.sender.id;
                return _chatBubble(message, isMe, isSameUser);
              },
            ),
          ),
          _sendMessageArea()
        ],
      ),
    );
  }
}
