import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hanriver_now/mainpages/widgetpages/oss_view.dart';

class OpenSource extends StatefulWidget {
  @override
  _OpenSource createState() => _OpenSource();
}

class _OpenSource extends State<OpenSource> {
  Future<dynamic> readJson() async {
    final String response =
        await rootBundle.loadString('assets/json/licenses.json');
    final data = await json.decode(response);
    return data;
  }

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
                  '오픈소스 라이선스',
                  style: TextStyle(fontSize: 25, color: Colors.black),
                ),
              ),
            ],
          ),
          centerTitle: true,
          backgroundColor: Color.fromARGB(255, 249, 248, 253),
          elevation: 0.0,
        ),
        body: FutureBuilder(
          future: readJson(),
          builder: ((context, snapshot) {
            return ListView(
              children: [
                for (int i = 0; i < snapshot.data.length; i++)
                  Row(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: 60,
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.only(left: 25),
                        child: Text(
                          snapshot.data[i]['name'],
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.2,
                        // color: Colors.red,
                        child: IconButton(
                          icon: Icon(Icons.arrow_forward_ios),
                          onPressed: () {
                            Navigator.push(context, PageRouteBuilder(
                              pageBuilder: (context, a, b) {
                                print(snapshot.data[i].runtimeType);
                                return OssView(snapshot.data[i]);
                              },
                            ));
                          },
                        ),
                      )
                    ],
                  )
              ],
            );
          }),
        ));
  }
}
