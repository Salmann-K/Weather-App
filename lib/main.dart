
import 'package:flutter/material.dart';
import 'package:weatherr/Activity/home.dart';
import 'package:weatherr/Activity/loading.dart';
import 'package:weatherr/Activity/location.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      "/" : (context) =>Loading(),
      "/home" : (context) => Home(),
    },
  ));

}






