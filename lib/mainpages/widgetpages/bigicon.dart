import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hanriver_now/mainpages/mylikescreen.dart';
import 'package:hanriver_now/areapages/areapage.dart';
import 'package:hanriver_now/areapages/overview.dart';
import 'package:hanriver_now/areapages/gwangnaru.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart' as root_bundle;
import 'package:xml2json/xml2json.dart';

class BigWidget extends StatefulWidget {
  AreaInfo areaInfo;

  BigWidget(this.areaInfo);
  @override
  _BigWidget createState() => _BigWidget();
}

class ReadJsonFile {
  static Future<Map> readJsonData({required String path}) async {
    // read json file
    final jsondata = await root_bundle.rootBundle.loadString(path);

    // decode json data as list
    final list = json.decode(jsondata) as Map;

    // map json and initialize
    // using DataModel
    return list;
  }
}

class _BigWidget extends State<BigWidget> {
  final String apiUrl =
      'http://openapi.seoul.go.kr:8088/776a6b515877686438366d4b4b5847/xml/citydata/1/5/';
  Widget Traffic(String traffic, double appwidth) {
    if (traffic == "여유") {
      return Text(
        traffic,
        style: TextStyle(fontSize: appwidth * 0.45 * 0.09, color: Colors.green),
      );
    } else if (traffic == "약간 붐빔") {
      return Text(
        traffic,
        style:
            TextStyle(fontSize: appwidth * 0.45 * 0.09, color: Colors.orange),
      );
    } else if (traffic == "보통") {
      return Text(
        traffic,
        style:
            TextStyle(fontSize: appwidth * 0.45 * 0.09, color: Colors.yellow),
      );
    } else if (traffic == "붐빔") {
      return Text(
        traffic,
        style: TextStyle(fontSize: appwidth * 0.45 * 0.09, color: Colors.red),
      );
    }

    return Text(traffic);
  }

