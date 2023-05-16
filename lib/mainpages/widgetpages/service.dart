import 'package:flutter/material.dart';
import 'package:get/get_connect/sockets/src/socket_notifier.dart';
import 'package:hanriver_now/landingpage.dart';
import 'dart:io';

class ServiceInfo extends StatefulWidget {
  const ServiceInfo({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ServiceInfo createState() => _ServiceInfo();
}

class _ServiceInfo extends State<ServiceInfo> {
  @override
  Widget build(BuildContext context) {
    final appheight = MediaQuery.of(context).size.height;
    final appwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.pop(context);
          },
          color: Colors.black,
        ),
        toolbarHeight: 70,
        title: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Image.asset(
              'assets/images/title_icon.png',
              fit: BoxFit.contain,
              height: 50,
            ),
            Container(
              padding: EdgeInsets.only(top: 15),
              child: Text(
                'Guide',
                style: TextStyle(fontSize: 25, color: Colors.black),
              ),
            ),
          ],
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 249, 248, 253),
        elevation: 0.0,
      ),
      body: SV(),
    );
  }
}

class SV extends StatelessWidget {
  const SV({super.key});

  @override
  Widget build(BuildContext context) {
    final appheight = MediaQuery.of(context).size.height;
    return PageView(
      children: <Widget>[
        Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: appheight * 0.1),
              child: Text(
                'App Guide',
                style: TextStyle(fontSize: 70, color: Colors.black),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: appheight * 0.5),
              child: Text(
                '옆으로 슬라이드',
                style: TextStyle(fontSize: 30, color: Colors.black),
              ),
            ),
            Container(
                padding: EdgeInsets.only(top: appheight * 0.05),
                child: Icon(size: 40.0, Icons.swipe_left))
          ],
        ),
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.contain,
              image: AssetImage('assets/guide/home.png'), // 배경 이미지
            ),
          ),
          child: Column(
            children: [
              Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  elevation: 6.0,
                  child: Container(
                    padding: EdgeInsets.only(
                        top: appheight * 0.05,
                        bottom: appheight * 0.05,
                        left: appheight * 0.05,
                        right: appheight * 0.05),
                    child: Text(
                      '날씨 정보 제공',
                      style: TextStyle(fontSize: 30, color: Colors.black),
                    ),
                  )),
              Container(
                width: appheight * 0.3,
                height: appheight * 0.3,
                color: Colors.transparent,
                child: Align(
                    alignment: Alignment.center,
                    child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        elevation: 6.0,
                        child: Container(
                          padding: EdgeInsets.only(
                              top: appheight * 0.02,
                              bottom: appheight * 0.02,
                              left: appheight * 0.02,
                              right: appheight * 0.02),
                          child: Text(
                            '클릭시 상세정보 \n  페이지로 이동',
                            style: TextStyle(fontSize: 30, color: Colors.black),
                          ),
                        ))),
              ), //가이드 1페이지
              SizedBox(
                width: appheight * 0.45,
                height: appheight * 0.4,
                child: Align(
                    alignment: Alignment.bottomCenter,
                    child: SizedBox(
                      width: appheight * 0.5,
                      height: appheight * 0.1,
                      child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                              elevation: 4.0,
                              child: SizedBox(
                                width: appheight * 0.1,
                                height: appheight * 0.1,
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "지도 보기",
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.black),
                                  ),
                                ),
                              ),
                            ),
                            Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                              elevation: 4.0,
                              child: SizedBox(
                                width: appheight * 0.1,
                                height: appheight * 0.1,
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "홈으로",
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.black),
                                  ),
                                ),
                              ),
                            ),
                            Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                              elevation: 4.0,
                              child: SizedBox(
                                width: appheight * 0.1,
                                height: appheight * 0.1,
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "???",
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.black),
                                  ),
                                ),
                              ),
                            ),
                          ]),
                    )),
              ),
            ],
          ),
        ), //가이드 2페이지 홈 화면
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.contain,
              image: AssetImage('assets/guide/ditaile.png'),
              // 배경 이미지
            ),
          ),
          child: Column(children: <Widget>[
            SizedBox(
              width: appheight * 0.5,
              height: appheight * 0.6,
              child: Align(
                alignment: Alignment.bottomRight,
                child: SizedBox(
                    width: appheight * 0.3,
                    height: appheight * 0.4,
                    child: Column(children: [
                      SizedBox(
                        width: appheight * 0.15,
                        height: appheight * 0.1,
                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        elevation: 4.0,
                        child: SizedBox(
                            width: appheight * 0.1,
                            height: appheight * 0.1,
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                " 주차장 \n정보 표시",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.black),
                              ),
                            )),
                      ),
                      SizedBox(
                        width: appheight * 0.03,
                        height: appheight * 0.03,
                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        elevation: 4.0,
                        child: SizedBox(
                            width: appheight * 0.1,
                            height: appheight * 0.1,
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                "  상세 \n정보 표시",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.black),
                              ),
                            )),
                      ),
                    ])),
              ),
            )
          ]),
        ),
        Column(
          children: [
            Column(
              children: [
                Container(
                  padding: EdgeInsets.only(top: appheight * 0.1),
                  child: Text(
                    'The End',
                    style: TextStyle(fontSize: 70, color: Colors.black),
                  ),
                ),
                Container(
                    padding: EdgeInsets.only(top: appheight * 0.5),
                    child: Column(
                      children: [
                        Text(
                          "홈으로 돌아가",
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                        Text(
                          "한강정보 받아보기",
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                      ],
                    )),
                Container(
                    padding: EdgeInsets.only(
                        top: appheight * 0.02,
                        left: appheight * 0.05,
                        right: appheight * 0.05),
                    child: FloatingActionButton(
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.pop(context);
                      },
                      child: CircleAvatar(
                          radius: 40,
                          backgroundColor: Color.fromRGBO(255, 255, 255, 1),
                          child: CircleAvatar(
                              backgroundColor:
                                  Color.fromRGBO(168, 147, 255, 0.6),
                              radius: 35,
                              child: Icon(
                                Icons.favorite_border,
                                size: 30,
                                color: Colors.black,
                              ))),
                    ))
              ],
            )
          ],
        )
      ],
    );
  }
}
