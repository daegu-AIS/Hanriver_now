import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MyLikeScreen extends StatefulWidget {
  int number;
  MyLikeScreen({this.number = 0});
  @override
  _MyLikeScreenState createState() => _MyLikeScreenState();
}

class _MyLikeScreenState extends State<MyLikeScreen> {
  final String apiUrl =
      'https://apis.data.go.kr/B551011/KorService1/searchFestival1?numOfRows=10&pageNo=1&MobileOS=AND&MobileApp=MobileApp&_type=json&eventStartDate=20230410&serviceKey=jMXX6HpoTlWX73RSA8DY2Bcz6nQfa1wI34sfnXo0JSjZW%2FqC1C%2B1%2FmoHMaEsN5IQagpIoVRHDQdDhyy3cB1qkQ%3D%3D';

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: http.get(Uri.parse(apiUrl)),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            var data = jsonDecode(snapshot.data!.body);
            return Center(
              child: Text(data['response']['body']['items']['item']
                  [int.parse('1')]['contentid']),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
