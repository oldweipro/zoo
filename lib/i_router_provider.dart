import 'package:fluro/fluro.dart';

/// 创建一个抽象类，用于后续的各模块router实现此类进行路由注册初始化
abstract class IRouterProvider {
  void initRouter(Router router);
}
