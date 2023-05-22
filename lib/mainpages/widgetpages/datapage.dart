import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DataPage extends StatefulWidget {
  @override
  _DataPage createState() => _DataPage();
}

class _DataPage extends State<DataPage> {
  Widget Datafunc(String title, String url) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: EdgeInsets.only(left: 10),
          child: Text(title, style: TextStyle(fontSize: 25)),
        ),
        Container(
          padding: EdgeInsets.only(right: 10),
          child: TextButton(
            onPressed: () => _launchUrl("hi"),
            child: Text("바로가기"),
          ),
        ),
      ],
    );
  }

  Future<void> _launchUrl(String url) async {
    final Uri _url = Uri.parse(url);
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }

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
              padding: EdgeInsets.only(top: 15),
              child: Text(
                '사용 데이터',
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
          SizedBox(
            height: 10,
          ),
          Datafunc("서울열린데이터광장 도시데이터",
              "https://data.seoul.go.kr/dataVisual/seoul/guide.do"),
          SizedBox(
            height: 20,
          ),
          Datafunc("한국관광공사 국문 관광정보",
              "https://www.data.go.kr/iim/api/selectAPIAcountView.do"),
          SizedBox(
            height: 20,
          ),
          Datafunc("기상청 단기예보 조회",
              "https://www.data.go.kr/iim/api/selectAPIAcountView.do"),
          SizedBox(
            height: 20,
          ),
          Datafunc("한강사업본부 통합주차포털", "https://www.ihangangpark.kr/"),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
