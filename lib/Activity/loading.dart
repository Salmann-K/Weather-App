import 'package:flutter/material.dart';
import 'package:weatherr/Worker/worker.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String temp="";
  String hum="";
  String air_speed="";
  String des="";
  String main="";
  String icon="";
  void startApp() async{
    //Loading the data
    worker instance= worker(location: "Uttarakhand");
    await instance.getData();
    temp=instance.temp;
    hum=instance.humidity;
    air_speed=instance.air_speed;
    des=instance.description;
    main=instance.main;
    icon=instance.icon;

    //Sending Data using Home Route with no back functionality
    Navigator.pushReplacementNamed(context, '/home' , arguments: {
      "temp_value" : temp,
      "Hum_value" : hum,
      "air_speed_value" : air_speed,
      "des" : des,
      "main" : main,
      "icon_value" : icon
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    startApp();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset("assets/images/logo.png",width: 350,height: 200,),
            SizedBox(height: 40,),
            SpinKitWave(
              color: Colors.black,
              size: 50.0,
            ),
            SizedBox(height: 10,),
            Text("Weatherr App"
            ,style: TextStyle(
                  fontSize: 33,
                  fontWeight: FontWeight.w500,color: Colors.white),),
            SizedBox(height: 10,),
            Text("Made By Salman",
            style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: Colors.white)
            )
          ],
        ),
      ),
      backgroundColor: Colors.blue[300],
    );
  }
}

