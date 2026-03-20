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
          Center(
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                SizedBox(height: 45),
                OptionList(title: "Country Name", trailing: name),
                Positioned(
                  top: -45, 
                  left: 0,
                  right: 0,
                  child: Center(
                    child: CircleAvatar(
                      radius: 40,
                      backgroundImage: NetworkImage(image),
                    ),
                  ),
                ),
              ],
            ),
          ),
          OptionList(title: "Total Cases", trailing: totalCases.toString()),
          OptionList(title: "Total Deaths", trailing: totalDeaths.toString()),
        ],
      ),
    );
  }
}
