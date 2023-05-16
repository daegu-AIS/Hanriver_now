import 'package:flutter/material.dart';
import 'package:hanriver_now/mainpages/mylikescreen.dart';
import 'package:flutter/services.dart';

class OverView extends StatefulWidget {
  AreaInfo areaInfo;

  OverView(this.areaInfo);

  @override
  _OverView createState() => _OverView();
}

class _OverView extends State<OverView> {
  final PageController controller =
      PageController(initialPage: 0, viewportFraction: 1);
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
        ),
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Column(
              children: [
                Expanded(
                  child: ListView(
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
                                          EdgeInsets.only(left: 20, top: 10),
                                      child: Text(
                                        "${widget.areaInfo.areaName} 한강 공원",
                                        style: TextStyle(
                                            fontSize: 40,
                                            color: Color.fromARGB(
                                                255, 168, 147, 255)),
                                      ),
                                    )
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
                                child: Text(
                                    "운동시설 (인공암벽장, 축구장, 농구장, 테니스장, 족구장 등)",
                                    style: TextStyle(fontSize: 20)),
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 20, top: 1),
                                // color: Color.fromARGB(255, 255, 0, 0),
                                width: appwidth * 0.9,
                                child: Text("수영장 (7~8월 개장)",
                                    style: TextStyle(fontSize: 20)),
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 20, top: 1),
                                // color: Color.fromARGB(255, 255, 0, 0),
                                width: appwidth * 0.9,
                                child: Text("눈썰매장 (12월 ~ 2월 개장)",
                                    style: TextStyle(fontSize: 20)),
                              ),
                              Container(
                                padding: EdgeInsets.only(
                                    left: 20, top: 1, bottom: 10),
                                // color: Color.fromARGB(255, 255, 0, 0),
                                width: appwidth * 0.9,
                                child: Text("뚝섬윈드서핑장",
                                    style: TextStyle(fontSize: 20)),
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
                          padding: EdgeInsets.only(
                              left: 40, top: 5, right: 40, bottom: 20),
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
                                child: Text(
                                    "운동시설 (인공암벽장, 축구장, 농구장, 테니스장, 족구장 등)",
                                    style: TextStyle(fontSize: 20)),
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 20, top: 1),
                                // color: Color.fromARGB(255, 255, 0, 0),
                                width: appwidth * 0.9,
                                child: Text("수영장 (7~8월 개장)",
                                    style: TextStyle(fontSize: 20)),
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 20, top: 1),
                                // color: Color.fromARGB(255, 255, 0, 0),
                                width: appwidth * 0.9,
                                child: Text("눈썰매장 (12월 ~ 2월 개장)",
                                    style: TextStyle(fontSize: 20)),
                              ),
                              Container(
                                padding: EdgeInsets.only(
                                    left: 20, top: 1, bottom: 10),
                                // color: Color.fromARGB(255, 255, 0, 0),
                                width: appwidth * 0.9,
                                child: Text("뚝섬윈드서핑장",
                                    style: TextStyle(fontSize: 20)),
                              ),
                            ]),
                          )),
                    ],
                  ),
                ),
              ],
            ),
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
                        icon: Icon(Icons.map),
                        onPressed: () {
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => MyLikeScreen()));
                        },
                      ),
                      SizedBox(
                        width: appwidth / 4,
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.info,
                          size: 30,
                        ),
                        onPressed: () {
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => MyLikeScreen()));
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
                                color: Colors.black,
                              ),
                              onPressed: () {
                                Navigator.push(context, PageRouteBuilder(
                                  pageBuilder: (context, a, b) {
                                    return MyLikeScreen();
                                  },
                                ));
                              },
                            ))

                        // IconButton(
                        //   alignment: Alignment.topCenter,
                        //   icon: Icon(
                        //     Icons.home,
                        //     size: 30,
                        //     color: Colors.black,
                        //   ),
                        //   onPressed: () {
                        //     Navigator.push(
                        //         context,
                        //         MaterialPageRoute(
                        //             builder: (context) => ShowGridScreen()));
                        //   },
                        // ),
                        ),
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
