import 'package:flutter/material.dart';

class Uihelper {
  static Image customImage({required String imageURL}) {
    return Image.asset("assets/images/$imageURL");
  }

  static customText({
    required String fontText,
    required double fontSize,
    required Color fontColor,
    required BuildContext context,
    required FontWeight? fontWeight,
  }) {
    return Text(
      fontText,
      style: TextStyle(
        fontSize: fontSize,
        color: fontColor,
        fontWeight: fontWeight,
      ),
    );
  }
}
