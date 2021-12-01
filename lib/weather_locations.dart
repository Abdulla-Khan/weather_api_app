class Weathers {
  String? cityname;
  double? temp;
  int? humidity;
  double? wind;
  int? rain;
  double? feel;

  Weathers({
    this.feel,
    this.cityname,
    this.wind,
    this.humidity,
    this.temp,
    this.rain,
  });

  Weathers.fromJson(Map<String, dynamic> json) {
    cityname = json['name'];
    temp = json['main']['temp'];
    humidity = json['main']['humidity'];
    wind = json['wind']['speed'];
    rain = json['clouds']['all'];
    feel = json['main']['feels_like'];
  }
}
