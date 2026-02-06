import 'package:covidapp/constants/appcolor.dart';
import 'package:covidapp/constants/widget.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class WorldState extends StatefulWidget {
  const WorldState({super.key});

  @override
  State<WorldState> createState() => _WorldStateState();
}

class _WorldStateState extends State<WorldState> {
  final colorlist = <Color>[
    Appcolor.piecolor1,
    Appcolor.piechart2,
    Appcolor.piechart3,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Uihelper.customFont(
          text: "World State",
          fontsize: 22,
          fontweight: FontWeight.bold,
        ),
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
              PieChart(
                dataMap: const {"Total": 10, "recovered": 5, "Deaths": 5},
                animationDuration: const Duration(milliseconds: 800),
                chartType: ChartType.ring,
                chartRadius: MediaQuery.of(context).size.width / 3.2,
                ringStrokeWidth: 22,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
