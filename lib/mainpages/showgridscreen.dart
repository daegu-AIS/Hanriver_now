import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hanriver_now/mainpages/mylikescreen.dart';
import 'package:hanriver_now/mainpages/widgetpages/opensoure.dart';
import 'package:hanriver_now/mainpages/widgetpages/dev.dart';
import 'package:hanriver_now/mainpages/widgetpages/service.dart';
import 'package:hanriver_now/mainpages/widgetpages/qna.dart';

class ShowGridScreen extends StatefulWidget {
  AreaInfo areaInfo;

  ShowGridScreen(this.areaInfo);
  @override
  _ShowGridScreen createState() => _ShowGridScreen();
}

class _ShowGridScreen extends State<ShowGridScreen> {
  final PageController controller =
      PageController(initialPage: 0, viewportFraction: 1);
  bool isHidden = false;
  bool isHidden1 = false;

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
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                ListView(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding:
                              EdgeInsets.only(left: appwidth * 0.1, top: 20),
                          // alignment: Alignment.center,
                          // color: Colors.amber,

                          child: Row(children: [
                            Container(
                              // padding: EdgeInsets.only(left: appwidth * 0.1),
                              // color: Colors.amber,
                              width: appwidth * 0.75,
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "오픈소스 라이선스",
                                style: TextStyle(fontSize: 30),
                              ),
                            ),
                            Container(
                              alignment: Alignment.center,
                              // color: Colors.red,
                              width: appwidth * 0.1,
                              child: IconButton(
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                padding: EdgeInsets.zero, // 패딩 설정
                                constraints: BoxConstraints(),
                                alignment: Alignment.topLeft,
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    PageRouteBuilder(
                                      pageBuilder: (context, a, b) {
                                        return OpenSource(gwangnaru);
                                      },
                                      transitionsBuilder: (
                                        BuildContext context,
                                        Animation<double> animation,
                                        Animation<double> secondaryAnimation,
                                        Widget child,
                                      ) {
                                        var begin = Offset(1.0, 0.0);
                                        var end = Offset.zero;
                                        var curve = Curves.ease;
                                        var tween = Tween(
                                                begin: begin, end: end)
                                            .chain(CurveTween(curve: curve));
                                        return SlideTransition(
                                          position: animation.drive(tween),
                                          child: child,
                                        );
                                      },
                                    ),
                                  );
                                },
                                icon: Icon(
                                  Icons.arrow_forward_ios,
                                  size: 25,
                                ),
                              ),
                            ),
                          ]),
                        ),
                        Container(
                          padding:
                              EdgeInsets.only(left: appwidth * 0.1, top: 20),
                          // alignment: Alignment.center,
                          // color: Colors.amber,

                          child: Row(children: [
                            Container(
                              // padding: EdgeInsets.only(left: appwidth * 0.1),
                              // color: Colors.amber,
                              width: appwidth * 0.75,
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "개발자",
                                style: TextStyle(fontSize: 30),
                              ),
                            ),
                            Container(
                              alignment: Alignment.center,
                              // color: Colors.red,
                              width: appwidth * 0.1,
                              child: IconButton(
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                padding: EdgeInsets.zero, // 패딩 설정
                                constraints: BoxConstraints(),
                                alignment: Alignment.topLeft,
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    PageRouteBuilder(
                                      pageBuilder: (context, a, b) {
                                        return Developer(gwangnaru);
                                      },
                                      transitionsBuilder: (
                                        BuildContext context,
                                        Animation<double> animation,
                                        Animation<double> secondaryAnimation,
                                        Widget child,
                                      ) {
                                        var begin = Offset(1.0, 0.0);
                                        var end = Offset.zero;
                                        var curve = Curves.ease;
                                        var tween = Tween(
                                                begin: begin, end: end)
                                            .chain(CurveTween(curve: curve));
                                        return SlideTransition(
                                          position: animation.drive(tween),
                                          child: child,
                                        );
                                      },
                                    ),
                                  );
                                },
                                icon: Icon(
                                  Icons.arrow_forward_ios,
                                  size: 25,
                                ),
                              ),
                            ),
                          ]),
                        ),
                        Container(
                          padding:
                              EdgeInsets.only(left: appwidth * 0.1, top: 20),
                          // alignment: Alignment.center,
                          // color: Colors.amber,

                          child: Row(children: [
                            Container(
                              // padding: EdgeInsets.only(left: appwidth * 0.1),
                              // color: Colors.amber,
                              width: appwidth * 0.75,
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "서비스 안내",
                                style: TextStyle(fontSize: 30),
                              ),
                            ),
                            Container(
                              alignment: Alignment.center,
                              // color: Colors.red,
                              width: appwidth * 0.1,
                              child: IconButton(
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                padding: EdgeInsets.zero, // 패딩 설정
                                constraints: BoxConstraints(),
                                alignment: Alignment.topLeft,
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    PageRouteBuilder(
                                      pageBuilder: (context, a, b) {
                                        return ServiceInfo(gwangnaru);
                                      },
                                      transitionsBuilder: (
                                        BuildContext context,
                                        Animation<double> animation,
                                        Animation<double> secondaryAnimation,
                                        Widget child,
                                      ) {
                                        var begin = Offset(1.0, 0.0);
                                        var end = Offset.zero;
                                        var curve = Curves.ease;
                                        var tween = Tween(
                                                begin: begin, end: end)
                                            .chain(CurveTween(curve: curve));
                                        return SlideTransition(
                                          position: animation.drive(tween),
                                          child: child,
                                        );
                                      },
                                    ),
                                  );
                                },
                                icon: Icon(
                                  Icons.arrow_forward_ios,
                                  size: 25,
                                ),
                              ),
                            ),
                          ]),
                        ),
                        Container(
                          padding:
                              EdgeInsets.only(left: appwidth * 0.1, top: 20),
                          // alignment: Alignment.center,
                          // color: Colors.amber,

                          child: Row(children: [
                            Container(
                              // padding: EdgeInsets.only(left: appwidth * 0.1),
                              // color: Colors.amber,
                              width: appwidth * 0.75,
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Q&A",
                                style: TextStyle(fontSize: 30),
                              ),
                            ),
                            Container(
                              alignment: Alignment.center,
                              // color: Colors.red,
                              width: appwidth * 0.1,
                              child: IconButton(
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                padding: EdgeInsets.zero, // 패딩 설정
                                constraints: BoxConstraints(),
                                alignment: Alignment.topLeft,
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    PageRouteBuilder(
                                      pageBuilder: (context, a, b) {
                                        return QnA(gwangnaru);
                                      },
                                      transitionsBuilder: (
                                        BuildContext context,
                                        Animation<double> animation,
                                        Animation<double> secondaryAnimation,
                                        Widget child,
                                      ) {
                                        var begin = Offset(1.0, 0.0);
                                        var end = Offset.zero;
                                        var curve = Curves.ease;
                                        var tween = Tween(
                                                begin: begin, end: end)
                                            .chain(CurveTween(curve: curve));
                                        return SlideTransition(
                                          position: animation.drive(tween),
                                          child: child,
                                        );
                                      },
                                    ),
                                  );
                                },
                                icon: Icon(
                                  Icons.arrow_forward_ios,
                                  size: 25,
                                ),
                              ),
                            ),
                          ]),
                        ),
                        Container(
                          padding:
                              EdgeInsets.only(left: appwidth * 0.1, top: 20),

                          // alignment: Alignment.center,
                          // color: Colors.amber,
                          child: Row(children: [
                            Container(
                              // padding: EdgeInsets.only(left: appwidth * 0.1),
                              // color: Colors.amber,
                              width: appwidth * 0.75,
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "앱 버전",
                                style: TextStyle(fontSize: 30),
                              ),
                            ),
                            Container(
                              alignment: Alignment.center,
                              // color: Colors.red,
                              width: appwidth * 0.1,
                              child: IconButton(
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                padding: EdgeInsets.zero, // 패딩 설정
                                constraints: BoxConstraints(),
                                alignment: Alignment.topLeft,
                                onPressed: () {
                                  setState(() {
                                    isHidden1 = !isHidden1;
                                  });
                                },
                                icon: Icon(
                                  isHidden1
                                      ? Icons.arrow_drop_down
                                      : Icons.close,
                                  size: 30,
                                ),
                              ),
                            ),
                          ]),
                        ),
                        Offstage(
                          offstage: isHidden1,
                          child: Container(
                            width: appwidth * 0.85,
                            height: 100,
                            color: Color.fromARGB(255, 191, 188, 202),
                            child: Icon(
                              Icons.flutter_dash,
                              size: 70,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  height: 70,
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        icon: Icon(Icons.map),
                        onPressed: () {
                          // Get.toNamed('/mylike');
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
                          // Navigator.push(context, PageRouteBuilder(
                          //   pageBuilder: (context, a, b) {
                          //     return ShowGridScreen(gwangnaru);
                          //   },
                          // )
                          // );
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
