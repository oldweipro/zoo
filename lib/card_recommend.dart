import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zoo/base_card.dart';

// 本周推荐
class CardRecommend extends BaseCard {

  @override
  _CardRecommendState createState() => _CardRecommendState();
}

class _CardRecommendState extends BaseCardState {
  @override
  void initState() {
    subTitleColor = Color(0xffb99444);
    super.initState();
  }

  @override
  topTitle(String title) {
    // TODO: implement topTitle
    return super.topTitle('本周推荐');
  }

  @override
  Widget subTitle(String title) {
    return super.subTitle('送你一天无限卡·全场书籍免费送 >');
  }

  @override
  bottomContent() {
    // 高度撑满
    return Expanded(
      child: Container(
        // 通过BoxConstraints尽可能撑开父容器
        constraints: BoxConstraints.expand(),
        margin: EdgeInsets.only(top: 20),
        child:
        Image.network(
          'http://www.devio.org/io/flutter_beauty/card_1.jpg',
          // 宽高充满父容器，会裁切
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
