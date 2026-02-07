import 'package:covidapp/constants/appcolor.dart';
import 'package:covidapp/constants/widget.dart';
import 'package:covidapp/model/worldstatemodel.dart';
import 'package:covidapp/services/world_state_services.dart';
import 'package:covidapp/view/screens/countries_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pie_chart/pie_chart.dart';

class WorldState extends StatefulWidget {
  const WorldState({super.key});

  @override
  State<WorldState> createState() => _WorldStateState();
}

class _WorldStateState extends State<WorldState> with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: Duration(seconds: 3),
  )..repeat();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  final colorlist = <Color>[
    Appcolor.piecolor1,
    Appcolor.piechart2,
    Appcolor.piechart3,
  ];
  WorldStateServices worldStateServices = WorldStateServices();
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
              FutureBuilder(
                future: worldStateServices.fetchWorldStateRecords(),
                builder: (context, AsyncSnapshot<Worldstatemodel> snapshot) {
                  if (!snapshot.hasData) {
                    return Expanded(
                      flex: 1,
                      child: SpinKitDoubleBounce(
                        controller: _controller,
                        color: Colors.black45,
                      ),
                    );
                  } else {
                    return Column(
                      children: [
                        PieChart(
                          dataMap: {
                            "Total": double.parse(
                              snapshot.data!.cases.toString(),
                            ),
                            "recovered": double.parse(
                              snapshot.data!.recovered.toString(),
                            ),
                            "Deaths": double.parse(
                              snapshot.data!.deaths.toString(),
                            ),
                          },
                          animationDuration: const Duration(seconds: 2),
                          chartType: ChartType.ring,
                          chartRadius: MediaQuery.of(context).size.width / 3.2,
                          ringStrokeWidth: 15,

                          chartValuesOptions: ChartValuesOptions(
                            showChartValuesInPercentage: true,
                          ),
                          colorList: colorlist,
                        ),
                        SizedBox(height: 20),
                        OptionList(
                          title: "Cases",
                          trailing: snapshot.data!.cases.toString(),
                        ),
                        OptionList(
                          title: "Today's Cases",
                          trailing: snapshot.data!.todayCases.toString(),
                        ),
                        OptionList(
                          title: "Deaths",
                          trailing: snapshot.data!.deaths.toString(),
                        ),
                        OptionList(
                          title: "Recovered",
                          trailing: snapshot.data!.recovered.toString(),
                        ),
                        OptionList(
                          title: "Active",
                          trailing: snapshot.data!.active.toString(),
                        ),
                        OptionList(
                          title: "Affected Countries",
                          trailing: snapshot.data!.affectedCountries.toString(),
                        ),
                        SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const CountriesList(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            fixedSize: Size(300, 30),
                            backgroundColor: Colors.blue,
                          ),
                          child: Uihelper.customFont(
                            text: "Track countries",
                            fontsize: 20,
                            fontweight: FontWeight.normal,
                            fontColor: Colors.white,
                          ),
                        ),
                      ],
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
