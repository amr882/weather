import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_services.dart';
import 'package:weather_app/widget/weather_details.dart';

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
        print(weatherData);
      });
    } catch (e) {
      print(e);
    }
  }

  // String getCurrentDate() {
  //   DateTime now = DateTime.now();
  //   return "${now.hour}:${now.minute}- ${DateFormat('EEEE').format(now)}";
  // }

  String _currentTime = "";
  late Timer _timer;

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  String getCurrentTime() {
    DateTime now = DateTime.now();
    return "${now.hour}:${now.minute}- ${DateFormat('EEEE').format(now)}";
  }

  @override
  void initState() {
    getWeatherData();
    _currentTime = getCurrentTime();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _currentTime = getCurrentTime();
      });
    });
    super.initState();
  }

  String getWeather(String? mainCondition) {
    if (mainCondition == null) {
      return "assets/sunny.json";
    }
    switch (weatherModel!.state) {
      case "Partly cloudy":
      case "Cloudy":
      case "Overcast":
      case "Mist":
      case "Patchy rain possible":
      case "Fog":
        return "assets/cloudy.json";
      case "Patchy light rain":
      case "Moderate rain at times":
      case "Light rain":
      case "Heavy rain at times":
      case "Heavy rain":
        return "assets/rain.json";
      case "Thundery outbreaks possible":
      case "Patchy light rain with thunder":
      case "Moderate or heavy rain with thunder":
      case "Patchy light snow with thunder":
      case "Moderate or heavy snow with thunder":
        return "assets/thunder.json";
      default:
        return "assets/sunny.json";
    }
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
                padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 7.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              'Weather',
                              style: GoogleFonts.rubik(
                                  color: Colors.white,
                                  fontSize: 3.h,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        Text(
                            "${weatherModel?.country.toString()}, ${weatherModel?.city.toString()}",
                            style: GoogleFonts.rubik(
                                color: Colors.white, fontSize: 2.h)),
                        Text(
                          _currentTime,
                          style: GoogleFonts.rubik(
                              color: Colors.white,
                              fontSize: 2.h,
                              fontWeight: FontWeight.w300),
                        ),
                        Lottie.asset(
                            getWeather(
                              weatherModel?.state,
                            ),
                            height: 25.h),
                        Text(
                          "${weatherModel?.temp.round()} °C",
                          style: GoogleFonts.rubik(
                              color: Colors.white,
                              fontSize: 4.h,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "${weatherModel?.state}",
                          style: GoogleFonts.rubik(
                              color: Colors.white,
                              fontSize: 2.h,
                              fontWeight: FontWeight.w300),
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        WeatherDetails(
                          cloud: weatherModel!.cloud,
                          humidity: weatherModel!.humidity,
                          windSpeed: weatherModel!.windSpeed,
                        ),
                      ],
                    ),
                    Text("By: Amr Fadel",
                        style: GoogleFonts.rubik(
                            color: Colors.white, fontSize: 2.h))
                  ],
                ),
              ),
      ),
    );
  }
}
