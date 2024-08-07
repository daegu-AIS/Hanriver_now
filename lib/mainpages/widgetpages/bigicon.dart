import 'dart:convert';

import 'package:async/async.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hanriver_now/mainpages/mylikescreen.dart';
import 'package:hanriver_now/areapages/gwangnaru.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart' as root_bundle;
import 'package:xml2json/xml2json.dart';

class BigWidget extends StatefulWidget {
  AreaInfo areaInfo;
  String nightday;

  BigWidget(this.areaInfo, this.nightday);
  @override
  _BigWidget createState() => _BigWidget();
}

class _BigWidget extends State<BigWidget> {
  final AsyncMemoizer _memoizer = AsyncMemoizer();
  final String apiUrl =
      'http://openapi.seoul.go.kr:8088/776a6b515877686438366d4b4b5847/xml/citydata/1/5/';
  Widget Traffic(String traffic, double appwidth, double appheight) {
    if (traffic == "여유") {
      return Text(
        traffic,
        style: TextStyle(
            fontSize: appwidth > appheight
                ? 18
                : appwidth >= 500
                    ? 14
                    : appwidth * 0.45 * 0.065,
            color: Colors.green),
      );
    } else if (traffic == "약간 붐빔") {
      return Text(
        traffic,
        style: TextStyle(
            fontSize: appwidth > appheight
                ? 18
                : appwidth >= 500
                    ? 14
                    : appwidth * 0.45 * 0.065,
            color: Colors.orange),
      );
    } else if (traffic == "보통") {
      return Text(
        traffic,
        style: TextStyle(
            fontSize: appwidth > appheight
                ? 18
                : appwidth >= 500
                    ? 14
                    : appwidth * 0.45 * 0.065,
            color: Colors.yellow),
      );
    } else if (traffic == "붐빔") {
      return Text(
        traffic,
        style: TextStyle(
            fontSize: appwidth > appheight
                ? 18
                : appwidth >= 500
                    ? 14
                    : appwidth * 0.45 * 0.065,
            color: Colors.red),
      );
    }

    return Text(traffic);
  }

