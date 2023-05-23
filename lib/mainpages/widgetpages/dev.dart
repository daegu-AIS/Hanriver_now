import 'package:flutter/material.dart';

class Developer extends StatefulWidget {
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
              padding: EdgeInsets.only(top: 15),
              child: Text(
                '개발자',
                style: TextStyle(fontSize: 25, color: Colors.black),
              ),
            ),
          ],
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 249, 248, 253),
        elevation: 0.0,
      ),
      body: DevPage(),
    );
  }
}

class DevPage extends StatelessWidget {
  const DevPage({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final appwidth = MediaQuery.of(context).size.width;
    final appheight = MediaQuery.of(context).size.height;
    var name = 'assets/guide/qor.jpg';
    return ListView(
      children: <Widget>[
        DevInfo(
            'qor.png', '한종혁', '25', '팀장', '전기전자전공', '3', '플러터 어렵노', context),
        DevInfo(
            'qor.png', '백종현', '23', '팀원', '컴퓨터 공학과', '2', '플러터 어렵노', context),
        DevInfo('qor.png', '이인호', '23', '팀원', 'AI공학부', '2', '플러터 어렵노', context)
      ],
    );
  }
}

Widget DevInfo(String devimg, String name, String age, String position,
    String major, String grade, String han, BuildContext context) {
  final appheight = MediaQuery.of(context).size.height;
  final appwidth = MediaQuery.of(context).size.width;
  return SizedBox(
    width: appwidth,
    height: appheight * 0.4,
    child: Column(children: <Widget>[
      Row(
        //0.85 0.2
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
            elevation: 4.0,
            child: Container(
                width: appwidth * 0.25,
                height: appheight * 0.14,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/guide/$devimg'), // 배경 이미지
                  ),
                )),
          ),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
            elevation: 4.0,
            child: SizedBox(
              width: appwidth * 0.6,
              height: appheight * 0.14,
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  "이름: $name \n나이: $age\n직책: $position",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ),
        ],
      ),
      SizedBox(
        width: appwidth,
        height: appheight * 0.02,
      ),
      Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        elevation: 4.0,
        child: SizedBox(
          width: appwidth * 0.85,
          height: appheight * 0.2,
          child: Align(
            alignment: Alignment.center,
            child: Text(
              "학교: 대구대학교 \n학과: $major \n학년: $grade \n한마디: $han ",
              style: TextStyle(fontSize: 20),
            ),
          ),
        ),
      ),
    ]),
  );
}
