import 'dart:ffi';

import 'package:flutter/material.dart';

class SmallWidget extends StatefulWidget {
  final String smallImage;
  final double smailmargin;
  final String areaName;

  const SmallWidget(this.smallImage, this.smailmargin, this.areaName);

  @override
  _SmallWidget createState() => _SmallWidget();
}

class _SmallWidget extends State<SmallWidget> {
  @override
  Widget build(BuildContext context) {
    final appheight = MediaQuery.of(context).size.height;
    final appwidth = MediaQuery.of(context).size.width;
    return Container(
      height: 80,
      width: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: NetworkImage(
            widget.smallImage,
          ),
          fit: BoxFit.fitHeight,
        ),
      ),
      margin: EdgeInsets.only(left: widget.smailmargin),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            widget.areaName,
            style: TextStyle(color: Colors.red, fontSize: 30),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
