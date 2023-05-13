// ignore_for_file: sort_child_properties_last

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hanriver_now/areapages/gwangnaru.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:xml2json/xml2json.dart';
import 'package:hanriver_now/areapages/areapage.dart';
import 'package:hanriver_now/mainpages/widgetpages/topwidget.dart';
import 'package:hanriver_now/mainpages/widgetpages/bigicon.dart';
import 'package:hanriver_now/areapages/overview.dart';
import 'package:hanriver_now/mainpages/homescreen.dart';
import 'package:hanriver_now/mainpages/showgridscreen.dart';
import 'package:flutter/services.dart';

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
  String number;

  AreaInfo(this.areaName, this.contentid, this.nightview, this.number);

  get areaId => null;
}

AreaInfo gwangnaru =
    AreaInfo("광나루", "250252", "assets/images/광나루한강공원.webp", "1");
AreaInfo gangseo = AreaInfo("강서", "2733968", "assets/images/강서한강공원.webp", "10");
AreaInfo jamsil = AreaInfo("잠실", "970460", "assets/images/잠실한강공원.webp", "2");
AreaInfo ttukseom = AreaInfo("뚝섬", "1030763", "assets/images/뚝섬한강공원.webp", "3");
AreaInfo jamwon = AreaInfo("잠원", "970342", "assets/images/잠원한강공원야경.webp", "4");
AreaInfo ichon = AreaInfo("이촌", "970636", "assets/images/이촌한강공원.webp", "6");
AreaInfo banpo = AreaInfo("반포", "2763875", "assets/images/반포한강공원.webp", "5");
AreaInfo mangwon = AreaInfo("망원", "1059638", "assets/images/뚝섬한강공원.webp", "7");
AreaInfo yeouido =
    AreaInfo("여의도", "1059479", "assets/images/여의도한강공원야경.webp", "8");
AreaInfo nanji = AreaInfo("난지", "127859", "assets/images/난지한강공원야경.webp", "9");
AreaInfo yanghwa = AreaInfo("양화", "1059877", "assets/images/뚝섬한강공원.webp", "11");

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
    Future<bool> _onBackKey() async {
      return await showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('종료하시겠습니까?'),
              actions: <Widget>[
                TextButton(
                  child: Text(
                    '예',
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    SystemChannels.platform.invokeMethod('SystemNavigator.pop');
                    // Navigator.of(context).pop(true);
                  },
                ),
                TextButton(
                  child: Text(
                    '아니오',
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                ),
              ],
            );
          });
    }

    final appheight = MediaQuery.of(context).size.height;
    final appwidth = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: () {
        return _onBackKey();
      },
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 70,
          title: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Image.asset(
                'assets/images/title_icon.png',
                fit: BoxFit.cover,
                height: 50,
              ),
              Container(
                padding: EdgeInsets.only(top: 10),
                child: Text(
                  '한강은 지금',
                  style: TextStyle(
                      fontFamily: 'EastSeaDokdo',
                      fontSize: 40,
                      color: Colors.black),
                ),
              ),
            ],
          ),
          centerTitle: true,
          backgroundColor: Color.fromARGB(255, 249, 248, 253),
          elevation: 0.0,
        ),
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Column(
              children: [
                Expanded(
                  child: ListView(
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
                      SizedBox(height: 70),
                    ],
                  ),
                ),
              ],
            ),
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  height: 70,
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        icon: Icon(Icons.map),
                        onPressed: () {
                          // Get.toNamed('/mylike');
                        },
                      ),
                      SizedBox(
                        width: appwidth / 4,
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.info_outline,
                          size: 30,
                        ),
                        onPressed: () {
                          Navigator.push(context, PageRouteBuilder(
                            pageBuilder: (context, a, b) {
                              return OverView(gwangnaru);
                            },
                          ));
                        },
                      ),
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CircleAvatar(
                        radius: 40,
                        backgroundColor: Color.fromRGBO(255, 255, 255, 1),
                        child: CircleAvatar(
                            backgroundColor: Color.fromRGBO(168, 147, 255, 0.6),
                            radius: 35,
                            child: Icon(
                              Icons.home,
                              size: 30,
                              color: Colors.black,
                            ))),
                    Container(
                      height: 10,
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
