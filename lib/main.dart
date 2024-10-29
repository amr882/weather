import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  WeatherModel? weatherModel;
  getWeatherData() async {
    String city = await WeatherServices.getCity();
    try {
      final weatherData = await WeatherServices.getWeather(city);
      setState(() {
        weatherModel = weatherData;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    getWeatherData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Weather app"),
        backgroundColor: const Color.fromARGB(255, 5, 194, 184),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                weatherModel?.city.toString() ?? "city...",
                style: const TextStyle(fontSize: 50),
              ),
               Text(
               "${weatherModel?.state}",
                style: const TextStyle(fontSize: 50),
              ),
              Text(
                "${weatherModel?.temp.round()}°C",
                style: const TextStyle(fontSize: 50),
              ),
           
            ],
          ),
        ],
      ),
    );
  }
}
