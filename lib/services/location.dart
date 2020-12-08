


import 'package:geolocator/geolocator.dart';

class Location {

  double lat;
  double long;
  Position position;

  Future<void> getCurrentLocation() async{
    try {
      position = await Geolocator().getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      lat = position.latitude;
      long = position.longitude;
      print(position);
    }catch(e){
      print(e);
    }
  }



}