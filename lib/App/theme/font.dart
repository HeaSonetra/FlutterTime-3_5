

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppFont{
  static String primaryFont='Poppins';

  static TextStyle title=GoogleFonts.getFont(
      primaryFont,
      fontWeight: FontWeight.bold,
      fontSize: 20,
  );
  static TextStyle subtitle=GoogleFonts.getFont(
      primaryFont,
      fontWeight: FontWeight.normal,
      fontSize: 18,
  );
}