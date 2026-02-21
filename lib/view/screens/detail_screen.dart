import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  String image, Name;
  int totalCases,
      totalDeaths,
      totalRecovered,
      active,
      critical,
      todayRecovered,
      test;
  DetailScreen({
    super.key,
    required this.image,
    required this.Name,
    required this.totalCases,
    required this.totalDeaths,
    required this.totalRecovered,
    required this.active,
    required this.critical,
    required this.todayRecovered,
    required this.test,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text(Name), centerTitle: true));
  }
}
