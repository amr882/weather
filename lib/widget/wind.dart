import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class WindSpeed extends StatelessWidget {
  final double windSpeed;
  const WindSpeed({super.key, required this.windSpeed});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.air_rounded,
          color: Colors.white,
          size: 5.h,
        ),
        Text(
          "$windSpeed\n KM/H",
          style: GoogleFonts.rubik(color: Colors.white, fontSize: 2.h),
        )
      ],
    );
  }
}
