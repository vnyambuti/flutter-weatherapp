class WeatherDescription {
  final String description;
  final String icon;
  WeatherDescription({required this.description, required this.icon});

  factory WeatherDescription.fromJson(Map<String, dynamic> json) {
    final description = json['description'];
    final icon = json['icon'];
    return WeatherDescription(description: description, icon: icon);
  }
}

class TempInfo {
  final double temp;

  TempInfo({required this.temp});

  factory TempInfo.fromJson(Map<String, dynamic> json) {
    final temp = json['temp'];
    return TempInfo(temp: temp);
  }
}

class WeatherData {
  final String CityName;
  final TempInfo temperature;
  final WeatherDescription weatherinfo;
  String get getIconurl {
    return 'https://openweathermap.org/img/wn/${weatherinfo.icon}@2x.png';
  }

  WeatherData(
      {required this.CityName,
      required this.temperature,
      required this.weatherinfo});

  factory WeatherData.fromJson(Map<String, dynamic> json) {
    final weatherInfojson = json['weather'][0];
    final weatherinfo = WeatherDescription.fromJson(weatherInfojson);
    final tempInfoJson = json['main'];
    final temperature = TempInfo.fromJson(tempInfoJson);
    final CityName = json['name'];

    return WeatherData(
        CityName: CityName, temperature: temperature, weatherinfo: weatherinfo);
  }
}
