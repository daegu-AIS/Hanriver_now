import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:ntp/ntp.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:xml2json/xml2json.dart';

class TopWidget extends StatefulWidget {
  @override
  _TopWidget createState() => _TopWidget();
}

class _TopWidget extends State<TopWidget> {
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
                  height: appheight * 0.105,
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
                                  fontSize: appwidth * 0.03,
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
                                  fontSize: appwidth * 0.08,
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
                                color: Colors.white, size: appwidth * 0.045),
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
                                fontSize: appwidth * 0.04,
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
                                fontSize: appwidth * 0.035,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: appheight * 0.008,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                    child: Container(
                        padding: EdgeInsets.only(top: appheight * 0.003),
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(158, 133, 255, 1.0),
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(15),
                                bottomRight: Radius.circular(15))),
                        height: 100000,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      width: appwidth * 0.25,
                                      height: appheight * 0.035,
                                      alignment: Alignment.center,
                                      // color: Colors.red,
                                      child: Text(
                                        "자외선 지수",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: appwidth * 0.04,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: appwidth * 0.175,
                                      height: appheight * 0.035,
                                      alignment: Alignment.center,
                                      // color: Colors.red,
                                      child: Text(
                                        "${weatherdata["UV_INDEX"]} (${weatherdata["UV_INDEX_LVL"]})",
                                        style: TextStyle(
                                          color: Colors.yellow,
                                          fontSize: appwidth * 0.035,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                      width: appwidth * 0.25,
                                      height: appheight * 0.035,
                                      alignment: Alignment.center,
                                      // color: Colors.red,
                                      child: Text("미세먼지",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: appwidth * 0.04,
                                          )),
                                    ),
                                    Container(
                                      width: appwidth * 0.175,
                                      height: appheight * 0.035,
                                      alignment: Alignment.center,
                                      // color: Colors.red,
                                      child: Text(
                                          "${weatherdata["PM10_INDEX"]} (${weatherdata["PM10"]})",
                                          style: TextStyle(
                                            color: Colors.yellow,
                                            fontSize: appwidth * 0.035,
                                          )),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      width: appwidth * 0.25,
                                      height: appheight * 0.035,
                                      alignment: Alignment.center,
                                      // color: Colors.red,
                                      child: Text("강수량",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: appwidth * 0.04,
                                          )),
                                    ),
                                    Container(
                                      width: appwidth * 0.175,
                                      height: appheight * 0.035,
                                      alignment: Alignment.center,
                                      // color: Colors.red,
                                      child: Text(
                                          "${weatherdata["PRECIPITATION"]}",
                                          style: TextStyle(
                                            color: Colors.yellow,
                                            fontSize: appwidth * 0.035,
                                          )),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                      width: appwidth * 0.25,
                                      height: appheight * 0.035,
                                      alignment: Alignment.center,
                                      // color: Colors.red,
                                      child: Text("초미세먼지",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: appwidth * 0.04)),
                                    ),
                                    Container(
                                      width: appwidth * 0.175,
                                      height: appheight * 0.035,
                                      alignment: Alignment.center,
                                      // color: Colors.red,
                                      child: Text(
                                          "${weatherdata["PM25_INDEX"]} (${weatherdata["PM25"]})",
                                          style: TextStyle(
                                              color: Colors.yellow,
                                              fontSize: appwidth * 0.035)),
                                    ),
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
                  height: appheight * 0.105,
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
                                  fontSize: appwidth * 0.03,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                          Container(
                            width: appwidth * 0.3,
                            // height: appheight * 0.09,
                            padding: EdgeInsets.only(left: appwidth * 0.03),
                            alignment: Alignment.topLeft,
                            // color: Colors.red,
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            width: appwidth * 0.3,
                            // color: Colors.red,
                            padding: EdgeInsets.only(
                                top: appheight * 0.01, right: appwidth * 0.03),
                            alignment: Alignment.centerRight,
                            child: Icon(Icons.sunny,
                                color: Colors.white, size: 20),
                          ),
                          Container(
                            width: appwidth * 0.3,
                            // height: appheight * 0.09,
                            padding: EdgeInsets.only(right: appwidth * 0.03),
                            alignment: Alignment.topRight,
                            // color: Colors.red,
                          ),
                          Container(
                            width: appwidth * 0.3,
                            // height: appheight * 0.09,
                            padding: EdgeInsets.only(right: appwidth * 0.03),
                            alignment: Alignment.topRight,
                            // color: Colors.red,
                          ),
                          SizedBox(
                            height: appheight * 0.008,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                    child: Container(
                        padding: EdgeInsets.only(top: appheight * 0.003),
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(158, 133, 255, 1.0),
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(15),
                                bottomRight: Radius.circular(15))),
                        height: 100000,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      width: appwidth * 0.225,
                                      height: appheight * 0.035,
                                      alignment: Alignment.center,
                                      // color: Colors.red,
                                      child: Text(
                                        "자외선 지수",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: appwidth * 0.04),
                                      ),
                                    ),
                                    Container(
                                      width: appwidth * 0.175,
                                      height: appheight * 0.035,
                                      alignment: Alignment.center,
                                      // color: Colors.red,
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                      width: appwidth * 0.25,
                                      height: appheight * 0.035,
                                      alignment: Alignment.center,
                                      // color: Colors.red,
                                      child: Text(
                                        "미세먼지",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: appwidth * 0.04),
                                      ),
                                    ),
                                    Container(
                                      width: appwidth * 0.175,
                                      height: appheight * 0.035,
                                      alignment: Alignment.center,
                                      // color: Colors.red,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      width: appwidth * 0.25,
                                      height: appheight * 0.035,
                                      alignment: Alignment.center,
                                      // color: Colors.red,
                                      child: Text(
                                        "강수량",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: appwidth * 0.04),
                                      ),
                                    ),
                                    Container(
                                      width: appwidth * 0.175,
                                      height: appheight * 0.035,
                                      alignment: Alignment.center,
                                      // color: Colors.red,
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                      width: appwidth * 0.25,
                                      height: appheight * 0.035,
                                      alignment: Alignment.center,
                                      // color: Colors.red,
                                      child: Text(
                                        "초미세먼지",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: appwidth * 0.04),
                                      ),
                                    ),
                                    Container(
                                      width: appwidth * 0.175,
                                      height: appheight * 0.035,
                                      alignment: Alignment.center,
                                      // color: Colors.red,
                                    ),
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
