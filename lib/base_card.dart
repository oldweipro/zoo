import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

// 卡片基类
class BaseCard extends StatefulWidget {
  @override
  BaseCardState createState() => BaseCardState();
}

class BaseCardState extends State<BaseCard> {
  Color subTitleColor = Colors.grey;
  Color bottomTitleColor = Colors.grey;

  @override
  Widget build(BuildContext context) {
    // 裁切圆角
    return PhysicalModel(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(6),
      // 抗锯齿
      clipBehavior: Clip.antiAlias,
      child: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: Column(
          children: <Widget>[topContent(), bottomContent()],
        ),
      ),
    );
  }

  topContent() {
    return Padding(
        padding: EdgeInsets.only(left: 20, top: 26, bottom: 20),
        child: Column(
          // 排列方式
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              // 向下对齐
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[topTitle(''), topMiniTitle()],
            ),
            subTitle(''),
          ],
        ));
  }

  bottomContent() {
    return Container();
  }

  bottomTitle(String title) {
    return Text(title, textAlign: TextAlign.center, style: TextStyle(fontSize: 12, color: bottomTitleColor),);
  }

  Widget subTitle(String title) {
    return Padding(
      padding: EdgeInsets.only(top: 5),
      child: Text(
        title,
        style: TextStyle(fontSize: 11, color: subTitleColor),
      ),
    );
  }

  topTitle(String title) {
    return Text(
      title,
      style: TextStyle(fontSize: 22),
    );
  }

  topMiniTitle() {
    return Container();
  }

  testGet() async {
    Response response;
    Dio dio = Dio();
    // 请求参数也可以通过对象传递，上面的代码等同于：
    response =
        await dio.get('http://wthrcdn.etouch.cn/weather_mini', queryParameters: {'city': '西安'});
    print(response.data.toString());
  }

  @override
  void initState() {
    super.initState();
  }
}
