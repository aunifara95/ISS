// ignore: unused_import
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:productivity_portal/services/api.dart';
// ignore: unused_import


class CreateCountryController extends GetxController {
  var isLoading = true.obs;
  var error = "";

  Future<String> createacountry({
    String? name,
    String? id,
    String? latitude,
    String? longitude,
    String? velocity,
    String? visibility,
    String? footprint,
    String? timestamp,
    String? daynum,
    String? solar_lat,
    String? solar_lon,
    String? units,
  }) async {
    try {
      isLoading(true);
      List countrycreate = await Api.createCountry(
          name: "iss",
          id: "25544",
          latitude: "50.11496269845",
          longitude: "118.07900427317",
          altitude: "408.05526028199",
          velocity: "27635.971970874",
          visibility: "daylight",
          footprint: "4446.1877699772",
          timestamp: "1364069476",
          daynum: "2456375.3411574",
          solar_lat: "1.3327003598631",
          solar_lon: "238.78610691196",
          units: "kilometers"
      );
      print(countrycreate[0]['success']);
      if (countrycreate[0]['success'] != false) {
        print(countrycreate[0]['data']);
        return countrycreate[0]['data'].toString();
      }
      else {
        print(countrycreate[0]['data']);
        return countrycreate[0]['data'].toString();
      }
    } finally {
      isLoading(false);
    }
  }
}