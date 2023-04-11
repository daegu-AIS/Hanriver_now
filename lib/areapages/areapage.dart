import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:xml2json/xml2json.dart';

class AreaPage extends StatefulWidget {
  final String areaName;

  const AreaPage(this.areaName);
  @override
  _AreaPageState createState() => _AreaPageState();
}

class _AreaPageState extends State<AreaPage> {
  @override
  Widget build(BuildContext context) {
    final apiUrl =
        'http://openapi.seoul.go.kr:8088/426562516e7768643130305972556f4d/xml/citydata/1/5/' +
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
      body: Center(
        child: FutureBuilder(
            future: http.get(Uri.parse(apiUrl)),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                final getXmlData = snapshot.data!.body;
                final xml = Xml2Json()..parse(getXmlData);
                final jsonData = xml.toParker();
                var data = jsonDecode(jsonData);
                print("ddd ${data['SeoulRtd.citydata']}");
                // var data = jsonDecode(snapshot.data);
                return Center(
                  child: Text(
                      "${data['SeoulRtd.citydata']['CITYDATA']['AREA_NM']}"),
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
      ),
    );
  }
}
