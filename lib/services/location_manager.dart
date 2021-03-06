import 'package:location/location.dart';
import 'package:flutter/services.dart';

Future<LocationData> getLocation() async {
  var currentLocation;
  var location = new Location();
  try {
    currentLocation = await location.getLocation();
  } on PlatformException catch (e) {
    if (e.code == 'PERMISSION_DENIED') {
      print('Permission denied');
    }
    currentLocation = null;
  }
  print('Execution of get location completed');
  return currentLocation;
}
