import 'package:flutter/material.dart';
import 'package:hanriver_now/mainpages/mylikescreen.dart';

class BigWidget extends StatefulWidget {
  AreaInfo areaInfo;

  BigWidget(this.areaInfo);
  @override
  _BigWidget createState() => _BigWidget();
}

class _BigWidget extends State<BigWidget> {
  @override
  Widget build(BuildContext context) {
    final appheight = MediaQuery.of(context).size.height;
    final appwidth = MediaQuery.of(context).size.width;
    return Container(
      color: Color.fromARGB(255, 249, 248, 253),
      margin: EdgeInsets.only(top: 20, left: 20, right: 20),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: NetworkImage(
                  widget.areaInfo.areaImage,
                ),
                fit: BoxFit.fill,
              ),
            ),
            height: appheight * 0.21,
            width: appwidth * 0.64,
            alignment: Alignment.center,
          ),
          Positioned(
            top: (appheight * 0.21 - appheight * 0.158) / 2,
            left: 200,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              height: appheight * 0.158,
              width: appwidth * 0.41,
              alignment: Alignment.center,
            ),
          ),
          // InkWell(
          //   splashColor: Color.fromARGB(255, 156, 137, 77),
          //   onTap: () {
          //     Navigator.push(
          //         context,
          //         MaterialPageRoute(
          //             builder: (context) => AreaPage('망원한강공원', '1059638')));
          //   },
          //   child: Container(
          //     color: Color.fromARGB(255, 169, 79, 73),
          //     // height: appwidth / 3 - 10,
          //     // width: appwidth / 3 - 10,
          //     child: Text(
          //       "망원한강공원",
          //       style: TextStyle(
          //         fontSize: 30,
          //       ),
          //     ),
          //     alignment: Alignment.center,
          //   ),
          // ),
        ],
      ),
    );
  }
}
