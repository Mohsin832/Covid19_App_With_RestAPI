import 'package:covidapp/constants/color.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class Worldstate extends StatefulWidget {
  const Worldstate({super.key});

  @override
  State<Worldstate> createState() => _WorldstateState();
}

class _WorldstateState extends State<Worldstate> with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: Duration(seconds: 3),
    vsync: this,
  )..repeat();

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Covid-19")),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
              PieChart(
                dataMap: {"Total": 8, "Recovered": 5, "Death": 3},
                animationDuration: const Duration(milliseconds: 1200),
                chartType: ChartType.ring,
                colorList: [Appcolor.color1, Appcolor.color2, Appcolor.color3],
                chartRadius: MediaQuery.of(context).size.width / 3.2,
                legendOptions: LegendOptions(
                  legendPosition: LegendPosition.left,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
