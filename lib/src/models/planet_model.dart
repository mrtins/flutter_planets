import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:stars/src/services/planet_repository.dart';

class Planets {
  int _count;
  String _next;
  Null _previous;
  List<PlanetModel> _results;

  Planets(
      {int count, String next, Null previous, List<PlanetModel> results}) {
    this._count = count;
    this._next = next;
    this._previous = previous;
    this._results = results;
  }

  int get count => _count;
  String get next => _next;
  Null get previous => _previous;
  List<PlanetModel> get results => _results;

  Planets.fromJson(Map<String, dynamic> json) {
    _count = json['count'];
    _next = json['next'];
    _previous = json['previous'];
    if (json['results'] != null) {
      _results = new List<PlanetModel>();
      json['results'].forEach((v) {
        _results.add(new PlanetModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this._count;
    data['next'] = this._next;
    data['previous'] = this._previous;
    if (this._results != null) {
      data['results'] = this._results.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PlanetModel {
  String _name;
  String _rotationPeriod;
  String _orbitalPeriod;
  String _diameter;
  String _climate;
  String _gravity;
  String _terrain;
  String _surfaceWater;
  String _population;
  List<String> _residents;
  List<String> _films;
  String _created;
  String _edited;
  String _url;

  PlanetModel(
      {String name,
      String rotationPeriod,
      String orbitalPeriod,
      String diameter,
      String climate,
      String gravity,
      String terrain,
      String surfaceWater,
      String population,
      List<String> residents,
      List<String> films,
      String created,
      String edited,
      String url}) {
    this._name = name;
    this._rotationPeriod = rotationPeriod;
    this._orbitalPeriod = orbitalPeriod;
    this._diameter = diameter;
    this._climate = climate;
    this._gravity = gravity;
    this._terrain = terrain;
    this._surfaceWater = surfaceWater;
    this._population = population;
    this._residents = residents;
    this._films = films;
    this._created = created;
    this._edited = edited;
    this._url = url;
  }

  String get name => _name;
  String get rotationPeriod => _rotationPeriod;
  String get orbitalPeriod => _orbitalPeriod;
  String get diameter => _diameter;
  String get climate => _climate;
  String get gravity => _gravity;
  String get terrain => _terrain;
  String get surfaceWater => _surfaceWater;
  String get population => _population;
  List<String> get residents => _residents;
  List<String> get films => _films;
  String get created => _created;
  String get edited => _edited;
  String get url => _url;

  PlanetModel.fromJson(Map<String, dynamic> json) {
    _name = json['name'];
    _rotationPeriod = json['rotation_period'];
    _orbitalPeriod = json['orbital_period'];
    _diameter = json['diameter'];
    _climate = json['climate'];
    _gravity = json['gravity'];
    _terrain = json['terrain'];
    _surfaceWater = json['surface_water'];
    _population = json['population'];
    _residents = json['residents'].cast<String>();
    _films = json['films'].cast<String>();
    _created = json['created'];
    _edited = json['edited'];
    _url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this._name;
    data['rotation_period'] = this._rotationPeriod;
    data['orbital_period'] = this._orbitalPeriod;
    data['diameter'] = this._diameter;
    data['climate'] = this._climate;
    data['gravity'] = this._gravity;
    data['terrain'] = this._terrain;
    data['surface_water'] = this._surfaceWater;
    data['population'] = this._population;
    data['residents'] = this._residents;
    data['films'] = this._films;
    data['created'] = this._created;
    data['edited'] = this._edited;
    data['url'] = this._url;
    return data;
  }
}

class PlanetScoped extends Model {
  PlanetScoped(this._planetRepository);
  final PlanetRepository _planetRepository;

  bool _isLoading = false;
  Planets _planets;

  Planets get planets => _planets;
  bool get isLoading => _isLoading;

  void loadPlanetData() {
    _isLoading = true;
    notifyListeners();
    _planetRepository.getPlanet().then((planets) {
      _planets = planets;
      _isLoading = false;
      notifyListeners();
    });
  }

}