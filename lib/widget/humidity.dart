import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class Humidity extends StatelessWidget {
  final int humidity;
  const Humidity({super.key, required this.humidity});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.water_drop_outlined,
          color: Colors.white,
          size: 5.h,
        ),
        SizedBox(
          width: 2.w,
        ),
        Text(
          "$humidity%",
          style: GoogleFonts.rubik(color: Colors.white, fontSize: 2.h),
        )
      ],
    );
  }
}
