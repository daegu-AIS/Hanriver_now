import 'dart:convert';
import 'dart:math';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiTest {
  final String name;
  final String photo;

  ApiTest({required this.name, required this.photo});

  ApiTest.fromJson(List<dynamic> json, int index)
      : name = json[index]['contentid'],
        photo = json[index]['firstimage'];

  Map<String, dynamic> toJson() => {
        'name': name,
        'photo': photo,
      };
}

class PostCard extends StatefulWidget {
  int number;
  PostCard({this.number = 0});

  @override
  _PostCardState createState() => _PostCardState();
}

// jMXX6HpoTlWX73RSA8DY2Bcz6nQfa1wI34sfnXo0JSjZW/qC1C+1/moHMaEsN5IQagpIoVRHDQdDhyy3cB1qkQ==

class _PostCardState extends State<PostCard> {
  final String apiUrl =
      'https://apis.data.go.kr/B551011/KorService1/searchFestival1?numOfRows=10&pageNo=1&MobileOS=AND&MobileApp=MobileApp&_type=json&eventStartDate=20230410&serviceKey=jMXX6HpoTlWX73RSA8DY2Bcz6nQfa1wI34sfnXo0JSjZW%2FqC1C%2B1%2FmoHMaEsN5IQagpIoVRHDQdDhyy3cB1qkQ%3D%3D';

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          height: 50,
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Row(children: [
              CircleAvatar(
                radius: 20,
                backgroundImage: NetworkImage(
                    'https://picsum.photos/seed/${widget.number}/400/400'),
              ),
              SizedBox(
                width: 10,
              ),
              Text('사용자 ${widget.number}'),
            ]),
            Icon(Icons.more_vert)
          ]),
        ),
        Container(
            height: 300,
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            child: Image.network(
              'https://picsum.photos/seed/${widget.number}/400/400',
              fit: BoxFit.cover,
            )),
        Container(
          height: 40,
          padding: EdgeInsets.symmetric(horizontal: 10),
          width: MediaQuery.of(context).size.width,
          color: Colors.white10,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.favorite_border),
                  SizedBox(
                    width: 7,
                  ),
                  Icon(Icons.chat_bubble_outline),
                  SizedBox(
                    width: 7,
                  ),
                  Icon(Icons.send),
                ],
              ),
              Icon(Icons.bookmark_border)
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          height: 35,
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
          child: Row(
            children: [
              Text(
                '좋아요 ${widget.number}개',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                width: 20,
              ),
              Text(
                '사용자 ${widget.number}님 외 ${Random().nextInt(100)}명',
                style: TextStyle(fontSize: 20),
              )
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          height: 80,
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    '사용자 ${widget.number}',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 100,
                  ),
                  Text(
                    '제목',
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
              Row(
                children: [
                  FutureBuilder(
                      future: http.get(Uri.parse(apiUrl)),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.hasData) {
                          var data = jsonDecode(snapshot.data!.body);
                          return Text(
                            "hi ${data['response']['body']['items']['item'][widget.number]['contentid']}",
                            style: TextStyle(fontSize: 40),
                          );
                        } else {
                          return CircularProgressIndicator();
                        }
                      }),
                ],
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          height: 25,
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                '댓글 ${Random().nextInt(100)}개 모두 보기',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w100),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          height: 50,
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
          child: Column(
            children: [
              Row(
                children: [
                  Text("아이디 ${Random().nextInt(100)}",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "댓글",
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
              Row(
                children: [
                  Text("아이디 ${Random().nextInt(100)}",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "댓글",
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          height: 50,
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 15,
                  backgroundImage: NetworkImage(
                      'https://picsum.photos/seed/${widget.number}/400/400'),
                ),
                SizedBox(
                  width: 10,
                ),
                Text('댓글 달기..', style: TextStyle(fontSize: 20)),
              ],
            ),
            Icon(Icons.post_add, size: 30)
          ]),
        ),
      ],
    ));
  }
}
