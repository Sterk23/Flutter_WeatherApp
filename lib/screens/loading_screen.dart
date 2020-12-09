import 'package:clima/services/location.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;


class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  Position position;
  void getLocation() async{
    Location location = Location();
    await location.getCurrentLocation();
    print('long'+location.long.toStringAsFixed(3)+' lat:'+location.lat.toStringAsFixed(3));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocation();
  }

  Future<void> getData() async{
    http.Response response = await http.get('https://api.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=24962586e02c22b6f32c6d7104a847f6');
    print('this function still work');
    print(response.body);
    if(response.statusCode ==200){
      String data = response.body;
    }else{
      print(response.statusCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    print('called getData');
    getData();
    return Scaffold(

    );
  }
}
