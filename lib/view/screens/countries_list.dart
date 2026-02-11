import 'package:covidapp/constants/widget.dart';
import 'package:covidapp/services/world_state_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CountriesList extends StatefulWidget {
  const CountriesList({super.key});

  @override
  State<CountriesList> createState() => _CountriesListState();
}

class _CountriesListState extends State<CountriesList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Uihelper.customFont(
          text: "Countries list",
          fontsize: 22,
          fontweight: FontWeight.bold,
        ),
      ),
      body: Column(
        children: [ 
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: TextFormField(
              decoration: InputDecoration(
                prefixIcon: Icon(CupertinoIcons.search),
                isDense: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(22),
                  borderSide: BorderSide(),
                  gapPadding: 22,
                ),
              ),
            ),
          ),
          Expanded(
            child: FutureBuilder(
              future: WorldStateServices.fetchCountriesList(),
              builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
                if (!snapshot.hasData) {
                  return Text("Loading");
                } else {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          ListTile(
                            leading: Image(
                              height: 55,
                              width: 55,
                              image: NetworkImage(
                                snapshot.data![index]["countryInfo"]["flag"],
                              ),
                            ),
                            title: Text(snapshot.data![index]["country"]),
                            trailing: Text(
                              snapshot.data![index]["updated"].toString(),
                            ),
                          ),
                        ],
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
