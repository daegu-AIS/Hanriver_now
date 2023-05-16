import 'package:flutter/material.dart';

class ServiceInfo extends StatefulWidget {
  @override
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
              fit: BoxFit.cover,
              height: 50,
            ),
            Container(
              padding: EdgeInsets.only(top: 10),
              child: Text(
                '서비스',
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
      ),
      body: SV(),
    );
  }
}

class SV extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appheight = MediaQuery.of(context).size.height;
    final appwidth = MediaQuery.of(context).size.width;
    return PageView(
      children: <Widget>[
        Column(
          children: [
            Container(
                child: Container(
              padding: EdgeInsets.only(top: appheight * 0.1),
              child: Text(
                'App Guide',
                style: TextStyle(
                    fontFamily: 'EastSeaDokdo',
                    fontSize: 70,
                    color: Colors.black),
              ),
            )),
            Container(
                child: Container(
              padding: EdgeInsets.only(top: appheight * 0.5),
              child: Text(
                '옆으로 슬라이드',
                style: TextStyle(
                    fontFamily: 'EastSeaDokdo',
                    fontSize: 30,
                    color: Colors.black),
              ),
            )),
            Container(
                child: Container(
                    padding: EdgeInsets.only(top: appheight * 0.05),
                    child: Icon(size: 40.0, Icons.swipe_left)))
          ],
        ),
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
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
                      style: TextStyle(
                          fontFamily: 'EastSeaDokdo',
                          fontSize: 30,
                          color: Colors.black),
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
                            style: TextStyle(
                                fontFamily: 'EastSeaDokdo',
                                fontSize: 30,
                                color: Colors.black),
                          ),
                        ))),
              ), //가이드 1페이지
              Container(
                width: appheight * 0.45,
                height: appheight * 0.4,
                child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
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
                              child: Container(
                                width: appheight * 0.1,
                                height: appheight * 0.1,
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "지도 보기",
                                    style: TextStyle(
                                        fontFamily: 'EastSeaDokdo',
                                        fontSize: 30,
                                        color: Colors.black),
                                  ),
                                ),
                              ),
                            ),
                            Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                              elevation: 4.0,
                              child: Container(
                                width: appheight * 0.1,
                                height: appheight * 0.1,
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "홈으로",
                                    style: TextStyle(
                                        fontFamily: 'EastSeaDokdo',
                                        fontSize: 30,
                                        color: Colors.black),
                                  ),
                                ),
                              ),
                            ),
                            Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                              elevation: 4.0,
                              child: Container(
                                width: appheight * 0.1,
                                height: appheight * 0.1,
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "???",
                                    style: TextStyle(
                                        fontFamily: 'EastSeaDokdo',
                                        fontSize: 30,
                                        color: Colors.black),
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
          color: Colors.yellow,
        ) //가이드 3페이지 지도보기
      ],
    );
  }
}
