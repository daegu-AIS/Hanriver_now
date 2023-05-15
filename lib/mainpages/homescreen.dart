import 'package:flutter/material.dart';
import 'package:hanriver_now/cards/PostCard.dart';
import 'package:hanriver_now/mainpages/mylikescreen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView.separated(
      itemCount: 10, //
      itemBuilder: (BuildContext context, int index) {
        return PostCard(
          number: index,
          areaInfo: AreaList[index],
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(
          height: 20,
        );
      },
    ));
  }
}
