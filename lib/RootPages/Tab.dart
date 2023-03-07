import 'package:flutter/material.dart';
import 'utils.dart';
import 'HomePage.dart';
import 'AlbumPage.dart';
import 'FilePage.dart';
import 'MinePage.dart';


class Tabs extends StatefulWidget {
  const Tabs({super.key});

  @override
  State<Tabs> createState() => _TabsState();
}

class _TabsState extends State<Tabs> {

  var _currentIndex = 0;

  final _pageList = const [
    HomePage(),
    FilePage(),
    AlbumPage(),
    MinePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageList[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home),label: '首页'),
          BottomNavigationBarItem(icon: Icon(Icons.edit_document),label: '文件'),
          BottomNavigationBarItem(icon: Icon(Icons.album),label: '相册'),
          BottomNavigationBarItem(icon: Icon(Icons.person),label: '我的')
        ],
        backgroundColor: Colors.white,
        currentIndex: _currentIndex,
        selectedItemColor: ColorUtils.hexColor('#5dd1a2'),
        selectedLabelStyle: TextStyle(fontSize: 11,color: ColorUtils.hexColor('#383636')),
        showUnselectedLabels: true,
        unselectedItemColor: ColorUtils.hexColor('#02190a'),
        unselectedLabelStyle: TextStyle(fontSize: 11,color: ColorUtils.hexColor('#999999')),
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
