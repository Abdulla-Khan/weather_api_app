import 'dart:convert';

import 'package:http/http.dart' as http;

import 'weather_locations.dart';

class WeatherApi {
  Future<Weathers> getCurrent(String location) async {
    var end = Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?q=$location&appid=426e7ff9ecfb1ed70777cd2a6ee94ec1"
        // 'https://api.openweathermap.org/data/2.5/weather?q=$location&appid=7ab0c91dec063f7e6a405b40e76f54be'
        );
    var response = await http.get(end);
    var data = jsonDecode(response.body);
    return Weathers.fromJson(data);
  }
}
