import 'dart:convert';

import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class Api {
  static var dataStorage = GetStorage();
  static var client = http.Client();
  static var _baseURL = "https://api.wheretheiss.at/v1/satellites/25544";


  // create activity function
  // ignore: non_constant_identifier_names
  static Future<List> createCountry({
    String? name,
    String? id,
    String? latitude,
    String? longitude,
    String? altitude,
    String? velocity,
    String? visibility,
    String? footprint,
    String? timestamp,
    String? daynum,
    String? solar_lat,
    String? solar_lon,
    String? units,
  }) async {

    var userToken = dataStorage.read('token');

    Map data = {
      "name": "iss",
      "id": 25544,
      "latitude": 50.11496269845,
      "longitude": 118.07900427317,
      "altitude": 408.05526028199,
      "velocity": 27635.971970874,
      "visibility": "daylight",
      "footprint": 4446.1877699772,
      "timestamp": 1364069476,
      "daynum": 2456375.3411574,
      "solar_lat": 1.3327003598631,
      "solar_lon": 238.78610691196,
      "units": "kilometers"
    };

    var body = json.encode(data);
    print(body);
    var url = Uri.parse('$_baseURL/activity_create');
    var response = await client.post(url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ' + userToken,
        },
        body: body
    );

    var jsonString = json.decode(response.body);
    if (response.statusCode == 200) {
      //show message
      print(jsonString);
      return [jsonString];
    } else {
      //show message
      print(jsonString);
      return [jsonString];
    }
  }



}