import 'package:covidapp/constants/widget.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  String image, name;
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
    required this.name,
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white12,
        title: Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Divider(),
          Center(
            child: Stack(
              children: [
                CircleAvatar(radius: 45, backgroundImage: NetworkImage(image)),
              ],
            ),
          ),
          OptionList(title: "Total Cases", trailing: totalCases.toString()),
        ],
      ),
    );
  }
}
