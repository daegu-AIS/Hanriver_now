import 'dart:async';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hanriver_now/mainpages/mylikescreen.dart';

class LandingPage extends StatefulWidget {
  int time = 2;

  LandingPage(this.time);
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  void initState() {
    Timer(Duration(seconds: widget.time), () {
      Get.offAll(MyLikeScreen());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const String apiUrl =
        'http://openapi.seoul.go.kr:8088/776a6b515877686438366d4b4b5847/xml/citydata/1/5/'; //
    return FutureBuilder(
      future: http.get(Uri.parse('$apiUrl남산공원')),
      builder: ((context, snapshot) {
        if (snapshot.hasData) {
          return Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Image.asset('assets/images/인트로_AdobeExpress.gif',
                    fit: BoxFit.fitHeight),
              ),
            ],
          );
        }
        return Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Image.asset('assets/images/인트로_AdobeExpress.gif',
                  fit: BoxFit.fitHeight),
            ),
          ],
        );
      }),
    );
  }
}
