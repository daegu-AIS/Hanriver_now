import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hanriver_now/mainpage.dart';
import 'package:hanriver_now/mainpages/mylikescreen.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  void initState() {
    Timer(Duration(seconds: 2), () {
      Get.offAll(MainPage());
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
          child: Image.asset('assets/images/인트로_AdobeExpress.gif',
              fit: BoxFit.cover),
        ),
      ],
    ));
  }
}
