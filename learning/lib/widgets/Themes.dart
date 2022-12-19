import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyThems {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
      primarySwatch: Colors.teal,
      fontFamily: GoogleFonts.poppins().fontFamily,
      appBarTheme: AppBarTheme(
          color: Colors.white,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.black),
          titleTextStyle: Theme.of(context).textTheme.titleLarge));

  static ThemeData darkTheme(BuildContext context) =>
      ThemeData(brightness: Brightness.light);

  // COLORS
  static Color creamColor = Color(0xfff5f5f5);
  static Color darkBluishColor = Color(0xff403b58);
}
