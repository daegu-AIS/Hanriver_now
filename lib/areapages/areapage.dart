import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:xml2json/xml2json.dart';

class AreaPage extends StatefulWidget {
  final String areaName;
  final String contentid;

  const AreaPage(this.areaName, this.contentid);
  @override
  _AreaPageState createState() => _AreaPageState();
}

class _AreaPageState extends State<AreaPage> {
  void FlutterDialog(String text) {
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
                new Text("Overview"),
              ],
            ),
            //
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "${text}",
                ),
              ],
            ),
            actions: <Widget>[
              new TextButton(
                child: new Text("확인"),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }

  var overview = '';

  @override
  Widget build(BuildContext context) {
    final apiUrl1 =
        'http://openapi.seoul.go.kr:8088/426562516e7768643130305972556f4d/xml/citydata/1/5/' +
            '${widget.areaName}';
    final apiUrl2 =
        'https://apis.data.go.kr/B551011/KorService1/detailCommon1?serviceKey=jMXX6HpoTlWX73RSA8DY2Bcz6nQfa1wI34sfnXo0JSjZW%2FqC1C%2B1%2FmoHMaEsN5IQagpIoVRHDQdDhyy3cB1qkQ%3D%3D&MobileOS=ETC&MobileApp=AppTest&_type=json&contentId=' +
            '${widget.contentid}' +
            '&contentTypeId=12&defaultYN=Y&firstImageYN=Y&areacodeYN=Y&catcodeYN=Y&addrinfoYN=Y&mapinfoYN=Y&overviewYN=Y&numOfRows=10&pageNo=1'
                '${widget.areaName}';
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${widget.areaName}',
          style: TextStyle(
              fontFamily: 'EastSeaDokdo', fontSize: 40, color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Column(children: [
        FutureBuilder(
            future: http.get(Uri.parse(apiUrl1)),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                final getXmlData = snapshot.data!.body;
                final xml = Xml2Json()..parse(getXmlData);
                final jsonData = xml.toParker();

                var data = jsonDecode(jsonData);
                // var data = jsonDecode(snapshot.data);
                return Center(
                  child: Text(
                      "${data['SeoulRtd.citydata']['CITYDATA']['AREA_NM']}\n ${data['SeoulRtd.citydata']['CITYDATA']['LIVE_PPLTN_STTS']['LIVE_PPLTN_STTS']['AREA_CONGEST_LVL']}"),
                );
              } else {
                return Center();
              }
            }),
        FutureBuilder(
            future: http.get(Uri.parse(apiUrl2)),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                var getXmlData = snapshot.data!.body;
                var data = jsonDecode(utf8.decode(getXmlData.runes.toList()));
                overview =
                    data['response']['body']['items']['item'][0]['overview'];
                overview = overview.replaceAll(
                    RegExp('[^ac-qs-zA-Z0-9가-힣.\\sぁ-ゔァ-ヴー々〆〤一-龥]'), "");
                return Center(
                  child: Text(
                    "${overview}",
                    // "11",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                );
              } else {
                return Center();
              }
            }),
        ElevatedButton(
          onPressed: () => FlutterDialog(overview),
          child: Text(
            'Overview',
            style: TextStyle(fontSize: 30),
          ),
        ),
      ]),
    );
  }
}
