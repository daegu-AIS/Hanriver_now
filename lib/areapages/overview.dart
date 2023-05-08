import 'package:flutter/material.dart';
import 'package:hanriver_now/areapages/overview.dart';
import 'package:hanriver_now/mainpages/mylikescreen.dart';

class OverView extends StatefulWidget {
  // AreaInfo areaInfo;

  // OverView(this.areaInfo);

  @override
  _OverView createState() => _OverView();
}

class _OverView extends State<OverView> {
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
            CircleAvatar(
              backgroundColor: Color.fromARGB(255, 228, 222, 255),
              radius: 25,
            ),
            Text(
              '한강은 지금',
              style: TextStyle(
                  fontFamily: 'EastSeaDokdo',
                  fontSize: 40,
                  color: Colors.black),
            ),
          ],
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 249, 248, 253),
        elevation: 0.0,
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
                            "assets/images/뚝섬한강공원.jpg",
                            fit: BoxFit.cover,
                          ),
                          Image.asset(
                            "assets/images/여의도한강공원야경.jpg",
                            fit: BoxFit.cover,
                          ),
                          Image.asset(
                            "assets/images/난지한강공원야경.jpg",
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
                          padding: EdgeInsets.only(left: 20, top: 10),
                          child: Text(
                            "광나루 한강 공원",
                            style: TextStyle(
                                fontSize: 40,
                                color: Color.fromARGB(255, 168, 147, 255)),
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
