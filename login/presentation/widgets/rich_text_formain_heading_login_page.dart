import 'package:flutter/material.dart';
import 'package:foodiex/constants/colors/my_colors.dart';

class PrivacyAndtermsText extends StatelessWidget {
  const PrivacyAndtermsText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.bold,
          color:MyColors.softGrey,
        ),

        children: [
          TextSpan(text: "By tapping in, I accept the "),
          TextSpan(
            text: "terms of services ",
            style: TextStyle(decoration: TextDecoration.underline),
          ),
          TextSpan(text: "&"),
          TextSpan(
            text: " privacy policy",
            style: TextStyle(decoration: TextDecoration.underline),
          ),
        ],
      ),
    );
  }
}
