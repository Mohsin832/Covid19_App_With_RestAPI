import 'package:flutter/material.dart';

class Uihelper {
  static Image customImage({required String imageURL}) {
    return Image.asset("assets/images/$imageURL");
  }

  static  customText({
    required String fontText,
    required double fontSize,
    required Color fontColor,
  }) {
    
  }
}
