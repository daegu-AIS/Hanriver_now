import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:xml2json/xml2json.dart';
import 'package:hanriver_now/areapages/areapage.dart';

class ApiTest {
  final String name;
  final String photo;

  ApiTest({required this.name, required this.photo});

  ApiTest.fromJson(Map<String, dynamic> json)
      : name = json[0],
        photo = json[0];

  Map<String, dynamic> toJson() => {
        'name': name,
        'photo': photo,
      };
}

class MyScreen extends StatefulWidget {
  @override
  _MyScreenState createState() => _MyScreenState();
}

class _MyScreenState extends State<MyScreen> {
  Future<ApiTest> _callAPI() async {
    final url = Uri.parse(
        'http://openapi.seoul.go.kr:8088/426562516e7768643130305972556f4d/xml/citydata/1/5/%EC%9E%A0%EC%8B%A4%ED%95%9C%EA%B0%95%EA%B3%B5%EC%9B%90');
    var response = await http.get(url);
    final getXmlData = response.body;
    final xml = Xml2Json()..parse(getXmlData);
    final jsonData = xml.toParker();
    // var data = ApiTest.fromJson(jsonDecode(json));
    var data = ApiTest.fromJson(jsonDecode(jsonData));
    // print(getXmlData);
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ElevatedButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => AreaPage("잠실한강공원", '970460')));
        },
        child: Text("잠실한강공원"),
      ),
      ElevatedButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      AreaPage('망원한강공원', '1059638'))); // 눌렀을때 데이터 전송
        },
        child: Text('망원한강공원'),
      ),
      ElevatedButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      AreaPage('이촌한강공원', '970636'))); // 눌렀을때 데이터 전송
        },
        child: Text('이촌한강공원'),
      ),
      ElevatedButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      AreaPage('반포한강공원', '2763875'))); // 눌렀을때 데이터 전송
        },
        child: Text('반포한강공원'),
      ),
      ElevatedButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      AreaPage('뚝섬한강공원', '1030763'))); // 눌렀을때 데이터 전송
        },
        child: Text('뚝섬한강공원'),
      ),
    ]);
  }
}
