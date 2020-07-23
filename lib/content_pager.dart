import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zoo/card_recommend.dart';
import 'package:zoo/card_share.dart';
import 'package:zoo/card_special.dart';
import 'package:zoo/custom_appbar.dart';
import 'package:zoo/card_contacts.dart';

class ContentPager extends StatefulWidget {
  final ValueChanged<int> onPageChanged;
  final ContentPagerController contentPagerController;

  // 构造方法
  const ContentPager({Key key, this.onPageChanged, this.contentPagerController})
      : super(key: key);

  // 初始化列表
  @override
  _ContentPagerState createState() => _ContentPagerState();
}

// widget就是State中的范型ContentPager
class _ContentPagerState extends State<ContentPager> {
  PageController _pageController = PageController(
      // 视窗比例,一页显示多个，缩小左右间距
      viewportFraction: 0.8);

  @override
  void initState() {
    // 当state被创建的时候
    if (widget.contentPagerController != null) {
      widget.contentPagerController._pageController = _pageController;
    }
    _statusBar();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CustomAppBar(),
        // appBar PageView滑动组件
        Expanded(
          // 撑开高度，否则在column中没有高度会报错
          child: PageView(
            onPageChanged: widget.onPageChanged,
            controller: _pageController,
            children: <Widget>[
              _widgetWrapItem(CardRecommend()),
              _widgetWrapItem(CardShare()),
              _widgetWrapItem(CardContacts()),
              _widgetWrapItem(CardSpecial()),
            ],
          ),
        )
      ],
    );
  }

  Widget _widgetWrapItem(Widget widget) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: widget,
    );
  }

  // 设置沉浸式状态栏
  _statusBar() {
    SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(
      systemNavigationBarColor: Color(0xFF000000),
      systemNavigationBarDividerColor: null,
      // 兼容安卓，需设置颜色透明
      statusBarColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
    );
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}

// 内容区域的控制器
class ContentPagerController {
  PageController _pageController;

  void jumpToPage(int page) {
    // dart 编程技巧：安全调用 加？
    _pageController?.jumpToPage(page);
  }
}
