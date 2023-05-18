import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QnA extends StatefulWidget {
  @override
  _QnA createState() => _QnA();
}

class _QnA extends State<QnA> {
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
                'QnA',
                style: TextStyle(fontSize: 25, color: Colors.black),
              ),
            ),
          ],
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 249, 248, 253),
        elevation: 0.0,
      ),
      body: QA(),
    );
  }
}

class QA extends StatelessWidget {
  const QA({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final appheight = MediaQuery.of(context).size.height;
    return ListView(
      scrollDirection: Axis.vertical,
      children: <Widget>[
        buildQAT(
            "질문",
            "대답",
            Icon(
              Icons.access_alarm,
              size: 50,
            ),
            Icon(
              Icons.access_alarm,
              size: 50,
            ),
            context),
        buildQAT(
            "질문",
            "대답",
            Icon(
              Icons.access_alarm,
              size: 50,
            ),
            Icon(
              Icons.access_alarm,
              size: 50,
            ),
            context),
        buildQAT(
            "질문",
            "대답",
            Icon(
              Icons.access_alarm,
              size: 50,
            ),
            Icon(
              Icons.access_alarm,
              size: 50,
            ),
            context)
      ],
    );
  }
}

Widget buildQAT(String q, String a, Icon fi, Icon si, BuildContext context) {
  final appheight = MediaQuery.of(context).size.height;
  final appwidth = MediaQuery.of(context).size.width;
  return ListTile(
    leading: fi,
    title: SizedBox(
      height: appheight * 0.09,
      child: Align(
        alignment: Alignment.center,
        child: Text(
          q,
          style: TextStyle(fontSize: 20),
        ),
      ),
    ),
    trailing: si,
    onTap: () {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext ctx) {
          return AlertDialog(
            content: Text(
              a,
              style: TextStyle(fontSize: 20),
            ),
            actions: [
              Center(
                child: TextButton(
                  child: Text("OK"),
                  onPressed: () {
                    Navigator.pop(ctx);
                  },
                ),
              ),
            ],
          );
        },
      );
    },
  );
}
