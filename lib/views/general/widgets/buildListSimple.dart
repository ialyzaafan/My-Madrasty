import 'package:flutter/material.dart';
import 'package:madrasty/style/style.dart';
import 'package:madrasty/views/general/widgets/roundedCard.dart';
import 'package:madrasty/views/general/widgets/smallText.dart';
import 'package:madrasty/views/general/widgets/textBackground.dart';

class BuildListSimple extends StatelessWidget {
  final String title;
  final Widget route;
  final int length;
  final String imgUrl;
  final String title2;
  BuildListSimple({
    @required this.imgUrl,
    @required this.length,
    @required this.route,
    @required this.title,
    @required this.title2,
  });
  @override
  Widget build(BuildContext context) {
    return RoundedCard(
      color: Colors.white,
      child: ListTile(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) => route));
        },
        contentPadding: EdgeInsets.all(20),
        trailing: Icon(Icons.chevron_right, color: mainColor),
        title: SmallText(text: title),
        subtitle: TextBackground(text: length.toString() + ' ' + title2),
        leading: CircleAvatar(
            radius: 30,
            backgroundColor: secondryColor,
            child: Image.asset(imgUrl)),
      ),
    );
  }
}
