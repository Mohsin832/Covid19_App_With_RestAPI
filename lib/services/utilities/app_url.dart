class AppUrl {
  // This url is the base of api
  static const String baseUrl = "https://disease.sh/v3/covid-19/";
  // End points for base urls
  static const String worldStateAPI = "${baseUrl}all";
  static const String countriesList = "${baseUrl}countries";
}
