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
    // BottomNavigationBarItem(
    //   label: '홈',
    //   icon: Icon(Icons.home_filled),
    // ),
    BottomNavigationBarItem(
        label: '모아보기',
        backgroundColor: Color.fromARGB(200, 168, 147, 255),
        icon: Icon(
          Icons.home_outlined,
          size: 30,
        )),
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
    // HomeScreen(),
    MyLikeScreen(),
    MyScreen(),
    HomeScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 249, 248, 253),
      appBar: AppBar(
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
                '한강은 지금',
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

      bottomNavigationBar: BottomNavigationBar(
        iconSize: 20,
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
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     // FAB를 눌렀을 때 수행할 동작
      //   },
      //   child: Icon(Icons.home_outlined),
      //   backgroundColor: Color.fromARGB(200, 168, 147, 255),
      //   foregroundColor: Colors.white,
      //   heroTag: 'Inset FAB',
      //   hoverColor: Colors.purpleAccent,
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      // floatingActionButton: FloatingActionButton(
      //   child: Icon(Icons.home_outlined),
      //   onPressed: () {},
      //   backgroundColor: Color.fromARGB(200, 168, 147, 255),
      // ),
      // floatingActionButtonLocation:
      //     FloatingActionButtonLocation.miniCenterDocked,
    );
  }
}
