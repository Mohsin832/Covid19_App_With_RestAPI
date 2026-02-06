import 'package:flutter/material.dart';

class OptionList extends StatelessWidget {
  final String title;
  final String subtitle;
  const OptionList({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(title: Text(title), subtitle: Text(subtitle)),
    );
  }
}

class Uihelper {
  static Widget customFont({
    required String text,
    required double fontsize,
    required FontWeight fontweight,
  }) {
    return Text(
      text,
      style: TextStyle(fontSize: fontsize, fontWeight: fontweight),
    );
  }
}
