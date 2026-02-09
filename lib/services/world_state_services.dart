import 'dart:convert';
import 'package:covidapp/model/worldstatemodel.dart';
import 'package:covidapp/services/utilities/app_url.dart';
import 'package:http/http.dart' as http;

class WorldStateServices {
  Future<Worldstatemodel> fetchWorldStateRecords() async {
    final response = await http.get(Uri.parse(AppUrl.worldStateAPI));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return Worldstatemodel.fromJson(data);
    } else {
      throw Exception("Error");
    }
  }

  Future<dynamic> fetchCountriesList() async {
    final response = await http.get(Uri.parse(AppUrl.countriesList));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return data;
    } else {
      Exception("Error");
    }
  }
}
