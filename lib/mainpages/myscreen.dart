import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiTest {
  final String name;
  final String photo;

  ApiTest({required this.name, required this.photo});

  ApiTest.fromJson(Map<String, dynamic> json)
      : name = json['response']['body']['items']['item'][1]['contentid'],
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
        'https://apis.data.go.kr/B551011/KorService1/searchFestival1?numOfRows=10&pageNo=1&MobileOS=AND&MobileApp=MobileApp&_type=json&eventStartDate=20230410&serviceKey=jMXX6HpoTlWX73RSA8DY2Bcz6nQfa1wI34sfnXo0JSjZW%2FqC1C%2B1%2FmoHMaEsN5IQagpIoVRHDQdDhyy3cB1qkQ%3D%3D');
    var response = await http.get(url);
    var data = ApiTest.fromJson(jsonDecode(response.body));
    print(data.name);
    return data;
    // print('Response body: ${data.name} ${data.photo}');
  }

  @override
  Widget build(BuildContext context) {
    var data;
    return Column(children: [
      ElevatedButton(
        onPressed: data = _callAPI,
        child: Text('${data}'),
      ),
      Text(
        '${data}',
        style: TextStyle(fontSize: 20),
      ),
    ]);
  }
}
