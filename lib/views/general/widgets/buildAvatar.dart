import 'package:flutter/material.dart';
import 'package:madrasty/style/style.dart';
import 'package:madrasty/views/general/widgets/smallRichText.dart';

class BuildAvatar extends StatelessWidget {
  final String img;
  final String description;
  final String title;
  BuildAvatar(
      {@required this.description, @required this.img, @required this.title});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(2),
          child: CircleAvatar(
            backgroundImage: AssetImage(img),
            backgroundColor: secondryColor,
            child: img == null
                ? Icon(
                    Icons.people_alt,
                    color: mainColor,
                    size: 60,
                  )
                : Container(),
            radius: MediaQuery.of(context).size.width / 6,
          ),
          decoration: BoxDecoration(
              border: Border.all(width: 3, color: Colors.white),
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5)
              ]),
        ),
        SizedBox(
          height: 20,
        ),
        SmallRichText(text1: title, text2: description),
      ],
    );
  }
}
