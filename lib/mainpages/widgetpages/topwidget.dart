import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:xml2json/xml2json.dart';

class TopWidget extends StatefulWidget {
  @override
  _TopWidget createState() => _TopWidget();
}

class _TopWidget extends State<TopWidget> {
  late Future myFuture;

  Widget SmallWeathertitle(double appheight, double appwidth, String text) {
    return Container(
      width: appwidth * 0.25,
      height: appheight <= 500 ? 20 : appheight * 0.035,
      alignment: Alignment.center,
      // color: Colors.red,
      child: Text(
        text,
        style: TextStyle(
            color: Colors.white,
            fontSize: appwidth < 480
                ? appwidth <= 390
                    ? appwidth <= 340
                        ? 10
                        : 12
                    : 14
                : 17),
      ),
    );
  }

  Widget SmallWeatherdetail(double appheight, double appwidth, String text) {
    return Container(
      width: appwidth * 0.175,
      height: appheight <= 500 ? 20 : appheight * 0.035,
      alignment: Alignment.center,
      // color: Colors.red,
      child: Text(
        text,
        style: TextStyle(
            color: Colors.yellow,
            fontSize: appwidth < 480
                ? appwidth <= 390
                    ? appwidth <= 340
                        ? 9
                        : 11
                    : 13
                : 17),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final appheight = MediaQuery.of(context).size.height;
    final appwidth = MediaQuery.of(context).size.width;
    const String apiUrl =
        'http://openapi.seoul.go.kr:8088/776a6b515877686438366d4b4b5847/xml/citydata/1/5/';

    return FutureBuilder(
      future: http.get(Uri.parse('$apiUrl남산공원')),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final getXmlData = snapshot.data!.body;
          final xml = Xml2Json()..parse(getXmlData);
          final jsonData = xml.toParker();
          var data = jsonDecode(jsonData);
          var weatherdata = data["SeoulRtd.citydata"]["CITYDATA"]
              ["WEATHER_STTS"]["WEATHER_STTS"];
          var fcstdata = data["SeoulRtd.citydata"]["CITYDATA"]["WEATHER_STTS"]
              ["WEATHER_STTS"]["FCST24HOURS"]["FCST24HOURS"][0];
          return Center(
            child: Container(
              // color: Colors.amber,
              margin: EdgeInsets.only(top: appheight * 0.04),
              constraints: BoxConstraints(minHeight: 150),
              height: appheight * 0.18,
              width: appwidth * 0.85,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Color.fromRGBO(83, 51, 204, 1),
                  boxShadow: [
                    BoxShadow(color: Colors.grey, blurRadius: 10),
                  ]),
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                SizedBox(
                  height: 90,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Container(
                            width: appwidth * 0.3,
                            // height: appheight * 0.09,
                            padding: EdgeInsets.only(
                                left: appwidth * 0.03, top: appheight * 0.01),
                            // color: Colors.red,
                            child: Text(
                              '서울은 지금',
                              style: TextStyle(
                                  fontSize: appwidth < 300 ? 11 : 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                          Container(
                            width: appwidth * 0.3,
                            // height: appheight * 0.09,
                            padding: EdgeInsets.only(
                                left: appwidth * 0.03, top: appheight * 0.01),
                            alignment: Alignment.centerLeft,
                            // color: Colors.red,
                            child: Text(
                              '${weatherdata["TEMP"]}℃',
                              style: TextStyle(
                                  fontSize: appwidth < 300 ? 25 : 30,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            width: appwidth * 0.5,
                            // color: Colors.red,
                            padding: EdgeInsets.only(
                                top: appheight * 0.01, right: appwidth * 0.03),
                            alignment: Alignment.centerRight,
                            child: Icon(Icons.sunny,
                                color: Colors.white,
                                size: appwidth < 300 ? 15 : 18),
                          ),
                          Container(
                            width: appwidth * 0.5,
                            // height: appheight * 0.09,
                            padding: EdgeInsets.only(
                                right: appwidth * 0.03, top: appheight * 0.005),
                            alignment: Alignment.topRight,
                            // color: Colors.red,
                            child: Text(
                              '${fcstdata["SKY_STTS"]}',
                              style: TextStyle(
                                fontSize: appwidth < 300 ? 14 : 17,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Container(
                            width: appwidth * 0.5,
                            // height: appheight * 0.09,
                            padding: EdgeInsets.only(
                                right: appwidth * 0.03, top: appheight * 0.005),
                            alignment: Alignment.topRight,
                            // color: Colors.red,
                            child: Text(
                              '최고 ${weatherdata["MAX_TEMP"]}℃ 최저 ${weatherdata["MIN_TEMP"]}℃',
                              style: TextStyle(
                                fontSize: appwidth < 300 ? 13 : 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                    child: Container(
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(158, 133, 255, 1.0),
                            // color: Colors.red,
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(15),
                                bottomRight: Radius.circular(15))),
                        height: 10000,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Row(
                                  children: [
                                    SmallWeathertitle(
                                        appheight, appwidth, "자외선 지수"),
                                    SmallWeatherdetail(appheight, appwidth,
                                        "${weatherdata["UV_INDEX"]} (${weatherdata["UV_INDEX_LVL"]})"),
                                  ],
                                ),
                                Row(
                                  children: [
                                    SmallWeathertitle(
                                        appheight, appwidth, "미세먼지"),
                                    SmallWeatherdetail(appheight, appwidth,
                                        "${weatherdata["PM10_INDEX"]} (${weatherdata["PM10"]})"),
                                  ],
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Row(
                                  children: [
                                    SmallWeathertitle(
                                        appheight, appwidth, "강수량"),
                                    SmallWeatherdetail(appheight, appwidth,
                                        "${weatherdata["PRECIPITATION"]}"),
                                  ],
                                ),
                                Row(
                                  children: [
                                    SmallWeathertitle(
                                        appheight, appwidth, "초미세먼지"),
                                    SmallWeatherdetail(appheight, appwidth,
                                        "${weatherdata["PM25_INDEX"]} (${weatherdata["PM25"]})"),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ))),
              ]),
            ),
          );
        } else {
          return Center(
            child: Container(
              // color: Colors.amber,
              margin: EdgeInsets.only(top: appheight * 0.04),
              constraints: BoxConstraints(minHeight: 150),
              height: appheight * 0.18,
              width: appwidth * 0.85,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Color.fromRGBO(83, 51, 204, 1),
                  boxShadow: [
                    BoxShadow(color: Colors.grey, blurRadius: 10),
                  ]),
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                SizedBox(
                  height: 90,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Container(
                            width: appwidth * 0.3,
                            // height: appheight * 0.09,
                            padding: EdgeInsets.only(
                                left: appwidth * 0.03, top: appheight * 0.01),
                            // color: Colors.red,
                            child: Text(
                              '서울은 지금',
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                          Container(
                            width: appwidth * 0.3,
                            // height: appheight * 0.09,
                            padding: EdgeInsets.only(
                                left: appwidth * 0.03, top: appheight * 0.01),
                            alignment: Alignment.centerLeft,
                            // color: Colors.red,
                            child: Text(
                              '-',
                              style: TextStyle(
                                  fontSize: 33,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            width: appwidth * 0.5,
                            // color: Colors.red,
                            padding: EdgeInsets.only(
                                top: appheight * 0.01, right: appwidth * 0.03),
                            alignment: Alignment.centerRight,
                            child: Icon(Icons.sunny,
                                color: Colors.white, size: 18),
                          ),
                          Container(
                            width: appwidth * 0.5,
                            // height: appheight * 0.09,
                            padding: EdgeInsets.only(
                                right: appwidth * 0.03, top: appheight * 0.005),
                            alignment: Alignment.topRight,
                            // color: Colors.red,
                            child: Text(
                              '-',
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Container(
                            width: appwidth * 0.5,
                            // height: appheight * 0.09,
                            padding: EdgeInsets.only(
                                right: appwidth * 0.03, top: appheight * 0.005),
                            alignment: Alignment.topRight,
                            // color: Colors.red,
                            child: Text(
                              '-',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                    child: Container(
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(158, 133, 255, 1.0),
                            // color: Colors.red,
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(15),
                                bottomRight: Radius.circular(15))),
                        height: 10000,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Row(
                                  children: [
                                    SmallWeathertitle(
                                        appheight, appwidth, "자외선 지수"),
                                    SmallWeatherdetail(
                                        appheight, appwidth, "-"),
                                  ],
                                ),
                                Row(
                                  children: [
                                    SmallWeathertitle(
                                        appheight, appwidth, "미세먼지"),
                                    SmallWeatherdetail(
                                        appheight, appwidth, "-"),
                                  ],
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Row(
                                  children: [
                                    SmallWeathertitle(
                                        appheight, appwidth, "강수량"),
                                    SmallWeatherdetail(
                                        appheight, appwidth, "-"),
                                  ],
                                ),
                                Row(
                                  children: [
                                    SmallWeathertitle(
                                        appheight, appwidth, "초미세먼지"),
                                    SmallWeatherdetail(
                                        appheight, appwidth, "-"),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ))),
              ]),
            ),
          );
        }
      },
    );
  }
}
