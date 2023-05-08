import 'package:flutter/material.dart';
import 'package:hanriver_now/mainpages/mylikescreen.dart';

class SmallWidget extends StatefulWidget {
  AreaInfo areaInfo;
  double smailmargin;
  SmallWidget(this.areaInfo, this.smailmargin);

  @override
  _SmallWidget createState() => _SmallWidget();
}

class _SmallWidget extends State<SmallWidget> {
  @override
  Widget build(BuildContext context) {
    final appheight = MediaQuery.of(context).size.height;
    final appwidth = MediaQuery.of(context).size.width;
    return Container(
      height: appwidth * 0.14,
      width: appwidth * 0.14,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: NetworkImage(
            widget.areaInfo.nightview,
          ),
          fit: BoxFit.fitHeight,
        ),
      ),
      margin: EdgeInsets.only(left: widget.smailmargin),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            widget.areaInfo.areaName,
            style:
                TextStyle(color: Colors.white, fontSize: appwidth * 0.14 * 0.5),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
