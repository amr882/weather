import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class Cloud extends StatelessWidget {
  final int cloud;
  const Cloud({super.key, required this.cloud});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.cloud,
          color: Colors.white,
          size: 5.h,
        ),
        SizedBox(
          width: 2.w,
        ),
        Text(
          "$cloud%",
          style: GoogleFonts.rubik(color: Colors.white, fontSize: 2.h),
        )
      ],
    );
  }
}
