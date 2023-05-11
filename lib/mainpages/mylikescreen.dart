// ignore_for_file: sort_child_properties_last

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:xml2json/xml2json.dart';
import 'package:hanriver_now/areapages/areapage.dart';
import 'package:hanriver_now/mainpages/widgetpages/topwidget.dart';
import 'package:hanriver_now/mainpages/widgetpages/bigicon.dart';
import 'package:hanriver_now/areapages/overview.dart';

class MyLikeScreen extends StatefulWidget {
  int number;
  MyLikeScreen({super.key, this.number = 0});
  @override
  _MyLikeScreenState createState() => _MyLikeScreenState();
}

class AreaInfo {
  String areaName;
  String contentid;
  String nightview;

  AreaInfo(this.areaName, this.contentid, this.nightview);

  get areaId => null;
}

AreaInfo gwangnaru = AreaInfo("광나루", "250252", "assets/images/뚝섬한강공원.webp");
AreaInfo gangseo = AreaInfo("강서", "2733968", "assets/images/뚝섬한강공원.webp");
AreaInfo jamsil = AreaInfo("잠실", "970460", "assets/images/뚝섬한강공원.webp");
AreaInfo ttukseom = AreaInfo("뚝섬", "1030763", "assets/images/뚝섬한강공원.webp");
AreaInfo jamwon = AreaInfo("잠원", "970342", "assets/images/잠원한강공원야경.webp");
AreaInfo ichon = AreaInfo("이촌", "970636", "assets/images/뚝섬한강공원.webp");
AreaInfo banpo = AreaInfo("반포", "2763875", "assets/images/반포한강공원.webp");
AreaInfo mangwon = AreaInfo("망원", "1059638", "assets/images/뚝섬한강공원.webp");
AreaInfo yeouido = AreaInfo("여의도", "1059479", "assets/images/여의도한강공원야경.webp");
AreaInfo nanji = AreaInfo("난지", "127859", "assets/images/난지한강공원야경.webp");
AreaInfo yanghwa = AreaInfo("양화", "1059877", "assets/images/뚝섬한강공원.webp");

List AreaList = [
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

class _MyLikeScreenState extends State<MyLikeScreen> {
  var dt = DateTime.now();

  @override
  build(BuildContext context) {
    final appheight = MediaQuery.of(context).size.height;
    final appwidth = MediaQuery.of(context).size.width;
    print(dt);
    return ListView(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 반가워요! 컨테이너
            TopWidget(),
            Row(
              children: [
                Container(
                  color: Color.fromARGB(255, 249, 248, 253),
                  width: 25,
                ),
                Container(
                  color: Color.fromARGB(255, 249, 248, 253),
                  width: appwidth - 50,
                  height: 100,
                ),
                Container(
                  color: Color.fromARGB(255, 249, 248, 253),
                  width: 25,
                ),
              ],
            ),
            // 작은 아이콘 컨테이너
          ],
        ),
        BigWidget(gwangnaru),
        BigWidget(gangseo),
        BigWidget(jamsil),
        BigWidget(ttukseom),
        BigWidget(jamwon),
        BigWidget(ichon),
        BigWidget(banpo),
        BigWidget(mangwon),
        BigWidget(yeouido),
        BigWidget(nanji),
        BigWidget(yanghwa),
      ],
    );
  }
}
