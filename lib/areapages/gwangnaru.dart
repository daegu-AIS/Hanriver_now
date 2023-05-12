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
        await rootBundle.loadString('assets/json/ditail.json');
    final data = await json.decode(response);
    return data[0];
  }

  final PageController controller =
      PageController(initialPage: 0, viewportFraction: 1);
  @override
  Widget build(BuildContext context) {
    final appheight = MediaQuery.of(context).size.height;
    final appwidth = MediaQuery.of(context).size.width;
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
                  child: InkWell(
                    splashColor: Color.fromARGB(100, 156, 137, 77),
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
                            padding:
                                EdgeInsets.only(left: 20, top: 10, right: 50),
                            child: FutureBuilder(
                              // 여기서부터 시작
                              future: readJson(), // 고정
                              builder: (context, snapshot) {
                                //고정
                                if (snapshot.hasData) {
                                  // 고정
                                  return Text(
                                    "${snapshot.data[widget.areaInfo.contentid]["name"]}",
                                    style: TextStyle(
                                        fontSize: 40,
                                        color:
                                            Color.fromARGB(255, 168, 147, 255)),
                                  );
                                } else {
                                  return Text("없음");
                                }
                              },
                            ))
                      ]),
                    ),
                  ),
                ),
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
                    // color: Color.fromARGB(255, 255, 0, 0),
                    width: appwidth * 0.9,
                    child: Text("운동시설 (인공암벽장, 축구장, 농구장, 테니스장, 족구장 등)",
                        style: TextStyle(fontSize: 20)),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 20, top: 1),
                    // color: Color.fromARGB(255, 255, 0, 0),
                    width: appwidth * 0.9,
                    child:
                        Text("수영장 (7~8월 개장)", style: TextStyle(fontSize: 20)),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 20, top: 1),
                    // color: Color.fromARGB(255, 255, 0, 0),
                    width: appwidth * 0.9,
                    child: Text("눈썰매장 (12월 ~ 2월 개장)",
                        style: TextStyle(fontSize: 20)),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 20, top: 1, bottom: 10),
                    // color: Color.fromARGB(255, 255, 0, 0),
                    width: appwidth * 0.9,
                    child: Text("뚝섬윈드서핑장", style: TextStyle(fontSize: 20)),
                  ),
                ]),
              )),
          Container(
            padding: EdgeInsets.only(left: 20, top: 20),
            child: Text(
              "시설 현황",
              style: TextStyle(fontSize: appheight * 0.04),
            ),
          ),
          Container(
              padding: EdgeInsets.only(left: 40, top: 5, right: 40, bottom: 20),
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
                    // color: Color.fromARGB(255, 255, 0, 0),
                    width: appwidth * 0.9,
                    child: Text("운동시설 (인공암벽장, 축구장, 농구장, 테니스장, 족구장 등)",
                        style: TextStyle(fontSize: 20)),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 20, top: 1),
                    // color: Color.fromARGB(255, 255, 0, 0),
                    width: appwidth * 0.9,
                    child:
                        Text("수영장 (7~8월 개장)", style: TextStyle(fontSize: 20)),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 20, top: 1),
                    // color: Color.fromARGB(255, 255, 0, 0),
                    width: appwidth * 0.9,
                    child: Text("눈썰매장 (12월 ~ 2월 개장)",
                        style: TextStyle(fontSize: 20)),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 20, top: 1, bottom: 10),
                    // color: Color.fromARGB(255, 255, 0, 0),
                    width: appwidth * 0.9,
                    child: Text("뚝섬윈드서핑장", style: TextStyle(fontSize: 20)),
                  ),
                ]),
              )),
          // Positioned(
          //     top: appheight * 0.53,
          //     left: appwidth * 0.05,
          //     width: appwidth * 0.425,
          //     height: appheight * 0.07,
          //     child:
          //         Text("시설현황", style: TextStyle(fontSize: appheight * 0.04))),
          // Positioned(
          //   top: appheight * 0.58,
          //   left: appwidth * 0.05,
          //   width: appwidth * 0.9,
          //   height: appheight * 0.15,
          //   child: InkWell(
          //     splashColor: Color.fromARGB(100, 156, 137, 77),
          //     child: Container(
          //       decoration: BoxDecoration(
          //         color: Color.fromARGB(255, 255, 255, 255),
          //         borderRadius: BorderRadius.circular(20),
          //         boxShadow: [
          //           BoxShadow(
          //             color: Colors.grey.withOpacity(0.5),
          //             spreadRadius: 2,
          //             blurRadius: 5,
          //             offset: Offset(0, 3),
          //           ),
          //         ],
          //       ),
          //       alignment: Alignment.topLeft,
          //       child: Column(children: [
          //         Container(
          //           padding: EdgeInsets.only(left: 20, top: 10),
          //           // color: Color.fromARGB(255, 255, 0, 0),
          //           width: appwidth * 0.9,
          //           child: Text("운동시설 (인공암벽장, 축구장, 농구장, 테니스장, 족구장 등)",
          //               style: TextStyle(fontSize: 20)),
          //         ),
          //         Container(
          //           padding: EdgeInsets.only(left: 20, top: 1),
          //           // color: Color.fromARGB(255, 255, 0, 0),
          //           width: appwidth * 0.9,
          //           child:
          //               Text("수영장 (7~8월 개장)", style: TextStyle(fontSize: 20)),
          //         ),
          //         Container(
          //           padding: EdgeInsets.only(left: 20, top: 1),
          //           // color: Color.fromARGB(255, 255, 0, 0),
          //           width: appwidth * 0.9,
          //           child: Text("눈썰매장 (12월 ~ 2월 개장)",
          //               style: TextStyle(fontSize: 20)),
          //         ),
          //         Container(
          //           padding: EdgeInsets.only(left: 20, top: 1),
          //           // color: Color.fromARGB(255, 255, 0, 0),
          //           width: appwidth * 0.9,
          //           child: Text("뚝섬윈드서핑장", style: TextStyle(fontSize: 20)),
          //         ),
          //       ]),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
