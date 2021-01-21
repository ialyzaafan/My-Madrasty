import 'package:flutter/material.dart';
import 'package:madrasty/helpers/ensure_visible.dart';
import 'package:madrasty/models/notifications.dart';
import 'package:madrasty/style/style.dart';

Widget buildAvatar(
    String img, String description, final String title, BuildContext context) {
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
      RichText(
          textAlign: TextAlign.center,
          text: TextSpan(children: [
            TextSpan(text: title, style: smallTitleStyle),
            TextSpan(text: '\n'),
            TextSpan(
              text: description,
              style: backgroundTextStyle,
            )
          ])),
    ],
  );
}

Widget buildLisTileSimple(
    BuildContext context, title, route, length, imgUrl, title2) {
  return Card(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    child: ListTile(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) => route));
      },
      contentPadding: EdgeInsets.all(20),
      trailing: Icon(Icons.chevron_right, color: mainColor),
      title: Text(
        title,
        style: smallTitleStyle,
      ),
      subtitle: Text(
        length.toString() + ' ' + title2,
        style: backgroundTextStyle,
      ),
      leading: CircleAvatar(
          radius: 30,
          backgroundColor: secondryColor,
          child: Image.asset(imgUrl)),
    ),
  );
}

Widget buildLisTileSimple2(
    BuildContext context, attendances, title, imgUrl, route) {
  DateTime _now = new DateTime.now();

  return Card(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
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
          Text(
              attendances
                          .firstWhere((a) => a.date.day == DateTime.now().day)
                          .absent ==
                      null
                  ? 'Not Recognized'
                  : attendances
                          .firstWhere((a) => a.date.day == DateTime.now().day)
                          .absent
                      ? 'Absent'
                      : 'Present',
              style: backgroundTextStyle),
        ],
      ),
      title: Text(title, style: smallTitleStyle),
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

Widget homeContainers(
    final img, String title, Widget page, BuildContext context) {
  return InkWell(
    onTap: () {
      Navigator.push(context, MaterialPageRoute(builder: (_) => page));
    },
    child: Container(
      width: MediaQuery.of(context).size.width / 2.3,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
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
                child: Text(title, style: smallTitleStyle),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

String notficationType(NotficationType notType) {
  String type;
  switch (notType) {
    case NotficationType.Exam:
      type = 'Exam';
      break;
    case NotficationType.Survey:
      type = 'Survey';
      break;
    case NotficationType.Announcement:
      type = 'Announcement';
      break;
    case NotficationType.Classwork:
      type = 'Classwork';
      break;
    case NotficationType.Library:
      type = 'Library';
      break;
    case NotficationType.Reminder:
      type = 'Reminder';
      break;
    default:
      type = 'Announcement';
      break;
  }
  return type;
}

Widget buttonWithIcon(context, onPress, title, bool icon) {
  return Container(
    constraints: BoxConstraints(
        minWidth: MediaQuery.of(context).size.width, minHeight: 48.0),
    child: RaisedButton(
      color: mainColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      onPressed: onPress,
      child: icon
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 10,
                ),
                Text(
                  title,
                  style: whiteSmallTitleStyle,
                ),
                CircleAvatar(
                  backgroundColor: Colors.black.withOpacity(0.5),
                  radius: 15,
                  child:
                      Icon(Icons.chevron_right_outlined, color: Colors.white),
                )
              ],
            )
          : Text(
              title,
              style: whiteSmallTitleStyle,
            ),
    ),
  );
}

Widget seconderyBtn(context, onpress, title) {
  return Container(
    constraints: BoxConstraints(
        minWidth: MediaQuery.of(context).size.width, minHeight: 48),
    child: RaisedButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      onPressed: onpress,
      child: Text(
        title,
        style: maincolorLightSmall,
      ),
      color: secondryColor,
    ),
  );
}

final border = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(12.0)),
    borderSide: BorderSide(
      color: Colors.transparent,
    ));

Widget containerPadding(Widget child) {
  return Container(
    padding: EdgeInsets.all(20),
    child: child,
  );
}

Widget roundedCard(Widget child, color, elev) {
  return Card(
    elevation: elev,
    color: color,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: child,
    ),
  );
}

Widget cardWithBorder(Widget child, color) {
  return Card(
    elevation: 0,
    color: color,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
      side: BorderSide(
        color: Colors.black,
        width: 0.5,
      ),
    ),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: child,
    ),
  );
}

Widget cardButton(icon, iconColor, color, function) {
  return InkWell(
    onTap: function,
    child: roundedCard(
        Icon(
          icon,
          size: 30,
          color: iconColor,
        ),
        color,
        5.0),
  );
}

Widget buildTextFormField(definer, context, key, hint, validator, onsave,
    suffix, obscureText, maxlin, color) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        definer,
        style: paragraphStyle,
      ),
      SizedBox(
        height: 5,
      ),
      Theme(
        data: Theme.of(context).copyWith(
          cursorColor: mainColor,
          hintColor: Colors.transparent,
        ),
        child: EnsureVisibleWhenFocused(
          focusNode: key,
          child: TextFormField(
            maxLines: maxlin,
            validator: validator,
            focusNode: key,
            onSaved: onsave,
            obscureText: obscureText,
            decoration: InputDecoration(
                suffixIcon: suffix,
                focusedBorder: border,
                border: border,
                hintStyle:
                    TextStyle(color: greyPara, fontFamily: "WorkSansLight"),
                filled: true,
                fillColor: color,
                hintText: hint),
          ),
        ),
      ),
    ],
  );
}

Widget answerTextFormField(context, key, hint, validator, onsave, obscureText,
    delete, perfix, containImg, maxline, ismultiple) {
  return Theme(
    data: Theme.of(context).copyWith(
      cursorColor: mainColor,
      hintColor: Colors.transparent,
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        EnsureVisibleWhenFocused(
          focusNode: key,
          child: TextFormField(
            maxLines: maxline,
            validator: validator,
            focusNode: key,
            onSaved: onsave,
            obscureText: obscureText,
            decoration: InputDecoration(
                suffixIcon: InkWell(
                  onTap: ismultiple ? delete : null,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      radius: 15,
                      backgroundColor: Colors.white,
                      child: Icon(Icons.delete_outline,
                          color: ismultiple ? Colors.red : disapbledColor),
                    ),
                  ),
                ),
                focusedBorder: border,
                border: border,
                hintStyle:
                    TextStyle(color: greyPara, fontFamily: "WorkSansLight"),
                filled: true,
                fillColor: secondryColor,
                hintText: hint),
          ),
        ),
        containImg
            ? InkWell(
                onTap: perfix,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    radius: 15,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.image_outlined, color: mainColor),
                  ),
                ),
              )
            : Container(),
      ],
    ),
  );
}
