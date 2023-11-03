
import 'package:http/http.dart';
import 'dart:convert';
class worker{

String location;
worker({required this.location})
{
location = this.location;
}


String temp='';
String humidity='';
String air_speed='';
String description='';
String main='';
String icon='';

//method =
Future<void> getData() async
{
  try{
    //Fetching Data
    Response response=await get(Uri.parse("https://api.openweathermap.org/data/2.5/weather?q=$location&appid=2eb8d837938e3d0d76758432e3965fad"));
    Map data = jsonDecode(response.body);

    //Getting Temp,Humidiy
    Map temp_data = data['main'];
    String getHumidity = temp_data['humidity'].toString();
    double getTemp = temp_data['temp'] - 273.15;

    //Getting air_speed
    Map wind = data['wind'];
    double getAir_speed = wind["speed"] * 3.6;


    //Getting Description
    List weather_data = data['weather'];
    Map weather_main_data = weather_data[0];
    String getMain_des = weather_main_data['main'];
    String getDesc = weather_main_data["description"];
    String geticon=weather_main_data["icon"].toString();


    //Assigning Values
    temp = getTemp.toString(); // C
    humidity = getHumidity; // %
    air_speed = getAir_speed.toString(); // Km/Hr
    description = getDesc;
    main = getMain_des;
    icon=geticon;

  }catch(e){
    temp = "Can't Find Data";
    humidity = "Can't Find Data";
    air_speed = "Can't Find Data";
    description = "Can't Find Data";
    main = "Can't Find Data";
    icon="03n";
  }

}


}