import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:stars/src/models/people_model.dart';

class PeopleRepository {
  Future<People> getPeople() async {
    final response = await http.get(
        Uri.encodeFull("https://swapi.co/api/people/1/"),
        headers: {"Accept": "application/json"});

    if (response.statusCode == 200) {
      return People.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load people');
    }
  }
}
