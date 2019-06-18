import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:stars/src/models/planet_model.dart';

class PlanetRepository {
  Future<Planets> getPlanet() async {
    var response = await http.get(
        Uri.encodeFull("https://swapi.co/api/planets/1/"),
        headers: {"Accept": "application/json"});

    return json.decode(response.body)["results"];
  }

}
