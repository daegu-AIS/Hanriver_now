// ignore_for_file: sort_child_properties_last

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:xml2json/xml2json.dart';
import 'package:hanriver_now/areapages/areapage.dart';
import 'package:hanriver_now/mainpages/widgetpages/topwidget.dart';
// import 'package:hanriver_now/mainpages/widgetpages/smallicon.dart';
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
  String nightview;

  AreaInfo(this.areaName, this.contentid, this.nightview);
}

AreaInfo gwangnaru = AreaInfo("광나루", "250252", "assets/images/뚝섬한강공원.jpg");
AreaInfo gangseo = AreaInfo("강서", "2733968", "assets/images/뚝섬한강공원.jpg");
AreaInfo jamsil = AreaInfo("잠실", "970460", "assets/images/뚝섬한강공원.jpg");
AreaInfo ttukseom = AreaInfo("뚝섬", "1030763", "assets/images/뚝섬한강공원.jpg");
AreaInfo jamwon = AreaInfo("잠원", "970342", "assets/images/잠원한강공원야경.jpg");
AreaInfo ichon = AreaInfo("이촌", "970636", "assets/images/뚝섬한강공원.jpg");
AreaInfo banpo = AreaInfo("반포", "2763875", "assets/images/반포한강공원.jpg");
AreaInfo mangwon = AreaInfo("망원", "1059638", "assets/images/뚝섬한강공원.jpg");
AreaInfo yeouido = AreaInfo("여의도", "1059479", "assets/images/여의도한강공원야경.jpg");
AreaInfo nanji = AreaInfo("난지", "127859", "assets/images/난지한강공원야경.jpg");
AreaInfo yanghwa = AreaInfo("양화", "1059877", "assets/images/뚝섬한강공원.jpg");

class _MyLikeScreenState extends State<MyLikeScreen> {
  Widget SmallWidget(AreaInfo areaInfo, double smailmargin, double appwidth) {
    return Container(
      height: appwidth * 0.14,
      width: appwidth * 0.14,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: Image.asset(areaInfo.nightview).image,
          fit: BoxFit.fitHeight,
        ),
      ),
      margin: EdgeInsets.only(left: smailmargin),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            areaInfo.areaName,
            style:
                TextStyle(color: Colors.white, fontSize: appwidth * 0.14 * 0.5),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

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
            Row(
              children: [
                Container(
                  color: Color.fromARGB(255, 249, 248, 253),
                  width: 25,
                ),
                Container(
                  color: Color.fromARGB(255, 249, 248, 253),
                  width: appwidth - 50,
                  child: Container(
                    margin: EdgeInsets.only(top: 20, bottom: 20),
                    child: ScrollConfiguration(
                        behavior:
                            const ScrollBehavior().copyWith(overscroll: false),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(children: [
                            SmallWidget(gwangnaru, 0, appwidth),
                            SmallWidget(gangseo, 20, appwidth),
                            SmallWidget(jamsil, 20, appwidth),
                            SmallWidget(ttukseom, 20, appwidth),
                            SmallWidget(jamwon, 20, appwidth),
                            SmallWidget(ichon, 20, appwidth),
                            SmallWidget(banpo, 20, appwidth),
                            SmallWidget(mangwon, 20, appwidth),
                            SmallWidget(yeouido, 20, appwidth),
                            SmallWidget(nanji, 20, appwidth),
                            SmallWidget(yanghwa, 20, appwidth),
                          ]),
                        )),
                  ),
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
