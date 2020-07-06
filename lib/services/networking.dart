//Gettting data from OpenWeatherApi and decoding Json data here.

import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  NetworkHelper({this.url, this.oneCallUrl});

  final String url;
  final String oneCallUrl;

  Future getData() async {
    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }

  Future getOneCallData() async {
    http.Response response = await http.get(oneCallUrl);

    if (response.statusCode == 200) {
      String oneCallJsonData = response.body;
      var jsonData = jsonDecode(oneCallJsonData);
      return jsonData;
    } else {
      print(response.statusCode);
    }
  }
}
