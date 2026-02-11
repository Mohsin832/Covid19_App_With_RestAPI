import 'package:covidapp/constants/widget.dart';
import 'package:covidapp/services/world_state_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CountriesList extends StatefulWidget {
  const CountriesList({super.key});

  @override
  State<CountriesList> createState() => _CountriesListState();
}

class _CountriesListState extends State<CountriesList> {
  TextEditingController searchController = TextEditingController();
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
              controller: searchController,
              onChanged: (value) {
                setState(() {});
              },
              decoration: InputDecoration(
                suffixIcon: Icon(CupertinoIcons.search),
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
                  return Shimmer.fromColors(
                    baseColor: Colors.grey.shade700,
                    highlightColor: Colors.grey.shade200,
                    child: ListView.builder(
                      itemCount: 7,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            ListTile(
                              title: Container(
                                height: 10,
                                width: 90,
                                color: Colors.white,
                              ),
                              subtitle: Container(
                                height: 10,
                                width: 90,
                                color: Colors.white,
                              ),
                              leading: Container(
                                height: 50,
                                width: 50,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  );
                } else {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,

                    itemBuilder: (context, index) {
                      String countryName = snapshot.data![index]["country"];
                      if (searchController.text.isEmpty) {
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
                      } else if (countryName.toLowerCase().contains(
                        searchController.text.toLowerCase(),
                      )) {
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
                      } else {
                        return Container();
                      }
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
