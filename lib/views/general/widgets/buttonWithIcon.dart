import 'package:flutter/material.dart';
import 'package:madrasty/style/style.dart';
import 'package:madrasty/views/general/widgets/ContainerForButtons.dart';
import 'package:madrasty/views/general/widgets/smallText.dart';
import 'package:madrasty/views/general/widgets/whiteSmallText.dart';

class ButtonWithIcon extends StatelessWidget {
  final bool icon;
  final Function onPress;
  final String title;
  ButtonWithIcon({
    @required this.icon,
    @required this.onPress,
    @required this.title,
  });
  @override
  Widget build(BuildContext context) {
    return ContainerForButtons(
      child: ElevatedButton(
        onPressed: onPress,
        child: icon
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  SmallText(text: title),
                  CircleAvatar(
                    backgroundColor: Colors.black.withOpacity(0.5),
                    radius: 15,
                    child:
                        Icon(Icons.chevron_right_outlined, color: Colors.white),
                  )
                ],
              )
            : WhiteSmallText(text: title),
      ),
    );
  }
}
