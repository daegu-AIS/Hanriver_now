import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hanriver_now/mainpages/homescreen.dart';
import 'package:hanriver_now/mainpages/mylikescreen.dart';
import 'package:hanriver_now/mainpages/myscreen.dart';
import 'package:hanriver_now/mainpages/showgridscreen.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  List<BottomNavigationBarItem> bottomItems = [
    BottomNavigationBarItem(
      label: '홈',
      icon: Icon(Icons.home_filled),
    ),
    BottomNavigationBarItem(
      label: '모아보기',
      icon: Icon(Icons.grid_view),
    ),
    BottomNavigationBarItem(
      label: '좋아요',
      icon: Icon(Icons.favorite),
    ),
    BottomNavigationBarItem(
      label: '마이페이지',
      icon: Icon(Icons.person),
    ),
  ];
  List pages = [
    HomeScreen(),
    MyLikeScreen(),
    MyScreen(),
    ShowGridScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '한강은 지금',
          style: TextStyle(
              fontFamily: 'EastSeaDokdo', fontSize: 40, color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey.withOpacity(.60),
        selectedFontSize: 14,
        unselectedFontSize: 13,
        currentIndex: _selectedIndex,
        showSelectedLabels: false, // 라벨명 안뜨게
        showUnselectedLabels: false, // 라벨명 안뜨게
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: bottomItems,
      ),
      body: pages[_selectedIndex],
    );
  }
}
