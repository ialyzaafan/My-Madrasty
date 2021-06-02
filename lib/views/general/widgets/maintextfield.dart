import 'package:flutter/material.dart';
import 'package:madrasty/helpers/ensure_visible.dart';
import 'package:madrasty/style/style.dart';

class BuildTextFormField extends StatelessWidget {
  final String definer;
  final String hint;
  final Function validator;
  final Function onsave;
  final Icon suffix;
  final bool obscureText;
  final int maxlin;
  final Color color;

  BuildTextFormField(
      {@required this.color,
      @required this.definer,
      @required this.hint,
      @required this.maxlin,
      @required this.obscureText,
      @required this.onsave,
      @required this.suffix,
      @required this.validator});
  @override
  Widget build(BuildContext context) {
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
            hintColor: Colors.transparent,
          ),
          child: EnsureVisibleWhenFocused(
            focusNode: FocusNode(),
            child: TextFormField(
              maxLines: maxlin,
              validator: validator,
              focusNode: FocusNode(),
              onSaved: onsave,
              obscureText: obscureText,
              decoration: InputDecoration(
                  suffixIcon: suffix,
                  focusedBorder: border,
                  border: border,
                  filled: true,
                  fillColor: color,
                  hintText: hint),
            ),
          ),
        ),
      ],
    );
  }
}
