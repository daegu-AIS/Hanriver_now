import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:xml2json/xml2json.dart';

class MyLikeScreen extends StatefulWidget {
  int number;
  MyLikeScreen({this.number = 0});
  @override
  _MyLikeScreenState createState() => _MyLikeScreenState();
}

class _MyLikeScreenState extends State<MyLikeScreen> {
  final String apiUrl =
      'http://openapi.seoul.go.kr:8088/426562516e7768643130305972556f4d/xml/citydata/1/5/%EC%9E%A0%EC%8B%A4%ED%95%9C%EA%B0%95%EA%B3%B5%EC%9B%90';
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: http.get(Uri.parse(apiUrl)),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            final getXmlData = snapshot.data!.body;
            final xml = Xml2Json()..parse(getXmlData);
            final jsonData = xml.toParker();
            var data = jsonDecode(jsonData);
            // var data = jsonDecode(snapshot.data);
            return Center(
              child:
                  Text("${data['SeoulRtd.citydata']['CITYDATA']['AREA_NM']}"),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
