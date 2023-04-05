import 'dart:math';

import 'package:flutter/material.dart';

class PostCard extends StatefulWidget {
  int number;
  PostCard({this.number = 0});

  @override
  _PostCardState createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
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
                  Expanded(
                    child: Text(
                      '내용',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
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
