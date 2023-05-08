import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hanriver_now/mainpage.dart';
import 'package:hanriver_now/mainpages/mylikescreen.dart';
import 'package:hanriver_now/areapages/areapage.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  void initState() {
    Timer(Duration(seconds: 5), () {
      Get.offAll(AreaPage('망원한강공원', '1059638'));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Image.asset('assets/images/splash.png', fit: BoxFit.cover),
        ),
      ],
    ));
  }
}
