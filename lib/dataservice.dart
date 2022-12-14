import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:weatherapp/model.dart';

class DataService {
  getWeather(String city) async {
    final queryparams = {
      "q": city,
      "appid": "",
      "units": "metric"
    };
    final uri =
        Uri.https('api.openweathermap.org', '/data/2.5/weather', queryparams);
    final response = await http.get(uri);
    log(response.body);
    final json = jsonDecode(response.body);
    return WeatherData.fromJson(json);
  }
}
