import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hanriver_now/mainpages/mylikescreen.dart';
import 'package:hanriver_now/mainpages/showgridscreen.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as parser;

class ParkPage extends StatefulWidget {
  @override
  _ParkPage createState() => _ParkPage();
}

class _ParkPage extends State<ParkPage> {
  Future<dynamic> readJson() async {
    final String response =
        await rootBundle.loadString('assets/json/detail.json');
    final data = await json.decode(response);
    return data[0];
  }

  @override
  Widget build(BuildContext context) {
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
        ),
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            ListView(children: [
              FutureBuilder(
                future: readJson(),
                builder: ((context, snapshot) {
                  Future<dynamic> fetchData() async {
                    var url = Uri.parse(
                        "https://www.ihangangpark.kr/parking/region/region12");
                    var response = await http.get(url);

                    if (response.statusCode == 200) {
                      // print(response.body);
                      var document = parser.parse(response.body);
                      var titleElement =
                          document.querySelectorAll('tbody > tr > td');
                      return titleElement;
                    } else {
                      return [];
                    }
                  }

                  Future<dynamic> fetchData2(String parkid, int count) async {
                    var url = Uri.parse(
                        "https://www.ihangangpark.kr/parking/region/region$parkid");
                    var response = await http.get(url);

                    if (response.statusCode == 200) {
                      // print(response.body);
                      var document = parser.parse(response.body);
                      var titleElement =
                          document.querySelectorAll('tbody > tr > td');
                      return titleElement;
                    } else {
                      return [];
                    }
                  }

                  void ParkInfo(String contentid, String parkid) async {
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
                                                  .data[contentid]["infotext2"]
                                                  .length;
                                          i++)
                                        FutureBuilder(
                                          future: fetchData2(parkid, i),
                                          builder: (context, snapshot2) {
                                            var data1 = snapshot2.data;
                                            var data2 = "";
                                            var data3 = "";
                                            if (snapshot2.hasData) {
                                              data2 = data1[i * 6 + 3]
                                                  .text
                                                  .replaceAll(
                                                      RegExp('\\s'), "");
                                              data3 = data1[i * 6 + 4]
                                                  .text
                                                  .replaceAll(
                                                      RegExp('\\s'), "");

                                              return Column(
                                                children: [
                                                  Container(
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    child: Text(
                                                      "${snapshot.data[contentid]["infotext2"][i]["name"]}",
                                                      style: TextStyle(
                                                          fontSize: 25),
                                                    ),
                                                  ),
                                                  Container(
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    padding: EdgeInsets.only(
                                                        left: 10, top: 5),
                                                    child: Text(
                                                      "주차 가능 대수 : $data2",
                                                      style: TextStyle(
                                                          fontSize: 15),
                                                    ),
                                                  ),
                                                  Container(
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    padding: EdgeInsets.only(
                                                        left: 10, top: 5),
                                                    child: Text(
                                                      "주소 : ${snapshot.data[contentid]["infotext2"][i]["addr"]}",
                                                      style: TextStyle(
                                                          fontSize: 15),
                                                    ),
                                                  ),
                                                  Container(
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    padding: EdgeInsets.only(
                                                        left: 10, top: 5),
                                                    child: Text(
                                                      "요금 : ${snapshot.data[contentid]["infotext2"][i]["price"]}",
                                                      style: TextStyle(
                                                          fontSize: 15),
                                                    ),
                                                  ),
                                                  Container(
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    padding: EdgeInsets.only(
                                                        left: 10,
                                                        bottom: 20,
                                                        top: 5),
                                                    child: Text(
                                                      "1일 최대 요금 : ${snapshot.data[contentid]["infotext2"][i]["max"]}",
                                                      style: TextStyle(
                                                          fontSize: 15),
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

                  Widget parklist(String title, String count, String parkid,
                      String contentid) {
                    return Row(
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 10, top: 20),
                          width: appwidth * 0.3,
                          alignment: Alignment.center,
                          child: Text(
                            title,
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 20),
                          width: appwidth * 0.4,
                          alignment: Alignment.center,
                          child: Text(
                            count,
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 20),
                          alignment: Alignment.center,
                          child: ElevatedButton(
                            onPressed: () => ParkInfo(contentid, parkid),
                            child: Text('자세히보기'),
                            style: ElevatedButton.styleFrom(
                                primary: Color.fromRGBO(
                                    83, 51, 204, 1), // 텍스트 버튼과 다르게 배경색 변경
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                elevation: 0.0),
                          ),
                        ),
                      ],
                    );
                  }

                  if (snapshot.hasData) {
                    return FutureBuilder(
                      future: fetchData(),
                      builder: (context, snapshot2) {
                        var data = snapshot2.data;
                        return Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.only(left: 10, top: 20),
                                  width: appwidth * 0.3,
                                  alignment: Alignment.center,
                                  child: Text(
                                    "공원 명",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(top: 20),
                                  width: appwidth * 0.4,
                                  alignment: Alignment.center,
                                  child: Text(
                                    "실시간 주차 가능 대수",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )
                              ],
                            ),
                            parklist(
                                "광나루",
                                data[19].text.replaceAll(RegExp('\\s'), ""),
                                "1",
                                "250252"),
                            parklist(
                                "강서",
                                data[14].text.replaceAll(RegExp('\\s'), ""),
                                "10",
                                "2733968"),
                            parklist(
                                "잠실",
                                data[24].text.replaceAll(RegExp('\\s'), ""),
                                "2",
                                "970460"),
                            parklist(
                                "뚝섬",
                                data[18].text.replaceAll(RegExp('\\s'), ""),
                                "3",
                                "1030763"),
                            parklist(
                                "잠원",
                                data[23].text.replaceAll(RegExp('\\s'), ""),
                                "4",
                                "970342"),
                            parklist(
                                "이촌",
                                data[17].text.replaceAll(RegExp('\\s'), ""),
                                "6",
                                "970636"),
                            parklist(
                                "반포",
                                data[22].text.replaceAll(RegExp('\\s'), ""),
                                "5",
                                "2763875"),
                            parklist(
                                "망원",
                                data[16].text.replaceAll(RegExp('\\s'), ""),
                                "7",
                                "1059638"),
                            parklist(
                                "여의도",
                                data[21].text.replaceAll(RegExp('\\s'), ""),
                                "8",
                                "1059479"),
                            parklist(
                                "난지",
                                data[15].text.replaceAll(RegExp('\\s'), ""),
                                "9",
                                "127859"),
                            parklist(
                                "양화",
                                data[20].text.replaceAll(RegExp('\\s'), ""),
                                "11",
                                "1059877"),
                            SizedBox(
                              height: 90,
                            ),
                          ],
                        );
                        ;
                      },
                    );
                  }

                  return Column(
                    children: [Text("a")],
                  );
                }),
              ),
            ]),
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
                        icon: Icon(Icons.car_crash),
                        onPressed: () {},
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
                          child: IconButton(
                            icon: Icon(
                              Icons.home_outlined,
                              size: 30,
                            ),
                            onPressed: () {
                              Navigator.push(context, PageRouteBuilder(
                                pageBuilder: (context, a, b) {
                                  return MyLikeScreen();
                                },
                              ));
                            },
                            color: Colors.black,
                          ),
                        )),
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
