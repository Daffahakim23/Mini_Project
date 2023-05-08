import 'package:flutter/material.dart';
import 'package:mini_project/Interface/style/colors_style.dart';
import 'package:google_fonts/google_fonts.dart';

class TextCustome {
  TextStyle title = GoogleFonts.poppins(
    fontWeight: FontWeight.w500,
    fontSize: 24,
    color: ColorStyle().white,
  );

  TextStyle subtitle = GoogleFonts.poppins(
    fontWeight: FontWeight.w600,
    fontSize: 20,
    color: ColorStyle().white,
  );

  TextStyle small = GoogleFonts.poppins(
    fontWeight: FontWeight.w400,
    fontSize: 14,
    color: ColorStyle().white,
  );

  TextStyle price = GoogleFonts.poppins(
    fontWeight: FontWeight.w600,
    fontSize: 16,
    color: ColorStyle().white,
  );
}
