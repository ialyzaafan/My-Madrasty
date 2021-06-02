import 'package:flutter/material.dart';
import 'package:madrasty/style/style.dart';
import 'package:madrasty/views/general/widgets/roundedCard.dart';
import 'package:madrasty/views/general/widgets/smallText.dart';
import 'package:madrasty/views/general/widgets/textBackground.dart';

class ListSimple2 extends StatelessWidget {
  final List attendances;
  final String title;
  final String imgUrl;
  final Widget route;
  ListSimple2({
    @required this.attendances,
    @required this.title,
    @required this.imgUrl,
    @required this.route,
  });
  @override
  Widget build(BuildContext context) {
    return RoundedCard(
      color: Colors.white,
      child: ListTile(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) => route));
        },
        subtitle: Row(
          children: [
            CircleAvatar(
              radius: 5,
              backgroundColor: attendances
                          .firstWhere((a) => a.date.day == DateTime.now().day)
                          .absent ==
                      null
                  ? Colors.red
                  : attendances
                          .firstWhere((a) => a.date.day == DateTime.now().day)
                          .absent
                      ? Colors.red
                      : mainColor,
            ),
            SizedBox(
              width: 5,
            ),
            TextBackground(
                text: attendances
                            .firstWhere((a) => a.date.day == DateTime.now().day)
                            .absent ==
                        null
                    ? 'Not Recognized'
                    : attendances
                            .firstWhere((a) => a.date.day == DateTime.now().day)
                            .absent
                        ? 'Absent'
                        : 'Present'),
          ],
        ),
        title: SmallText(text: title),
        contentPadding: EdgeInsets.all(20),
        leading: CircleAvatar(
          radius: 30,
          backgroundImage: imgUrl != null ? AssetImage(imgUrl) : AssetImage(''),
          backgroundColor: secondryColor,
          child: imgUrl != null ? Container() : Icon(Icons.person),
        ),
      ),
    );
  }
}