  @override
  Widget build(BuildContext context) {
    Future<dynamic> readJson() async {
      return _memoizer.runOnce(() async {
        final String response =
            await rootBundle.loadString('assets/json/detail.json');
        final data = await json.decode(response);

        return data[0];
      });
    }

    final appheight = MediaQuery.of(context).size.height;
    final appwidth = MediaQuery.of(context).size.width;
    return Column(children: [
      Container(
          // color: Color.fromARGB(255, 249, 248, 253),
          // color: Colors.red,
          margin: EdgeInsets.only(top: 20, left: 20, right: 20),
          child: Stack(children: [
            Container(
              padding:
                  EdgeInsets.only(right: appwidth * 0.04, top: appwidth * 0.1),
              width: appwidth,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: Image.asset(widget.nightday == "밤"
                          ? "assets/images/${widget.areaInfo.areaName}한강공원야경.webp"
                          : widget.nightday == "낮"
                              ? "assets/images/${widget.areaInfo.areaName}한강공원.webp"
                              : "")
                      .image,
                  fit: BoxFit.fill,
                ),
              ),
              height: appwidth >= appheight ? 200 : appheight * 0.2,
              // constraints: BoxConstraints(minHeight: 190),
              // height: 220,

              width: appwidth * 0.64,
              alignment: Alignment.center,
            ),
            Positioned(
                top: (appheight * 0.04) / 2,
                // left: appwidth * 0.39,
                right: 0,
                child: InkWell(
                    splashColor: Color.fromARGB(255, 156, 137, 77),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  GwangNaRu(widget.areaInfo)));
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
                      // height: 200,
                      // constraints: BoxConstraints(minHeight: 170),
                      height: appwidth >= appheight
                          ? 180
                          : appheight >= 730
                              ? appheight * 0.16
                              : appheight * 0.18,
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
                                  height: appheight * 0.158 * 0.01,
                                ),
                                Row(
                                  children: [
                                    Container(
                                      padding:
                                          EdgeInsets.only(left: 15, top: 5),
                                      child: Text(
                                        "${widget.areaInfo.areaName} 한강 공원",
                                        style: TextStyle(
                                          // fontSize: appwidth > appheight
                                          //     ? 30
                                          //     : appwidth * 0.45 * 0.1,
                                          fontSize: appwidth > appheight
                                              ? 30
                                              : appwidth >= 500
                                                  ? 24
                                                  : appwidth * 0.45 * 0.1,
                                        ),
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
                                      "  ${snapshot.data[widget.areaInfo.contentid]["addr"]}",
                                      style: TextStyle(
                                        // fontSize: appwidth > appheight
                                        //     ? 18
                                        //     : appwidth * 0.025
                                        fontSize: appwidth > appheight
                                            ? 18
                                            : appwidth >= 500
                                                ? 16
                                                : appwidth * 0.025,
                                      ),
                                    );
                                  } else {
                                    return CircularProgressIndicator();
                                  }
                                },
                              ),
                            ),
                            SizedBox(
                              // width: appwidth * 0.45 * 0.95,
                              height: 10,
                            ),
                            SizedBox(
                              width: appwidth * 0.45,
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: appwidth * 0.45 * 0.04,
                                  ),
                                  Icon(
                                    Icons.circle,
                                    size: appwidth > appheight
                                        ? 22
                                        : appwidth >= 500
                                            ? 14
                                            : appwidth * 0.45 * 0.065,
                                    // size: appwidth * 0.45 * 0.065,
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
                                                fontSize: appwidth > appheight
                                                    ? 18
                                                    : appwidth >= 500
                                                        ? 14
                                                        : appwidth *
                                                            0.45 *
                                                            0.065,
                                              ));
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
                              // height: appheight * 0.158 * 0.15,
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: appwidth * 0.45 * 0.04,
                                  ),
                                  Icon(
                                    Icons.circle,
                                    size: appwidth > appheight
                                        ? 22
                                        : appwidth >= 500
                                            ? 14
                                            : appwidth * 0.45 * 0.065,
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
                                                fontSize: appwidth > appheight
                                                    ? 18
                                                    : appwidth >= 500
                                                        ? 14
                                                        : appwidth *
                                                            0.45 *
                                                            0.065,
                                              ));
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
                              // height: appheight * 0.158 * 0.15,
                              child: Row(children: [
                                SizedBox(
                                  width: appwidth * 0.45 * 0.04,
                                ),
                                Icon(
                                  Icons.circle,
                                  size: appwidth > appheight
                                      ? 22
                                      : appwidth >= 500
                                          ? 14
                                          : appwidth * 0.45 * 0.065,
                                  color: Color.fromARGB(255, 211, 200, 255),
                                ),
                                Container(
                                    alignment: Alignment.centerLeft,
                                    child: FutureBuilder(
                                        future: http.get(Uri.parse(
                                            '$apiUrl${widget.areaInfo.areaName}한강공원')),
                                        builder: (context, snapshot) {
                                          if (snapshot.hasData) {
                                            final getXmlData =
                                                snapshot.data!.body;
                                            final xml = Xml2Json()
                                              ..parse(getXmlData);
                                            final jsonData = xml.toParker();
                                            var data = jsonDecode(jsonData);

                                            try {
                                              if (data["Map"]
                                                      ["RESULT.MESSAGE"] ==
                                                  "해당하는 데이터가 없습니다") {
                                                return Text("  실시간 혼잡도 : 지원안함",
                                                    style: TextStyle(
                                                        fontSize: appwidth >
                                                                appheight
                                                            ? 18
                                                            : appwidth >= 500
                                                                ? 14
                                                                : appwidth *
                                                                    0.45 *
                                                                    0.065));
                                              }
                                            } catch (e) {
                                              return Row(
                                                children: [
                                                  Text(
                                                    "  실시간 혼잡도 : ",
                                                    style: TextStyle(
                                                      fontSize:
                                                          appwidth > appheight
                                                              ? 18
                                                              : appwidth >= 500
                                                                  ? 14
                                                                  : appwidth *
                                                                      0.45 *
                                                                      0.065,
                                                    ),
                                                  ),
                                                  Traffic(
                                                      data["SeoulRtd.citydata"][
                                                                      "CITYDATA"]
                                                                  [
                                                                  "LIVE_PPLTN_STTS"]
                                                              [
                                                              "LIVE_PPLTN_STTS"]
                                                          ["AREA_CONGEST_LVL"],
                                                      appwidth,
                                                      appheight)
                                                ],
                                              );
                                            }
                                            return Text('  실시간 혼잡도 : ',
                                                style: TextStyle(
                                                    fontSize:
                                                        appwidth > appheight
                                                            ? 18
                                                            : appwidth >= 500
                                                                ? 14
                                                                : appwidth *
                                                                    0.45 *
                                                                    0.065));
                                          } else {
                                            return Text("  실시간 혼잡도 : ",
                                                style: TextStyle(
                                                    fontSize:
                                                        appwidth > appheight
                                                            ? 18
                                                            : appwidth >= 500
                                                                ? 14
                                                                : appwidth *
                                                                    0.45 *
                                                                    0.065));
                                          }
                                        }))
                              ]),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 3),
                              width: appwidth * 0.45,
                              child: Text(
                                "더 알아보기",
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                  fontSize: appwidth > appheight
                                      ? 12
                                      : appwidth >= 500
                                          ? 8
                                          : appwidth * 0.45 * 0.068,
                                ),
                              ),
                            ),
                          ]),
                    )))
          ]))
    ]);
  }
}
