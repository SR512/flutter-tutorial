import 'package:flutter/material.dart';
import 'package:flutter_tutorial/bindings/first_bindings.dart';
import 'package:flutter_tutorial/views/first_page.dart';
import 'package:flutter_tutorial/views/second_page.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter tutorial',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      getPages: [
        GetPage(name: '/first-page', page: () => const FirstPage(),binding:FirstBindings()),
        GetPage(name: '/second-page', page: () => const SecondPage()),
      ],
      initialRoute: '/first-page',
    );
  }
}
