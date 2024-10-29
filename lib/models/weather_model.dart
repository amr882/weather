class WeatherModel {
  final double temp;
  final String state;
  final String city;
  final String conditionImage;
  WeatherModel({
    required this.city,
    required this.state,
    required this.temp,
    required this.conditionImage,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
        city: json["location"]["name"],
        temp: json["current"]["temp_c"],
        state: json["current"]["condition"]["text"],
        conditionImage: json["current"]["condition"]["icon"]);
  }
}
