import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hanriver_now/areapages/overview.dart';
import 'package:hanriver_now/mainpages/mylikescreen.dart';

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
        void ParkInfo(String text) {
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
                        style: TextStyle(fontSize: 40),
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
                            for (num i = 0;
                                i <
                                    snapshot
                                        .data[contentid]["infotext2"].length;
                                i++)
                              Column(
                                children: [
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      snapshot.data[contentid]["infotext2"][i]
                                          ["name"],
                                      style: TextStyle(fontSize: 30),
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    padding: EdgeInsets.only(left: 10),
                                    child: Text(
                                      "주소 : ${snapshot.data[contentid]["infotext2"][i]["addr"]}",
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    padding:
                                        EdgeInsets.only(left: 10, bottom: 20),
                                    child: Text(
                                      "요금 : ${snapshot.data[contentid]["infotext2"][i]["price"]}",
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ),
                                ],
                              )
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
                        style: TextStyle(fontSize: 20),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                );
              });
        }

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
                height: appheight * 0.5,
                child: Stack(
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          width: appwidth,
                          height: appheight * 0.3,
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
                      top: appheight * 0.23,
                      left: appwidth * 0.05,
                      width: appwidth * 0.9,
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
                        height: appheight * 0.25,
                        alignment: Alignment.topLeft,
                        child: Column(children: [
                          Container(
                            alignment: Alignment.topLeft,
                            padding:
                                EdgeInsets.only(left: 20, top: 10, right: 50),
                            child: Text(
                              "${widget.areaInfo.areaName} 한강공원",
                              style: TextStyle(
                                  fontSize: 40,
                                  color: Color.fromARGB(255, 168, 147, 255)),
                            ),
                          ),
                          SizedBox(
                            width: 200,
                            child: ElevatedButton(
                              onPressed: () => ParkInfo("overview"),
                              child: Text(
                                '주차 정보',
                                style: TextStyle(fontSize: 28),
                              ),
                            ),
                          ),
                        ]),
                      ),
                    ),
                    SizedBox(
                        width: appwidth,
                        height: appheight * 0.3,
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
                padding: EdgeInsets.only(left: 20, top: 15),
                child: Text(
                  "시설 현황",
                  style: TextStyle(fontSize: appheight * 0.04),
                ),
              ),
              Container(
                  padding: EdgeInsets.only(left: 40, top: 5, right: 40),
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
                        height: appheight * 0.08,
                        child: Row(
                          children: [
                            Container(
                              // color: Colors.red,
                              alignment: Alignment.topCenter,
                              child: Text(
                                "운동시설 : ",
                                style: TextStyle(fontSize: appwidth * 0.05),
                              ),
                            ),
                            Container(
                                width: appwidth * 0.6,
                                alignment: Alignment.topLeft,
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
                                            fontSize: appwidth * 0.05,
                                            fontFamily: 'EastSeaDokdo',
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
                        height: appheight * 0.08,
                        child: Row(
                          children: [
                            Container(
                              // color: Colors.red,
                              alignment: Alignment.topCenter,
                              child: Text(
                                "편의시설 : ",
                                style: TextStyle(fontSize: appwidth * 0.05),
                              ),
                            ),
                            Container(
                                width: appwidth * 0.6,
                                alignment: Alignment.topLeft,
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
                                            fontSize: appwidth * 0.05,
                                            fontFamily: 'EastSeaDokdo',
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
                        height: appheight * 0.08,
                        child: Row(
                          children: [
                            Container(
                              // color: Colors.red,
                              alignment: Alignment.topCenter,
                              child: Text(
                                "기타 : ",
                                style: TextStyle(fontSize: appwidth * 0.05),
                              ),
                            ),
                            Container(
                                width: appwidth * 0.6,
                                alignment: Alignment.topLeft,
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
                                            fontSize: appwidth * 0.05,
                                            fontFamily: 'EastSeaDokdo',
                                            color: Colors.black),
                                      ),
                                    )),
                                  ],
                                )),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      )
                    ]),
                  )),
            ],
          ),
        );
      },
    );
  }
}
