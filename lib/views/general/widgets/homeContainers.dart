import 'package:flutter/material.dart';
import 'package:madrasty/style/style.dart';
import 'package:madrasty/views/general/widgets/roundedCard.dart';
import 'package:madrasty/views/general/widgets/smallText.dart';

class HomeContainers extends StatelessWidget {
  final String img;
  final String title;
  final Widget child;
  HomeContainers({
    @required this.img,
    @required this.title,
    @required this.child,
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) => child));
      },
      child: Container(
        width: MediaQuery.of(context).size.width / 2.3,
        child: RoundedCard(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 30,
                  child: Image.asset(img),
                  backgroundColor: backgroundColor,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SmallText(text: title),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
