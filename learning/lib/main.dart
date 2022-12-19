import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learningapp/pages/cart_page.dart';
import 'package:learningapp/pages/home_detail.dart';
import 'package:learningapp/pages/home_page.dart';
import 'package:learningapp/pages/login_page.dart';
import 'package:learningapp/utils/routes.dart';
import 'package:learningapp/widgets/Themes.dart';

void main() {
  runApp(LearningApp());
}

class LearningApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme:MyThems.lightTheme(context),
      darkTheme:MyThems.darkTheme(context),
      initialRoute: '/home',
      routes: {
        Routes.home : (context) => HomePage(),
        Routes.login : (context) => LoginPage(),
        Routes.cart_page : (context) => CartPage(),
      },
    );
  }
}
