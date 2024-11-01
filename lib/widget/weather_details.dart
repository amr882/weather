import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:weather_app/widget/cloud.dart';
import 'package:weather_app/widget/humidity.dart';
import 'package:weather_app/widget/wind.dart';

class WeatherDetails extends StatelessWidget {
  final int cloud;
  final int humidity;
  final double windSpeed;
  const WeatherDetails(
      {super.key,
      required this.cloud,
      required this.humidity,
      required this.windSpeed});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      width: 95.w,
      height: 13.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: const LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color.fromARGB(255, 87, 89, 95),
              Color(0xff28292e),
              Color(0xff38393e),
            ],
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Cloud(
            cloud: cloud,
          ),
          Humidity(
            humidity: humidity,
          ),
          WindSpeed(
            windSpeed: windSpeed,
          ),
        ],
      ),
    );
  }
}
