
import 'dart:convert';

// ignore: non_constant_identifier_names
Country CountryFromJson(String str) => Country.fromJson(json.decode(str));

// ignore: non_constant_identifier_names
String CountryToJson(Country data) => json.encode(data.toJson());

class Country {
  Country({
    required this.name,
    required this.id,
    required this.latitude,
    required this.longitude,
    required this.altitude,
    required this.velociy,
    required this.visibility,
    required this.footprint,
    required this.timestamp,
    required this.daynum,
    required this.solar_lat,
    required this.solar_lon,
    required this.units,
  });

  String name;
      String id;
  String latitude;
      String longitude;
      String altitude;
  String velociy;
      String visibility;
  String footprint;
      String timestamp;
  String daynum;
      String solar_lat;
  String solar_lon;
      String units;

  factory Country.fromJson(Map<String, dynamic> json) => Country(
    name: json["title"],
    id: json["description"],
    latitude: json["category"],
    longitude: json["project_name"],
    altitude: json["user"],
    velociy: json["manday"],
    visibility: json["activity_date"],
    footprint: json["activity_end_date"],
    timestamp: json["activity_end_date"],
    daynum: json["activity_end_date"],
    solar_lat: json["activity_end_date"],
    solar_lon: json["activity_end_date"],
    units: json["activity_end_date"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "id": id,
    "latitude": latitude,
    "longitude": longitude,
    "altitude": altitude,
    "velocity": velociy,
    "visibility": visibility,
    "footprint": footprint,
    "timestamp": timestamp,
    "daynum": daynum,
    "solar_lat": solar_lat,
    "solar_lon": solar_lon,
    "units": units,
  };
}


// ignore: non_constant_identifier_names
ErrorCreateCountry ErrorCountryFromJson(String str) => ErrorCreateCountry.fromJson(json.decode(str));
// ignore: non_constant_identifier_names
String ErrorCountryToJson(ErrorCreateCountry data) => json.encode(data.toJson());

class ErrorCreateCountry{
  bool success;
  String message;
  Data data;

  ErrorCreateCountry({required this.success, required this.message, required this.data});

  ErrorCreateCountry.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  Error error;

  Data({this.error});

  Data.fromJson(Map<String, dynamic> json) {
    error = json['error'] != null ? new Error.fromJson(json['error']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.error != null) {
      data['error'] = this.error.toJson();
    }
    return data;
  }
}

class Error {
  List<String> errorInfo;

  Error({required this.errorInfo});

  Error.fromJson(Map<String, dynamic> json) {
    errorInfo = json['errorInfo'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['errorInfo'] = this.errorInfo;
    return data;
  }
}


