import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTexts {
  AppTexts._();

// Heading

  static TextStyle title = GoogleFonts.ibmPlexSans(
    fontSize: 20.sp,
    color: Colors.black,
    fontWeight: FontWeight.bold,
  );

  static TextStyle heading = GoogleFonts.ibmPlexSans(
    fontSize: 14.sp,
    color: Colors.black,
    fontWeight: FontWeight.w600,
  );

  static TextStyle subHeading = GoogleFonts.ibmPlexSans(
    fontSize: 12.sp,
    color: Colors.black,
    fontWeight: FontWeight.w500,
  );

// body

  static TextStyle regular = GoogleFonts.ibmPlexSans(
    fontSize: 14.sp,
    color: Colors.black,
    fontWeight: FontWeight.normal,
  );

  static TextStyle paragraph = GoogleFonts.ibmPlexSans(
    fontSize: 12.sp,
    color: Colors.black,
    fontWeight: FontWeight.normal,
  );
}
