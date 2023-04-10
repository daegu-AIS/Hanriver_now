import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hanriver_now/landingpage.dart';
import 'package:hanriver_now/mainpage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application. gdgdgdgd1321321321
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        fontFamily: 'EastSeaDokdo',
      ),
      home: MainPage(),
    );
  }
}
