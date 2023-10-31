import 'package:flutter/material.dart';
import 'package:weatherr/Worker/worker.dart';
class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {


  void startApp() async{
    worker instance= worker(location: "Mumbai");
    await instance.getData();
    print(instance.humidity);
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
      body: SafeArea(
        child: Column(
          children: <Widget>[
            ElevatedButton.icon(onPressed: (){
              Navigator.pushNamed(context, "/home");
            }, icon: Icon(Icons.add_to_home_screen), label: Text("Go To Home"))
          ],
        ),
      )
    );
  }
}

