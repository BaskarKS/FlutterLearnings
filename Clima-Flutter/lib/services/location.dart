import 'package:geolocator/geolocator.dart';

class Location {
  double latitude;
  double longitude;

  double get getLatitude {
    return latitude;
  }

  double get getLongitude {
    return longitude;
  }

  Future<void> getCurrentLocation() async {
    Position position;
    try {
      position = await GeolocatorPlatform.instance
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    } catch (e) {
      print(e);
    }
    latitude = position?.latitude;
    longitude = position?.longitude;
  }

  void displayCoordinates() {
    print("Current Location Latitude : $latitude, Longitude: $longitude");
  }

  String getCoordinates() {
    return 'Latitude : $latitude, Longitude: $longitude';
  }
}
