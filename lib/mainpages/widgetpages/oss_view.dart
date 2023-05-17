import 'package:flutter/material.dart';

class OssView extends StatefulWidget {
  Map<String, dynamic> license;

  OssView(this.license);

  @override
  _OssView createState() => _OssView();
}

class _OssView extends State<OssView> {
  List isHiddens = [true, true, true, true, true];

  @override
  Widget build(BuildContext context) {
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
              padding: EdgeInsets.only(top: 15),
              child: Text(
                widget.license['name'],
                style: TextStyle(fontSize: 25, color: Colors.black),
              ),
            ),
          ],
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 249, 248, 253),
        elevation: 0.0,
      ),
      body: ListView(
        children: [
          OpenSourceView("Version", widget.license['version'] ?? "-", 60, 0),
          OpenSourceView("개요", widget.license['description'], 120, 1),
          OpenSourceView("HomePage", widget.license['homepage'] ?? "-", 80, 2),
          OpenSourceView(
              "repository", widget.license['repository'] ?? "-", 80, 3),
          OpenSourceView("라이선스", widget.license['license'] ?? "-", 300, 4),
        ],
      ),
    );
  }
}

class OpenSourceView extends StatefulWidget {
  String title;
  String content;
  double height;
  int boolcount;

  OpenSourceView(this.title, this.content, this.height, this.boolcount);
  @override
  _OpenSourceView createState() => _OpenSourceView();
}

class _OpenSourceView extends State<OpenSourceView> {
  List isHiddens = [true, true, true, true, true];

  @override
  Widget build(BuildContext context) {
    // TOD  @override

    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(top: 30, left: 20, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.title,
                style: TextStyle(fontSize: 25),
              ),
              IconButton(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                padding: EdgeInsets.zero, // 패딩 설정
                constraints: BoxConstraints(),
                alignment: Alignment.topLeft,
                onPressed: () {
                  setState(() {
                    isHiddens[widget.boolcount] = !isHiddens[widget.boolcount];
                  });
                },
                icon: Icon(
                  isHiddens[widget.boolcount]
                      ? Icons.keyboard_arrow_down_rounded
                      : Icons.close,
                  size: 30,
                ),
              ),
            ],
          ),
        ),
        Offstage(
          offstage: isHiddens[widget.boolcount],
          child: Container(
              decoration: BoxDecoration(
                // color: Color.fromARGB(255, 249, 248, 253),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(127, 249, 248, 253),
                  ),
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: -5,
                    blurRadius: 3,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              height: widget.height,
              // color: Color.fromARGB(255, 191, 188, 202),
              padding: EdgeInsets.all(20),
              child: ListView(
                children: [
                  Text(
                    widget.content,
                    style: TextStyle(fontSize: 15),
                  ),
                ],
              )),
        )
      ],
    );
  }
}
