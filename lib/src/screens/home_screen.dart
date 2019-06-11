import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:http/http.dart' as http;

import 'package:stars/src/models/planet_model.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen();

  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Planets planets;
  List<PlanetModel> planetModel;

  @override
  void initState() {
    super.initState();
    getPlanets();
  }

  getPlanets() async {
    http.Response response = await http.get("https://swapi.co/api/planets");
    var decode = jsonDecode(response.body);
    planets = Planets.fromJson(decode);
    planetModel = planets.results;
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text('Stars'),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            ListTile(
                title: Text('Home'),
                leading: Icon(Icons.home),
                selected: true,
                onTap: () {
                  return null;
                }),
            ListTile(
                title: Text('Logout'),
                leading: Icon(Icons.exit_to_app),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => null),
                  );
                })
          ],
        ),
      ),
      body: planetModel.length == 0
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: planetModel.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('${planetModel[index]}'),
                );
              },
            ),
    );
  }
}
