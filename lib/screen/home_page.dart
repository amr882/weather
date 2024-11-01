import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLoading = true;
  WeatherModel? weatherModel;
  getWeatherData() async {
    String city = await WeatherServices.getCity();
    try {
      final weatherData = await WeatherServices.getWeather(city);
      setState(() {
        weatherModel = weatherData;
        isLoading = false;
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
    return Container(
      alignment: Alignment.topCenter,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        colors: [
          Color.fromARGB(255, 87, 89, 95),
          Color(0xff28292e),
          Color(0xff38393e),
        ],
      )),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 7.h),
                child: Column(
                  children: [
                    Text(
                      'Weather',
                      style: GoogleFonts.rubik(
                          color: Colors.white, fontSize: 3.h),
                    )
                  ],
                ),
              ),
      ),
    );
  }
}




                  // Text(
                  //   weatherModel?.city.toString() ?? "city...",
                  //   style: const TextStyle(fontSize: 50),
                  // ),
                  // Text(
                  //   "${weatherModel?.state}",
                  //   style: const TextStyle(fontSize: 50),
                  // ),
                  // Text(
                  //   "${weatherModel?.temp.round()}°C",
                  //   style: const TextStyle(fontSize: 50),
                  // ),
