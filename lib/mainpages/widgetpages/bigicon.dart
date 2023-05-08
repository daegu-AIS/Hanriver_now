import 'package:flutter/material.dart';
import 'package:hanriver_now/mainpages/mylikescreen.dart';
import 'package:hanriver_now/areapages/areapage.dart';
import 'package:hanriver_now/areapages/overview.dart';
import 'package:hanriver_now/areapages/gwangnaru.dart';

class BigWidget extends StatefulWidget {
  AreaInfo areaInfo;

  BigWidget(this.areaInfo);
  @override
  _BigWidget createState() => _BigWidget();
}

class _BigWidget extends State<BigWidget> {
  @override
  Widget build(BuildContext context) {
    final appheight = MediaQuery.of(context).size.height;
    final appwidth = MediaQuery.of(context).size.width;
    return Container(
      color: Color.fromARGB(255, 249, 248, 253),
      margin: EdgeInsets.only(top: 20, left: 20, right: 20),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: Image.asset("assets/images/난지한강공원야경.jpg").image,
                fit: BoxFit.fill,
              ),
            ),
            height: appheight * 0.21,
            width: appwidth * 0.64,
            alignment: Alignment.center,
          ),
          Positioned(
            top: (appheight * 0.21 - appheight * 0.16) / 2,
            left: appwidth - (appwidth * 0.41) - 60,
            child: InkWell(
              splashColor: Color.fromARGB(255, 156, 137, 77),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => OverView()));
              },
              child: Container(
                decoration: BoxDecoration(
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
                height: appheight * 0.16,
                width: appwidth * 0.45,
                alignment: Alignment.center,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: appheight * 0.16 * 0.05,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 3),
                            width: appwidth * 0.45 * 0.78,
                            height: appheight * 0.158 * 0.25,
                            child: Text(
                              "${widget.areaInfo.areaName} 한강 공원",
                              style:
                                  TextStyle(fontSize: appwidth * 0.45 * 0.13),
                            ),
                          ),
                          Column(
                            children: [
                              SizedBox(
                                width: appwidth * 0.45 * 0.2,
                                height: appheight * 0.158 * 0.01,
                              ),
                              SizedBox(
                                width: appwidth * 0.45 * 0.14,
                                height: appwidth * 0.45 * 0.14,
                                child: CircleAvatar(
                                  backgroundColor:
                                      Color.fromARGB(255, 241, 237, 255),
                                  child: Icon(
                                    Icons.favorite,
                                    size: appwidth * 0.45 * 0.14 * 0.7,
                                    color: Color.fromARGB(255, 211, 200, 255),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        width: appwidth * 0.45 * 0.80,
                        child: Text(
                          "서울특별시 강동구 선사로 83-66",
                          style: TextStyle(fontSize: appwidth * 0.45 * 0.07),
                        ),
                      ),
                      Container(
                          width: appwidth * 0.45 * 0.80,
                          height: appheight * 0.158 * 0.25,
                          alignment: Alignment.topLeft,
                          padding: EdgeInsets.only(left: 5, top: 3),
                          child: Row(
                            children: [
                              Icon(
                                Icons.star,
                                size: appwidth * 0.45 * 0.07,
                                color: Colors.yellow[700],
                              ),
                              Icon(
                                Icons.star,
                                size: appwidth * 0.45 * 0.07,
                                color: Colors.yellow[700],
                              ),
                              Icon(
                                Icons.star_half,
                                size: appwidth * 0.45 * 0.07,
                                color: Colors.yellow[700],
                              ),
                              Icon(
                                Icons.star_border_outlined,
                                size: appwidth * 0.45 * 0.07,
                                color: Colors.yellow[700],
                              ),
                              Icon(
                                Icons.star_border_outlined,
                                size: appwidth * 0.45 * 0.07,
                                color: Colors.yellow[700],
                              ),
                            ],
                          )),
                      SizedBox(
                        width: appwidth * 0.45 * 0.8,
                        height: appheight * 0.158 * 0.13,
                        child: Row(
                          children: [
                            Icon(
                              Icons.circle,
                              size: appwidth * 0.45 * 0.065,
                              color: Color.fromARGB(255, 211, 200, 255),
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Text(" 운영시간 : 오전 9시 ~ 오후 10시",
                                  style: TextStyle(
                                      fontSize: appwidth * 0.45 * 0.065)),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: appwidth * 0.45 * 0.8,
                        height: appheight * 0.158 * 0.13,
                        child: Row(
                          children: [
                            Icon(
                              Icons.circle,
                              size: appwidth * 0.45 * 0.065,
                              color: Color.fromARGB(255, 211, 200, 255),
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                " 운영시간 : 오전 9시 ~ 오후 10시",
                                style: TextStyle(
                                    fontSize: appwidth * 0.45 * 0.065),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ]),
              ),
            ),
          ),
          InkWell(
            splashColor: Color.fromARGB(255, 156, 137, 77),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => GwangNaRu()));
            },
            child: Container(
              alignment: Alignment.centerRight,
              padding:
                  EdgeInsets.only(right: appwidth * 0.04, top: appwidth * 0.1),
              width: appwidth,
              height: appheight * 0.16,
              child: Text("이동"),
            ),
          ),
        ],
      ),
    );
  }
}
