import 'package:flutter/material.dart';
import 'package:hanriver_now/mainpages/mylikescreen.dart';

class ServiceInfo extends StatefulWidget {
  AreaInfo areaInfo;
  ServiceInfo(this.areaInfo);

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
    return PageView(
      children: <Widget>[
        Column(
          children: [
            Container(
                child: Container(
              padding: EdgeInsets.only(top: 40),
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
              padding: EdgeInsets.only(top: 500),
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
                    padding: EdgeInsets.only(top: 40),
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
                        top: 50, bottom: 50, left: 50, right: 50),
                    child: Text(
                      '날씨 정보 제공',
                      style: TextStyle(
                          fontFamily: 'EastSeaDokdo',
                          fontSize: 30,
                          color: Colors.black),
                    ),
                  )),
              Container(
                width: 300,
                height: 300,
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
                              top: 10, bottom: 10, left: 10, right: 10),
                          child: Text(
                            '클릭시 상세정보 \n  페이지로 이동',
                            style: TextStyle(
                                fontFamily: 'EastSeaDokdo',
                                fontSize: 30,
                                color: Colors.black),
                          ),
                        ))),
              ),
              Container(
                color: Colors.red,
                width: 500,
                height: 300,
                child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      color: Colors.yellow,
                      width: 500,
                      height: 120,
                      child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                                color: Colors.blue, width: 100, height: 100),
                            Container(
                                color: Colors.black, width: 100, height: 100),
                            Container(
                                color: Colors.pink, width: 100, height: 100),
                          ]),
                    )),
              ),
            ],
          ),
        )
      ],
    );
  }
}
