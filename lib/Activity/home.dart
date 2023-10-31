import 'dart:convert';

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
    Map<dynamic, dynamic>? info = ModalRoute.of(context)!.settings.arguments as Map<dynamic, dynamic>?;


    return Scaffold(
        appBar: AppBar(
          title: Text("Home Activity"),
        ),
        body:
        Column(
          children: <Widget>[
            FloatingActionButton(
              onPressed: () {}),
            Text(info?["temp_value"])
          ],
        )

    );
  }
}