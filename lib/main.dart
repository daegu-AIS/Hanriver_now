import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hanriver_now/landingpage.dart';
import 'package:hanriver_now/mainpage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        fontFamily: 'EastSeaDokdo',
        primaryColor: Color.fromARGB(255, 249, 248, 253),
        scaffoldBackgroundColor: Color.fromARGB(255, 249, 248, 253),
      ),
      home: LandingPage(),
    );
  }
}
