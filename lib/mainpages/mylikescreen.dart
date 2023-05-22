// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:hanriver_now/mainpages/widgetpages/topwidget.dart';
import 'package:hanriver_now/mainpages/widgetpages/bigicon.dart';
import 'package:hanriver_now/mainpages/showgridscreen.dart';
import 'package:flutter/services.dart';
import 'package:ntp/ntp.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:xml2json/xml2json.dart';

class MyLikeScreen extends StatefulWidget {
  int number;
  MyLikeScreen({super.key, this.number = 0});
  @override
  _MyLikeScreenState createState() => _MyLikeScreenState();
}

class AreaInfo {
  String areaName;
  String contentid;
  String number;

  AreaInfo(this.areaName, this.contentid, this.number);
}

AreaInfo gwangnaru = AreaInfo("광나루", "250252", "1");
AreaInfo gangseo = AreaInfo("강서", "2733968", "10");
AreaInfo jamsil = AreaInfo("잠실", "970460", "2");
AreaInfo ttukseom = AreaInfo("뚝섬", "1030763", "3");
AreaInfo jamwon = AreaInfo("잠원", "970342", "4");
AreaInfo ichon = AreaInfo("이촌", "970636", "6");
AreaInfo banpo = AreaInfo("반포", "2763875", "5");
AreaInfo mangwon = AreaInfo("망원", "1059638", "7");
AreaInfo yeouido = AreaInfo("여의도", "1059479", "8");
AreaInfo nanji = AreaInfo("난지", "127859", "9");
AreaInfo yanghwa = AreaInfo("양화", "1059877", "11");

class _MyLikeScreenState extends State<MyLikeScreen> {
  var dt = DateTime.now();
  Future<DateTime> DateTimeNow() async {
    DateTime _myTime;
    _myTime = await NTP.now();
    _myTime = _myTime.toUtc().add(Duration(hours: 9));

    return _myTime;
  }

  void MapPop() {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            // RoundedRectangleBorder - Dialog 화면 모서리 둥글게 조절
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            //Dialog Main Title
            title: Column(
              children: <Widget>[
                Text(
                  "현재 개발중입니다.",
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
            actions: <Widget>[
              TextButton(
                child: Text(
                  "확인",
                  style: TextStyle(fontSize: 15),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }

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

    Widget HomePage(double appwidth, String nightday) {
      return Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Column(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    TopWidget(),
                    SizedBox(height: 20),
                    BigWidget(gwangnaru, nightday),
                    BigWidget(gangseo, nightday),
                    BigWidget(jamsil, nightday),
                    BigWidget(ttukseom, nightday),
                    BigWidget(jamwon, nightday),
                    BigWidget(ichon, nightday),
                    BigWidget(banpo, nightday),
                    BigWidget(mangwon, nightday),
                    BigWidget(yeouido, nightday),
                    BigWidget(nanji, nightday),
                    BigWidget(yanghwa, nightday),
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
                      onPressed: () => MapPop(),
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
                            return ShowGridScreen();
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
      );
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
                  padding: EdgeInsets.only(top: 15),
                  child: Text(
                    '한강은 지금',
                    style: TextStyle(
                        fontFamily: 'KCC-Chassam',
                        fontSize: 25,
                        color: Colors.black),
                  ),
                ),
              ],
            ),
            centerTitle: true,
            backgroundColor: Color.fromARGB(255, 249, 248, 253),
            elevation: 0.0,
          ),
          body: FutureBuilder(
            future: DateTimeNow(),
            builder: (context, snapshot) {
              Future<http.Response> fetchPost(String yyyymmdd) async {
                var url = Uri.parse(
                    'https://apis.data.go.kr/B090041/openapi/service/RiseSetInfoService/getAreaRiseSetInfo?serviceKey=GY4ctA033jjd9iwNhcz3adE9fBXYGUYEDxLG9RMIE68Cg3jCD2hRgxgblKO9TBUSNcxK5NU6lPL%2BM3D3Grk23Q%3D%3D&locdate=${yyyymmdd}&location=%EC%84%9C%EC%9A%B8');
                var response = await http.get(url);
                return response;
              }

              if (snapshot.hasData) {
                var timeM = snapshot.data!.hour * 60 + snapshot.data!.minute;
                var time = snapshot.data!.hour.toString() +
                    snapshot.data!.minute.toString();
                var yyyymmdd = "";
                if (snapshot.data!.month < 10) {
                  yyyymmdd =
                      "${snapshot.data!.year}0${snapshot.data!.month}${snapshot.data!.day}";
                } else {
                  yyyymmdd =
                      "${snapshot.data!.year}${snapshot.data!.month}${snapshot.data!.day}";
                }
                return FutureBuilder(
                  future: fetchPost(yyyymmdd),
                  builder: (context, snapshot1) {
                    if (snapshot1.hasData) {
                      final getXmlData = snapshot1.data!.body;
                      final xml = Xml2Json()..parse(getXmlData);
                      final jsonData = xml.toParker();

                      var data = jsonDecode(jsonData);
                      var sunrise =
                          data['response']['body']['items']['item']['sunrise'];
                      var sunset =
                          data['response']['body']['items']['item']['sunset'];
                      if (int.parse(time) < int.parse(sunset) &&
                          int.parse(time) > int.parse(sunrise)) {
                        var nightday = "낮";
                        return HomePage(appwidth, nightday);
                      } else {
                        var nightday = "밤";
                        return HomePage(appwidth, nightday);
                      }
                    } else {
                      var nightday = "";
                      return HomePage(appwidth, nightday);
                    }
                  },
                );
              } else {
                var nightday = "";
                return HomePage(appwidth, nightday);
              }
            },
          )),
    );
  }
}
