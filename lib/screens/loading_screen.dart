import 'package:clima/screens/location_screen.dart';
import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:geolocator/geolocator.dart';


const apiKey = '24962586e02c22b6f32c6d7104a847f6';


class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  Position position;
  double latitude;
  double longitude;

   void getLocationAndData() async{
    Location location = Location();
    await location.getCurrentLocation();
    latitude = location.lat;
    longitude = location.long;
    NetworkHelper networkHelper = NetworkHelper('https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey');
    var weatherData = await networkHelper.getData();

    Navigator.push(context, MaterialPageRoute(builder: (context){
      return LocationScreen();
    }));
    print(weatherData);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocationAndData();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.teal,
          size: 100.0,
        ),
      ),
    );
  }
}
