import 'package:flutter/material.dart';
import 'package:madrasty/helpers/ensure_visible.dart';
import 'package:madrasty/style/style.dart';

class AnswerTextfield extends StatelessWidget {
  final String hint;
  final Function validator;
  final Function onsave;
  final bool obscureText;
  final Function delete;
  final Function perfix;
  final bool containImg;
  final int maxline;
  final bool ismultiple;
  AnswerTextfield(
      {@required this.containImg,
      @required this.delete,
      @required this.hint,
      @required this.ismultiple,
      @required this.maxline,
      @required this.obscureText,
      @required this.onsave,
      @required this.perfix,
      @required this.validator});
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        hintColor: Colors.transparent,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          EnsureVisibleWhenFocused(
            focusNode: FocusNode(),
            child: TextFormField(
              maxLines: maxline,
              validator: validator,
              focusNode: FocusNode(),
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
}
