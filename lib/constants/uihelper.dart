import 'package:flutter/material.dart';

class Uihelper {
  static customImage({required String imageURL}) {
    return Image.asset("assets/images/$imageURL");
  }
}
