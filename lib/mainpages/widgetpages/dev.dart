import 'package:flutter/material.dart';
import 'package:hanriver_now/mainpages/mylikescreen.dart';

class Developer extends StatefulWidget {
  AreaInfo areaInfo;
  Developer(this.areaInfo);

  @override
  _Developer createState() => _Developer();
}

class _Developer extends State<Developer> {
  @override
  Widget build(BuildContext context) {
    final appheight = MediaQuery.of(context).size.height;
    final appwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.pop(context);
          },
          color: Colors.black,
        ),
        toolbarHeight: 70,
        title: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Image.asset(
              'assets/images/title_icon.png',
              fit: BoxFit.cover,
              height: 50,
            ),
            Container(
              padding: EdgeInsets.only(top: 10),
              child: Text(
                '개발자',
                style: TextStyle(
                    fontFamily: 'EastSeaDokdo',
                    fontSize: 40,
                    color: Colors.black),
              ),
            ),
          ],
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 249, 248, 253),
        elevation: 0.0,
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Column(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // 반가워요! 컨테이너
                        Row(
                          children: [
                            Container(
                              color: Color.fromARGB(255, 249, 248, 253),
                              width: 25,
                            ),
                            Container(
                              color: Color.fromARGB(255, 249, 248, 253),
                              width: appwidth - 50,
                              height: 100,
                            ),
                            Container(
                              color: Color.fromARGB(255, 249, 248, 253),
                              width: 25,
                            ),
                          ],
                        ),
                        // 작은 아이콘 컨테이너
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
