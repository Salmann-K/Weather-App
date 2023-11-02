import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    print("This Is A init State");
  }

  @override
  void setState(fn) {
    // TODO: implement setState
    super.setState(fn);
    print("Set state called");
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print("Widget Destroyed");
  }

  @override
  Widget build(BuildContext context) {
    // Recieving Data From the Route
    Map<dynamic, dynamic>? info =
        ModalRoute.of(context)!.settings.arguments as Map<dynamic, dynamic>?;
    var city_name = ["Mumbai", "Delhi", "Chennai", "Bengaluru", "NewYork"];
    final _random = new Random();
    var city = city_name[_random.nextInt(city_name.length)];

    return Scaffold(
      body: SafeArea(
          child: Container(
        // Main Container
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Colors.blue[800]!, Colors.blue[300]!])),
        child: Column(
          children: <Widget>[
            Container(
              // Search Container
              padding: EdgeInsets.symmetric(horizontal: 8),
              margin: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(40)),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      child: Icon(
                        Icons.search,
                        color: Colors.blue,
                      ),
                      margin: EdgeInsets.fromLTRB(3, 0, 7, 0),
                    ),
                  ),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                          border: InputBorder.none, hintText: "Search $city"),
                    ),
                  )
                ],
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: Colors.white.withOpacity(0.5)),
                    margin: EdgeInsets.symmetric(horizontal: 25),
                    padding: EdgeInsets.all(30),
                    child: Text("Text"),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 240,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: Colors.white.withOpacity(0.5)),
                    margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                    padding: EdgeInsets.all(30),
                    child: Text("Text"),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: Colors.white.withOpacity(0.5)),
                    margin: EdgeInsets.fromLTRB(20, 0, 10, 0),
                    padding: EdgeInsets.all(30),
                    height: 170,
                    child: Text("Text"),
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: Colors.white.withOpacity(0.5)),
                    margin: EdgeInsets.fromLTRB(10, 0, 20, 0),
                    padding: EdgeInsets.all(30),
                    height: 170,
                    child: Text("Text"),
                  ),
                )
              ],
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text("Made By Salman"),
                  Text("Data Provide By OpenWeathermap.org")
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
