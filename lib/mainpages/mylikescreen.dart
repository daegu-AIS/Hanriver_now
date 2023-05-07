// ignore_for_file: sort_child_properties_last

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:xml2json/xml2json.dart';
import 'package:hanriver_now/areapages/areapage.dart';
import 'package:hanriver_now/mainpages/widgetpages/topwidget.dart';
import 'package:hanriver_now/mainpages/widgetpages/smallicon.dart';
import 'package:hanriver_now/mainpages/widgetpages/bigicon.dart';

class MyLikeScreen extends StatefulWidget {
  int number;
  MyLikeScreen({this.number = 0});
  @override
  _MyLikeScreenState createState() => _MyLikeScreenState();
}

class AreaInfo {
  String areaName;
  String contentid;
  String areaImage;

  AreaInfo(this.areaName, this.contentid, this.areaImage);
}

AreaInfo gwangnaru = AreaInfo("광나루", "250252",
    "https://post-phinf.pstatic.net/MjAxODEwMTNfMjQz/MDAxNTM5NDExNTAyNzE5.rtxaX2XANrYDJm84nuMl4WiBO9QAatfsIL7iFL1aMwog.rIPjWS-O3RIIz1-ebXK3JaCbNPCmtLCzL0uZdEMNUvog.JPEG/wp_2379859171539411256555.jpg");
AreaInfo gangseo = AreaInfo("강서", "2733968",
    "http://tong.visitkorea.or.kr/cms2/website/66/2540166.jpg");
AreaInfo jamsil = AreaInfo(
    "잠실", "970460", "http://tong.visitkorea.or.kr/cms2/website/51/1465551.jpg");
AreaInfo ttukseom = AreaInfo("뚝섬", "1030763",
    "http://tong.visitkorea.or.kr/cms2/website/66/2540166.jpg");
AreaInfo jamwon = AreaInfo(
    "잠원", "970342", "http://tong.visitkorea.or.kr/cms2/website/51/1465551.jpg");
AreaInfo ichon = AreaInfo(
    "이촌", "970636", "http://tong.visitkorea.or.kr/cms2/website/66/2540166.jpg");
AreaInfo banpo = AreaInfo("반포", "2763875",
    "http://tong.visitkorea.or.kr/cms2/website/51/1465551.jpg");
AreaInfo mangwon = AreaInfo("망원", "1059638",
    "http://tong.visitkorea.or.kr/cms2/website/66/2540166.jpg");
AreaInfo yeouido = AreaInfo("여의도", "1059479",
    "http://tong.visitkorea.or.kr/cms2/website/51/1465551.jpg");
AreaInfo nanji = AreaInfo(
    "난지", "127859", "http://tong.visitkorea.or.kr/cms2/website/66/2540166.jpg");
AreaInfo yanghwa = AreaInfo("양화", "1059877",
    "http://tong.visitkorea.or.kr/cms2/website/51/1465551.jpg");

class _MyLikeScreenState extends State<MyLikeScreen> {
  List Areas = [
    gwangnaru,
    gangseo,
    jamsil,
    ttukseom,
    jamwon,
    ichon,
    banpo,
    mangwon,
    yeouido,
    nanji,
    yanghwa
  ];
  @override
  Widget build(BuildContext context) {
    final appheight = MediaQuery.of(context).size.height;
    final appwidth = MediaQuery.of(context).size.width;
    return ListView(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 반가워요! 컨테이너
            TopWidget(),

            // 작은 아이콘 컨테이너
            Container(
              color: Color.fromARGB(255, 249, 248, 253),
              width: appwidth,
              child: Container(
                margin:
                    EdgeInsets.only(top: 20, bottom: 20, left: 20, right: 20),
                child: ScrollConfiguration(
                    behavior:
                        const ScrollBehavior().copyWith(overscroll: false),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Container(
                        child: Row(children: [
                          SmallWidget(Areas[0].areaImage, 0, Areas[0].areaName),
                          SmallWidget(
                              Areas[1].areaImage, 20, Areas[1].areaName),
                          SmallWidget(
                              Areas[2].areaImage, 20, Areas[2].areaName),
                          SmallWidget(
                              Areas[3].areaImage, 20, Areas[3].areaName),
                          SmallWidget(
                              Areas[4].areaImage, 20, Areas[4].areaName),
                          SmallWidget(
                              Areas[5].areaImage, 20, Areas[5].areaName),
                          SmallWidget(
                              Areas[6].areaImage, 20, Areas[6].areaName),
                          SmallWidget(
                              Areas[7].areaImage, 20, Areas[7].areaName),
                          SmallWidget(
                              Areas[8].areaImage, 20, Areas[8].areaName),
                          SmallWidget(
                              Areas[9].areaImage, 20, Areas[9].areaName),
                          SmallWidget(
                              Areas[10].areaImage, 20, Areas[10].areaName),
                        ]),
                      ),
                    )),
              ),
            ),
          ],
        ),
        BigWidget(Areas[0]),
        BigWidget(Areas[1]),
        BigWidget(Areas[2]),
        BigWidget(Areas[3]),
        BigWidget(Areas[4]),
        BigWidget(Areas[5]),
        BigWidget(Areas[6]),
        BigWidget(Areas[7]),
        BigWidget(Areas[8]),
        BigWidget(Areas[9]),
        BigWidget(Areas[10]),
      ],
    );
  }
}
