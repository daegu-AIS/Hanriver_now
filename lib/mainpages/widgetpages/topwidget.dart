import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:ntp/ntp.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:xml2json/xml2json.dart';

class TopWidget extends StatefulWidget {
  @override
  _TopWidget createState() => _TopWidget();
}

class _TopWidget extends State<TopWidget> {
  Future<DateTime> DateTimeNow() async {
    DateTime _myTime;
    _myTime = await NTP.now();
    _myTime = _myTime.toUtc().add(Duration(hours: 9));

    return _myTime;
  }

  @override
  Widget build(BuildContext context) {
    final appheight = MediaQuery.of(context).size.height;
    final appwidth = MediaQuery.of(context).size.width;
    return Container(
      color: Color.fromARGB(255, 249, 248, 253),
      width: appwidth,
      height: 120,
      child: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(45),
              image: DecorationImage(
                image: NetworkImage(
                  "http://tong.visitkorea.or.kr/cms2/website/66/2540166.jpg",
                ),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                    Colors.white.withOpacity(0.3), BlendMode.dstATop),
              ),
            ),
            margin: EdgeInsets.only(left: appwidth / 4),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(45),
              image: DecorationImage(
                image: NetworkImage(
                  "http://tong.visitkorea.or.kr/cms2/website/66/2540166.jpg",
                ),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                    Colors.white.withOpacity(0.5), BlendMode.dstATop),
              ),
            ),
            margin: EdgeInsets.only(left: appwidth / 2),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(45),
                bottomLeft: Radius.circular(45),
              ),
              image: DecorationImage(
                image: NetworkImage(
                  "http://tong.visitkorea.or.kr/cms2/website/66/2540166.jpg",
                ),
                fit: BoxFit.cover,
              ),
            ),
            margin: EdgeInsets.only(left: appwidth / 4 * 3),
          ),
          SizedBox(
            width: appwidth,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                width: appwidth,
                child: Text(
                  "반가워요!",
                  style: TextStyle(
                      fontFamily: 'EastSeaDokdo',
                      fontSize: 30,
                      color: Colors.black),
                  textAlign: TextAlign.left,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                width: appwidth,
                child: Text(
                  "오늘 한강관련 축제를",
                  style: TextStyle(
                      fontFamily: 'EastSeaDokdo',
                      fontSize: 30,
                      color: Colors.black),
                  textAlign: TextAlign.left,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                width: appwidth,
                child: Text(
                  "즐겨봐요",
                  style: TextStyle(
                      fontFamily: 'EastSeaDokdo',
                      fontSize: 30,
                      color: Colors.black),
                  textAlign: TextAlign.left,
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
