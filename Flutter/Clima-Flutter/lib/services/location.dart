import 'dart:ffi';

import 'package:geolocator/geolocator.dart';

class Location {
  double latitude;
  double lonitude;

  Future<void> getCurrentLocation() async {
    Position position;
    await checkLocationPermissions();

    try {
      position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      latitude = position.latitude;
      lonitude = position.longitude;
    } catch (e) {
      print(e);
    }
  }
}

Future<Bool> checkLocationPermissions() async {
  LocationPermission permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return Future.error('Location permissions are denied');
    }
  }
}
