import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:flutter_gradient_app_bar/flutter_gradient_app_bar.dart';
import 'package:weather_icons/weather_icons.dart';


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

    //For search bar random city names
    var city_name = ["Mumbai", "Delhi", "Chennai", "Bengaluru", "NewYork"];
    final _random = new Random();
    var city = city_name[_random.nextInt(city_name.length)];

    // Recieving Data From the Route
    Map<dynamic, dynamic>? info =
    ModalRoute.of(context)!.settings.arguments as Map<dynamic, dynamic>?;
    String temp=((info!["temp_value"]).toString().substring(0,4));
    String wind_speed=info["air_speed_value"];

    return Scaffold(
      resizeToAvoidBottomInset:false ,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: GradientAppBar(
          gradient: LinearGradient(
            colors: [
              Colors.blue,
              Colors.blue[200]!
            ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter
          ),

        ),
      ),
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
                    padding: EdgeInsets.all(26),
                    child: Row(
                      children: [
                        Image.network("https://openweathermap.org/img/wn/10d@2x.png"),
                        Column(
                          children: [
                            Text("Scattered",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
                            ),
                            Text("Ahemdabad",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),)
                          ],
                        )
                      ],
                    )
                  ),
                ),
              ],
            ),

            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 200,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: Colors.white.withOpacity(0.5)),
                    margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                    padding: EdgeInsets.all(26),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(WeatherIcons.thermometer),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("$temp",style: TextStyle(fontSize: 70),),
                            Text("C",style: TextStyle(fontSize: 30),)
                          ],
                        )
                      ],
                    )
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
                    padding: EdgeInsets.all(26),
                    height: 170,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(WeatherIcons.day_windy),
                          ],
                        ),
                        SizedBox(height: 15,),
                        Text("20.9",style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold),),
                        Text("Km/hr",style: TextStyle(fontSize: 13),)

                      ],
                    )
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: Colors.white.withOpacity(0.5)),
                    margin: EdgeInsets.fromLTRB(10, 0, 20, 0),
                    padding: EdgeInsets.all(26),
                    height: 170,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(WeatherIcons.humidity),
                          ],
                        ),
                        SizedBox(height: 15,),
                        Text("60",style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold),),
                        Text("Percent",style: TextStyle(fontSize: 13),)

                      ],
                    )
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
