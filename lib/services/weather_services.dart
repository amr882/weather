import 'dart:convert';

import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/models/weather_model.dart';

class WeatherServices {
  static String url = "https://api.weatherapi.com/v1/current.json?key=";
  static String api = "086c91c57e654d5f9b421025241402";

//https://api.weatherapi.com/v1/current.json?key=086c91c57e654d5f9b421025241402&q=egypt&aqi=no

  static Future<WeatherModel> getWeather(String city) async {
    final response = await http.get(Uri.parse("$url$api&q=$city&aqi=no"));

    if (response.statusCode == 200) {
      return WeatherModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("error getting weather data");
    }
  }

  static Future<String> getCity() async {
    LocationPermission permission;

    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    List<Placemark> placemark =
        await placemarkFromCoordinates(position.latitude, position.longitude);

    String? city = placemark[0].country;
    print(city);

    return city ?? "";
  }
}
