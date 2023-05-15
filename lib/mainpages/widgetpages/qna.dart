import 'package:flutter/material.dart';

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
              padding: EdgeInsets.only(top: 10),
              child: Text(
                'QnA',
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
    );
  }
}
