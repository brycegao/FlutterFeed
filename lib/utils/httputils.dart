/// 处理网络交互
/// 使用dio组件 https://github.com/flutterchina/dio
///

import 'package:dio/dio.dart';

///test单元测试返回400， 运行程序功能正常
void testGetHttp() async {
  try {
    Response response = await Dio().get("http://www.baidu.com");

    print(response);
  } catch (e) {
    print(e);
  }
}

