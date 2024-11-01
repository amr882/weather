class WeatherModel {
  final double temp;
  final String state;
  final String city;
  final int humidity;
  final double windSpeed;
  final String country;
  final int cloud;
  WeatherModel({
    required this.cloud,
    required this.humidity,
    required this.country,
    required this.windSpeed,
    required this.city,
    required this.state,
    required this.temp,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
        city: json["location"]["name"],
        temp: json["current"]["temp_c"],
        state: json["current"]["condition"]["text"],
        humidity: json["current"]["humidity"],
        windSpeed: json["current"]["wind_kph"],
        country: json["location"]["country"],
        cloud: json["current"]["cloud"]);
  }
}
