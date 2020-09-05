import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:kepler/models/planets.dart';

class API {
  static const String url =
      "https://exoplanetarchive.ipac.caltech.edu/cgi-bin/nstedAPI/nph-nstedAPI?table=exoplanets&columns=pl_name,pl_orbper,pl_hostname,pl_bmassj,pl_dens,pl_radj,pl_disc,pl_locale,pl_telescope,pl_status&where=pl_status=3&format=json";

  static Future<List<PlanetData>> getAllPlanets() async {
    http.Response response = await http.get(url);
    final List data = json.decode(response.body);
    final List<PlanetData> planets =
        data.map((planet) => PlanetData.fromMap(planet)).toList();
    return planets;
  }
}