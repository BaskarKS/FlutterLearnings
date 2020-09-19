import 'package:http/http.dart' as http;
import 'dart:convert'; // contains some helper methods
import 'package:geolocator/geolocator.dart';
import 'package:clima/services/location.dart';

class NetworkHelper {
  final String url;
  NetworkHelper({this.url});

  Future getData() async {
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else
      print(response.statusCode);
  }
}
