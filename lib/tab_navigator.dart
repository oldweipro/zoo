import 'package:flutter/material.dart';
import 'package:zoo/content_pager.dart';

/// 底部导航框架搭建
class TabNavigator extends StatefulWidget {
  @override
  _TabNavigatorState createState() => _TabNavigatorState();
}

class _TabNavigatorState extends State<TabNavigator> {
  final _defaultColor = Colors.grey;
  final _activeColor = Colors.blue;
  int _currentIndex = 0;
  final ContentPagerController _contentPagerController =
      ContentPagerController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Color(0xffedeef0), Color(0xffe6e7e9)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)),
        child: ContentPager(
          contentPagerController: _contentPagerController,
          onPageChanged: (int index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          _bottomItem('本周', Icons.apps, 0),
          _bottomItem('免费', Icons.android, 1),
          _bottomItem('分享', Icons.share, 2),
          _bottomItem('我的', Icons.people, 3),
        ],
        currentIndex: _currentIndex,
        onTap: (index) {
          _contentPagerController.jumpToPage(index);
          // 修改状态
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
      ),
    );
  }

  _bottomItem(String title, IconData iconData, int index) {
    return BottomNavigationBarItem(
        // 非选中
        icon: Icon(iconData, color: _defaultColor),
        // 选中
        activeIcon: Icon(iconData, color: _activeColor),
        title: Text(
          title,
          style: TextStyle(
              color: _currentIndex != index ? _defaultColor : _activeColor),
        ));
  }
}