  @override
  Widget build(BuildContext context) {
    Future<dynamic> readJson() async {
      final String response =
          await rootBundle.loadString('assets/json/detail.json');
      final data = await json.decode(response);
      return data[0];
    }

    final appheight = MediaQuery.of(context).size.height;
    final appwidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Container(
          color: Color.fromARGB(255, 249, 248, 253),
          margin: EdgeInsets.only(top: 20, left: 20, right: 20),
          child: Stack(
            children: [
              Container(
                padding: EdgeInsets.only(
                    right: appwidth * 0.04, top: appwidth * 0.1),
                width: appwidth,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: Image.asset(
                            "assets/images/${widget.areaInfo.areaName}한강공원야경.webp")
                        .image,
                    fit: BoxFit.fill,
                  ),
                ),
                height: appheight * 0.27,
                width: appwidth * 0.64,
                alignment: Alignment.center,
              ),
              Positioned(
                top: (appheight * 0.21 - appheight * 0.14) / 2,
                left: appwidth - (appwidth * 0.41) - appwidth * 0.22,
                child: InkWell(
                  splashColor: Color.fromARGB(255, 156, 137, 77),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => GwangNaRu(widget.areaInfo)));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    height: appheight * 0.20,
                    width: appwidth * 0.5,
                    alignment: Alignment.center,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: appheight * 0.16 * 0.05,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                // color: Colors.red,
                                width: appwidth * 0.45 * 0.31,
                                height: appheight * 0.158 * 0.02,
                              ),
                              Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(
                                        left: appwidth * 0.05,
                                        top: appheight * 0.002),
                                    width: appwidth * 0.45,
                                    height: appheight * 0.158 * 0.3,
                                    // color: Colors.red,
                                    child: Text(
                                      "${widget.areaInfo.areaName} 한강 공원",
                                      style: TextStyle(
                                          fontSize: appwidth * 0.45 * 0.16),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            width: appwidth * 0.45 * 0.9,
                            child: FutureBuilder(
                              future: readJson(),
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  return Text(
                                    snapshot.data[widget.areaInfo.contentid]
                                        ["addr"],
                                    style: TextStyle(
                                        fontSize: appwidth * 0.45 * 0.08),
                                  );
                                } else {
                                  return CircularProgressIndicator();
                                }
                              },
                            ),
                          ),
                          SizedBox(
                            width: appwidth * 0.45 * 0.95,
                            height: appheight * 0.158 * 0.15,
                          ),
                          SizedBox(
                            width: appwidth * 0.45,
                            height: appheight * 0.158 * 0.15,
                            child: Row(
                              children: [
                                SizedBox(
                                  width: appwidth * 0.45 * 0.04,
                                ),
                                Icon(
                                  Icons.circle,
                                  size: appwidth * 0.45 * 0.065,
                                  color: Color.fromARGB(255, 211, 200, 255),
                                ),
                                Container(
                                  alignment: Alignment.centerLeft,
                                  child: FutureBuilder(
                                    future: readJson(),
                                    builder: (context, snapshot) {
                                      if (snapshot.hasData) {
                                        return Text(
                                            "  안내센터 : ${snapshot.data[widget.areaInfo.contentid]["tel"]}",
                                            style: TextStyle(
                                                fontSize:
                                                    appwidth * 0.45 * 0.09));
                                      } else {
                                        return CircularProgressIndicator();
                                      }
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: appwidth * 0.45,
                            height: appheight * 0.158 * 0.15,
                            child: Row(
                              children: [
                                SizedBox(
                                  width: appwidth * 0.45 * 0.04,
                                ),
                                Icon(
                                  Icons.circle,
                                  size: appwidth * 0.45 * 0.065,
                                  color: Color.fromARGB(255, 211, 200, 255),
                                ),
                                Container(
                                  alignment: Alignment.centerLeft,
                                  child: FutureBuilder(
                                    future: readJson(),
                                    builder: (context, snapshot) {
                                      if (snapshot.hasData) {
                                        return Text(
                                            "  이용요금 : ${snapshot.data[widget.areaInfo.contentid]["infotext3"]}",
                                            style: TextStyle(
                                                fontSize:
                                                    appwidth * 0.45 * 0.09));
                                      } else {
                                        return CircularProgressIndicator();
                                      }
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: appwidth * 0.45,
                            height: appheight * 0.158 * 0.15,
                            child: Row(
                              children: [
                                SizedBox(
                                  width: appwidth * 0.45 * 0.04,
                                ),
                                Icon(
                                  Icons.circle,
                                  size: appwidth * 0.45 * 0.065,
                                  color: Color.fromARGB(255, 211, 200, 255),
                                ),
                                Container(
                                  alignment: Alignment.centerLeft,
                                  child: FutureBuilder(
                                    future: http.get(Uri.parse(
                                        '$apiUrl${widget.areaInfo.areaName}한강공원')),
                                    builder: (context, snapshot) {
                                      if (snapshot.hasData) {
                                        final getXmlData = snapshot.data!.body;
                                        final xml = Xml2Json()
                                          ..parse(getXmlData);
                                        final jsonData = xml.toParker();
                                        var data = jsonDecode(jsonData);

                                        try {
                                          if (data["Map"]["RESULT.MESSAGE"] ==
                                              "해당하는 데이터가 없습니다") {
                                            return Text("  실시간 혼잡도 : 지원안함",
                                                style: TextStyle(
                                                    fontSize: appwidth *
                                                        0.45 *
                                                        0.09));
                                          }
                                        } catch (e) {
                                          return Row(
                                            children: [
                                              Text(
                                                "  실시간 혼잡도 : ",
                                                style: TextStyle(
                                                  fontSize:
                                                      appwidth * 0.45 * 0.09,
                                                ),
                                              ),
                                              Traffic(
                                                  data["SeoulRtd.citydata"]
                                                                  ["CITYDATA"]
                                                              [
                                                              "LIVE_PPLTN_STTS"]
                                                          ["LIVE_PPLTN_STTS"]
                                                      ["AREA_CONGEST_LVL"],
                                                  appwidth)
                                            ],
                                          );
                                        }
                                        return Text('  실시간 혼잡도 : 지원안함');
                                      } else {
                                        return Text("  실시간 혼잡도 : 지원안함",
                                            style: TextStyle(
                                                fontSize:
                                                    appwidth * 0.45 * 0.09));
                                      }
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: appwidth * 0.45,
                            child: Text(
                              "더 알아보기",
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                fontSize: appwidth * 0.45 * 0.08,
                              ),
                            ),
                          ),
                        ]),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 15,
        ),
      ],
    );
  }
}
