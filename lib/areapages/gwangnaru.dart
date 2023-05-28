import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hanriver_now/mainpages/mylikescreen.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as parser;
import 'package:html/dom.dart' as dom;

class GwangNaRu extends StatefulWidget {
  AreaInfo areaInfo;

  GwangNaRu(this.areaInfo);

  @override
  _GwangNaRu createState() => _GwangNaRu();
}

class _GwangNaRu extends State<GwangNaRu> {
  // 이거 고정
  Future<dynamic> readJson() async {
    final String response =
        await rootBundle.loadString('assets/json/detail.json');
    final data = await json.decode(response);
    return data[0];
  }

  var overview = "";
  final PageController controller =
      PageController(initialPage: 0, viewportFraction: 1);
  @override
  Widget build(BuildContext context) {
    final contentid = widget.areaInfo.contentid.toString();
    final appheight = MediaQuery.of(context).size.height;
    final appwidth = MediaQuery.of(context).size.width;
    return FutureBuilder(
      future: readJson(),
      builder: (context, snapshot) {
        Future<dynamic> fetchData(int count) async {
          var url = Uri.parse(
              "https://www.ihangangpark.kr/parking/region/region${widget.areaInfo.number}");
          var response = await http.get(url);

          if (response.statusCode == 200) {
            // print(response.body);
            var document = parser.parse(response.body);
            var titleElement = document.querySelectorAll('tbody > tr > td');
            // for (var i = 0; i < 3; i++) {
            //   print(titleElement[i * 6 + 3].text.replaceAll(RegExp('\\s'), ""));
            //   print(titleElement[i * 6 + 4].text.replaceAll(RegExp('\\s'), ""));
            // }
            return titleElement;
          } else {
            return [];
          }
        }

        void ParkInfo() async {
          showDialog(
              context: context,
              //barrierDismissible - Dialog를 제외한 다른 화면 터치 x
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
                        "주차정보",
                        style: TextStyle(fontSize: 30),
                      ),
                    ],
                  ),
                  content: Container(
                    constraints: BoxConstraints(
                        maxHeight: appheight * 0.3,
                        maxWidth: appwidth * 0.8,
                        minWidth: appwidth * 0.8),
                    child: SingleChildScrollView(
                      child: ListBody(children: [
                        Column(
                          // mainAxisSize: MainAxisSize.values[1],
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            for (int i = 0;
                                i <
                                    snapshot
                                        .data[contentid]["infotext2"].length;
                                i++)
                              FutureBuilder(
                                future: fetchData(i),
                                builder: (context, snapshot2) {
                                  var data1 = snapshot2.data;
                                  var data2 = "";
                                  var data3 = "";
                                  if (snapshot2.hasData) {
                                    data2 = data1[i * 6 + 3]
                                        .text
                                        .replaceAll(RegExp('\\s'), "");
                                    data3 = data1[i * 6 + 4]
                                        .text
                                        .replaceAll(RegExp('\\s'), "");

                                    return Column(
                                      children: [
                                        Container(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            "${snapshot.data[contentid]["infotext2"][i]["name"]}",
                                            style: TextStyle(fontSize: 25),
                                          ),
                                        ),
                                        Container(
                                          alignment: Alignment.centerLeft,
                                          padding:
                                              EdgeInsets.only(left: 10, top: 5),
                                          child: Text(
                                            "주차 가능 대수 : $data2",
                                            style: TextStyle(fontSize: 15),
                                          ),
                                        ),
                                        Container(
                                          alignment: Alignment.centerLeft,
                                          padding:
                                              EdgeInsets.only(left: 10, top: 5),
                                          child: Text(
                                            "주소 : ${snapshot.data[contentid]["infotext2"][i]["addr"]}",
                                            style: TextStyle(fontSize: 15),
                                          ),
                                        ),
                                        Container(
                                          alignment: Alignment.centerLeft,
                                          padding:
                                              EdgeInsets.only(left: 10, top: 5),
                                          child: Text(
                                            "요금 : ${snapshot.data[contentid]["infotext2"][i]["price"]}",
                                            style: TextStyle(fontSize: 15),
                                          ),
                                        ),
                                        Container(
                                          alignment: Alignment.centerLeft,
                                          padding: EdgeInsets.only(
                                              left: 10, bottom: 20, top: 5),
                                          child: Text(
                                            "1일 최대 요금 : ${snapshot.data[contentid]["infotext2"][i]["max"]}",
                                            style: TextStyle(fontSize: 15),
                                          ),
                                        ),
                                      ],
                                    );
                                  } else {
                                    return Container(
                                      height: appheight,
                                    );
                                  }
                                },
                              ),
                          ],
                        ),
                        Text("출처 : 한강 사업본부 통합주차포털 ")
                      ]),
                    ),
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

        void Overview(String overview) {
          showDialog(
              context: context,
              //barrierDismissible - Dialog를 제외한 다른 화면 터치 x
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
                        "상세정보",
                        style: TextStyle(fontSize: 30),
                      ),
                    ],
                  ),
                  //
                  content: Container(
                    constraints: BoxConstraints(
                        maxHeight: appheight * 0.3,
                        maxWidth: appwidth * 0.8,
                        minWidth: appwidth * 0.8),
                    child: SingleChildScrollView(
                      child: ListBody(children: [
                        Column(
                          // mainAxisSize: MainAxisSize.values[1],
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                padding: EdgeInsets.only(bottom: 20),
                                child: Text(
                                  overview,
                                  style: TextStyle(fontSize: 17),
                                ))
                          ],
                        ),
                        Text("출처 : 한국관광공사(공공데이터포털) ")
                      ]),
                    ),
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

        if (snapshot.hasData) {
          return Scaffold(
            backgroundColor: Color.fromARGB(255, 249, 248, 253),
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
                      style: TextStyle(fontSize: 25, color: Colors.black),
                    ),
                  ),
                ],
              ),
              centerTitle: true,
              backgroundColor: Color.fromARGB(255, 249, 248, 253),
              elevation: 0.0,
              leading: IconButton(
                icon: Icon(Icons.arrow_back_ios_new),
                onPressed: () {
                  Navigator.pop(context);
                },
                color: Colors.black,
              ),
            ),
            body: ListView(
              children: [
                SizedBox(
                  width: appwidth,
                  height:
                      appwidth > appheight ? appheight * 0.75 : appheight * 0.5,
                  child: Stack(
                    children: [
                      Column(
                        children: [
                          SizedBox(
                            width: appwidth,
                            height: appwidth > appheight
                                ? appheight * 0.45
                                : appheight * 0.3,
                            child: PageView(
                              scrollDirection: Axis.horizontal,
                              controller: controller,
                              children: [
                                Image.asset(
                                  "assets/images/${widget.areaInfo.areaName}한강공원.webp",
                                  fit: BoxFit.cover,
                                ),
                                Image.asset(
                                  "assets/images/${widget.areaInfo.areaName}한강공원야경.webp",
                                  fit: BoxFit.cover,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Positioned(
                        top: appwidth > appheight
                            ? appheight * 0.35
                            : appheight * 0.25,
                        left: appwidth * 0.05,
                        width: appwidth * 0.9,
                        child: Container(
                          decoration: BoxDecoration(
                            // color: Color.fromARGB(255, 255, 255, 255),
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
                          // height: appwidth > appheight
                          //     ? appheight * 0.35
                          //     : appheight * 0.25,
                          alignment: Alignment.topLeft,
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  alignment: Alignment.topLeft,
                                  padding: EdgeInsets.only(
                                      left: 20, top: 10, right: 50),
                                  child: Text(
                                    "대한민국",
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.black),
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.topLeft,
                                  padding: EdgeInsets.only(
                                      left: 20, right: 50, bottom: 7),
                                  child: Text(
                                    "${widget.areaInfo.areaName} 한강공원",
                                    style: TextStyle(
                                        fontSize: appwidth >= 400 ? 35 : 25,
                                        color:
                                            Color.fromARGB(255, 168, 147, 255)),
                                  ),
                                ),
                                Container(
                                  // color: Colors.blue,
                                  // height: appheight * 0.14,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        padding:
                                            EdgeInsets.only(left: 20, right: 5),
                                        width: appwidth * 0.6,
                                        height: appheight * 0.14,
                                        // color: Colors.amber,
                                        child: Column(children: [
                                          Flexible(
                                              child: RichText(
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: appheight > 1000
                                                ? 6
                                                : appheight > 820
                                                    ? 5
                                                    : appheight > 700
                                                        ? 5
                                                        : appheight > 700
                                                            ? 4
                                                            : 3,
                                            text: TextSpan(
                                              text: snapshot.data[contentid]
                                                  ['overviw'],
                                              style: TextStyle(
                                                  fontSize: 17,
                                                  fontFamily: 'KCC-Chassam',
                                                  color: Colors.black),
                                            ),
                                          )),
                                        ]),
                                      ),
                                      Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Container(
                                              padding:
                                                  EdgeInsets.only(right: 20),
                                              width: appwidth * 0.3,
                                              child: ElevatedButton(
                                                style: ButtonStyle(
                                                    backgroundColor:
                                                        MaterialStateProperty
                                                            .all<Color>(
                                                                Color.fromARGB(
                                                                    255,
                                                                    211,
                                                                    200,
                                                                    255)),
                                                    shape: MaterialStateProperty
                                                        .all<RoundedRectangleBorder>(
                                                            RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15.0),
                                                    ))),
                                                onPressed: () => ParkInfo(),
                                                child: Text(
                                                  '주차 정보',
                                                  style: TextStyle(
                                                      fontSize: appwidth >
                                                              appheight
                                                          ? 20
                                                          : appwidth >= 350
                                                              ? appwidth * 0.04
                                                              : 8.8,
                                                      color: Colors.black),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Container(
                                              padding: EdgeInsets.only(
                                                  right: 20, bottom: 10),
                                              width: appwidth * 0.3,
                                              child: ElevatedButton(
                                                style: ButtonStyle(
                                                    backgroundColor:
                                                        MaterialStateProperty
                                                            .all<Color>(
                                                                Color.fromARGB(
                                                                    255,
                                                                    211,
                                                                    200,
                                                                    255)),
                                                    shape: MaterialStateProperty
                                                        .all<RoundedRectangleBorder>(
                                                            RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15.0),
                                                    ))),
                                                onPressed: () => Overview(
                                                    snapshot.data[contentid]
                                                        ['overviw']),
                                                child: Text(
                                                  '상세 정보',
                                                  style: TextStyle(
                                                      fontSize: appwidth >
                                                              appheight
                                                          ? 20
                                                          : appwidth >= 350
                                                              ? appwidth * 0.04
                                                              : 8.8,
                                                      color: Colors.black),
                                                ),
                                              ),
                                            ),
                                          ]),
                                    ],
                                  ),
                                ),
                              ]),
                        ),
                      ),
                      SizedBox(
                          width: appwidth,
                          height: appwidth > appheight
                              ? appheight * 0.45
                              : appheight * 0.3,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Icon(
                                Icons.arrow_back_ios,
                                color: Colors.white,
                                size: 30,
                              ),
                              SizedBox(
                                width: appwidth * 0.7,
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.white,
                                size: 30,
                              ),
                            ],
                          )),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 20, top: 30),
                  child: Text(
                    "시설 현황",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                    padding: EdgeInsets.only(left: 40, top: 20, right: 40),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 255, 255, 255),
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
                      alignment: Alignment.topLeft,
                      child: Column(children: [
                        Container(
                          padding: EdgeInsets.only(left: 20, top: 10),
                          height: 55,
                          child: Row(
                            children: [
                              Container(
                                // color: Colors.red,
                                alignment: Alignment.topCenter,
                                child: Text(
                                  "운동시설 : ",
                                  style: TextStyle(fontSize: 15),
                                ),
                              ),
                              Container(
                                  // color: Colors.red,
                                  width: appwidth <= 360
                                      ? appwidth * 0.4
                                      : appwidth <= 420
                                          ? appwidth * 0.5
                                          : appwidth <= 480
                                              ? appwidth * 0.6
                                              : appwidth <= 580
                                                  ? appwidth * 0.65
                                                  : appwidth * 0.7,
                                  alignment: Alignment.topLeft,
                                  padding: EdgeInsets.only(right: 20),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Flexible(
                                          child: RichText(
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                        text: TextSpan(
                                          text:
                                              "${snapshot.data[widget.areaInfo.contentid]["infotext"]["gym"]}",
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontFamily: 'KCC-Chassam',
                                              color: Colors.black),
                                        ),
                                      )),
                                    ],
                                  )),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 20, top: 10),
                          height: 55,
                          child: Row(
                            children: [
                              Container(
                                // color: Colors.red,
                                alignment: Alignment.topCenter,
                                child: Text(
                                  "편의시설 : ",
                                  style: TextStyle(fontSize: 15),
                                ),
                              ),
                              Container(
                                  width: appwidth <= 360
                                      ? appwidth * 0.4
                                      : appwidth <= 420
                                          ? appwidth * 0.5
                                          : appwidth <= 480
                                              ? appwidth * 0.6
                                              : appwidth <= 580
                                                  ? appwidth * 0.65
                                                  : appwidth * 0.7,
                                  alignment: Alignment.topLeft,
                                  padding: EdgeInsets.only(right: 20),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Flexible(
                                          child: RichText(
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                        text: TextSpan(
                                          text:
                                              "${snapshot.data[widget.areaInfo.contentid]["infotext"]["facilities"]}",
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontFamily: 'KCC-Chassam',
                                              color: Colors.black),
                                        ),
                                      )),
                                    ],
                                  )),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 20, top: 10),
                          height: 55,
                          child: Row(
                            children: [
                              Container(
                                // color: Colors.red,
                                alignment: Alignment.topCenter,
                                child: Text(
                                  "기타 : ",
                                  style: TextStyle(fontSize: 15),
                                ),
                              ),
                              Container(
                                  width: appwidth <= 360
                                      ? appwidth * 0.4
                                      : appwidth <= 420
                                          ? appwidth * 0.5
                                          : appwidth <= 480
                                              ? appwidth * 0.6
                                              : appwidth <= 580
                                                  ? appwidth * 0.65
                                                  : appwidth * 0.7,
                                  alignment: Alignment.topLeft,
                                  padding: EdgeInsets.only(right: 20),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Flexible(
                                          child: RichText(
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                        text: TextSpan(
                                          text:
                                              "${snapshot.data[widget.areaInfo.contentid]["infotext"]["else"]}",
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontFamily: 'KCC-Chassam',
                                              color: Colors.black),
                                        ),
                                      )),
                                    ],
                                  )),
                            ],
                          ),
                        ),
                      ]),
                    )),
                SizedBox(
                  height: 20,
                )
              ],
            ),
          );
        } else {
          return Center();
        }
      },
    );
  }
}
