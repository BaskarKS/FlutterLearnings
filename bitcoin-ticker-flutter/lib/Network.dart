import 'package:http/http.dart' as http;
import 'dart:convert';

const apiKey = '4ECABB4E-2CB5-411A-B491-CAC39EAF320E';
const baseURL = 'https://rest.coinapi.io/v1/exchangerate/';
const valueURL = 'BTC/USD?apikey=$apiKey';

class Network {
  String url;
  Network({this.url});
  Future<dynamic> getData(String URL) async {
    http.Response conn = await http.get(URL);
    if (conn.statusCode == 200) {
      print('Valid Response');
      String body = conn.body;
      var jsonResult = jsonDecode(body);
      return jsonResult;
    } else
      return null;
  }

  Future<dynamic> getPrice(String type, String currency) async {
    String fullURL = '${baseURL}$type/$currency?apikey=$apiKey';
    return await getData(fullURL);
  }
}
