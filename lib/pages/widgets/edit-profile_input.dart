import 'package:flutter/material.dart';
import 'package:shamo/config/themes.dart';

class EditProfileInput extends StatelessWidget {
  const EditProfileInput({
    super.key,
    required this.title,
    required this.hint,
  });

  final String title;
  final String hint;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: defaultMargin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: secondaryTextStyle),
          TextFormField(
            style: primaryTextStyle.copyWith(fontSize: 16),
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: primaryTextStyle.copyWith(fontSize: 16),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: subtitleTextColor),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
