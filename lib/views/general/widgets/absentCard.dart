import 'package:flutter/material.dart';
import 'package:madrasty/style/style.dart';
import 'package:madrasty/views/general/widgets/roundedCard.dart';
import 'package:madrasty/views/general/widgets/smallText.dart';

class absentCard extends StatelessWidget {
  final String title;
  final int number;
  final int total;
  final String sign;
  absentCard({
    @required this.number,
    @required this.title,
    @required this.sign,
    @required this.total,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
          minWidth: MediaQuery.of(context).size.width / 2 - 20,
          maxWidth: MediaQuery.of(context).size.width),
      child: RoundedCard(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                  textAlign: TextAlign.start,
                  text: TextSpan(children: [
                    TextSpan(text: number.toString(), style: maincolorLightBig),
                    TextSpan(text: sign, style: maincolorLightSmall),
                    TextSpan(
                      text: total != null ? total.toString() : '',
                      style: maincolorLightSmall,
                    )
                  ])),
              SmallText(text: title)
            ],
          ),
        ),
      ),
    );
  }
}
