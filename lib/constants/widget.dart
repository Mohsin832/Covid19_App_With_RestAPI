import 'package:flutter/material.dart';

class OptionList extends StatelessWidget {
  final String title;
  final String trailing;
  const OptionList({super.key, required this.title, required this.trailing});
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        trailing: Text(trailing),
      ),
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
