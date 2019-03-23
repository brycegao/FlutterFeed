///
/// 实现tabbarview式首页
/// 
/// 缺陷是有导航栏

import 'package:flutter/material.dart';

import 'package:flutter_feed/utils/httputils.dart';
import 'package:flutter_feed/model/channelinfo.dart';
import 'package:flutter_feed/customwidget/threeimagewidget.dart';
import 'package:flutter_feed/customwidget/rightimageItemwidget.dart';


class TabViewHomePage extends StatefulWidget {
  TabViewHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _TabViewHomePageState createState() => new _TabViewHomePageState();
}

class _TabViewHomePageState extends State<TabViewHomePage> with WidgetsBindingObserver {
  AppLifecycleState _lastLifecycleState;
  var _listChannels = List();  //频道信息
  var _mapContent = Map<int, dynamic>();  //存储内容区域的数据

  List<Tab> getTabs() {
    List<Tab> list = List();

    if (_listChannels == null || _listChannels.length == 0) {
      list.add(Tab(text: "推荐",));
      list.add(Tab(text: "热门",));
      list.add(Tab(text: "大v",));
      list.add(Tab(text: "新闻",));
    } else {
      for (int i = 0; i < _listChannels.length; i++) {

          var channel = ChannelInfo.fromJson(_listChannels[i]);
          Tab tab = Tab(text: channel.name,);
          list.add(tab);

      }
    }

    if (list.length == 0) {
      list.add(Tab(text: "推荐",));

    }
    return list;
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    _lastLifecycleState = state;
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);

    getCurrentPageData();
  }


  //获取渠道列表
  void getCurrentPageData() async {
    var list = await FeedHttpUtils.getInstance().getFeed();
    //刷新 频道
    setState(() {
      if (list != null) {
        _listChannels.addAll(list);
      }
    });

    //刷新内容
    if (list != null && list.length > 0) {
      for (int i = 0; i < list.length; i++) {
        var channel = ChannelInfo.fromJson(list[i]);
        refreshPageContent(channel.key);
      }
    }

  }

  void refreshPageContent(String channel) async {
    var list = await FeedHttpUtils.getInstance().getAdviseData(int.parse(channel));

    //刷新内容区域
    setState(() {
      if (list != null) {
        _mapContent[int.parse(channel)] = list;
      }
    });
  }

  void _onPressed() {
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: getTabs().length,
          child: Scaffold(
            appBar:PreferredSize(
                child: AppBar(backgroundColor: Colors.white, bottom: TabBar(
                  indicatorColor: Color(0xff3072f6),
                  indicatorSize: TabBarIndicatorSize.label,
                  labelColor: Color(0xff3072f6),
                  unselectedLabelColor: Color(0xff222222),
                  indicatorWeight: 3,
                  labelStyle: TextStyle(fontSize: 16),
                  indicatorPadding: EdgeInsets.only(left: 8, right: 8),
                  labelPadding: EdgeInsets.only(left: 8, right: 8),
                  tabs: getTabs(),
                ),toolbarOpacity: 1.0,),
                preferredSize: Size.fromHeight(100)),
            body: TabBarView(children: getTabs().map((Tab tab){
              return ListView(children: <Widget>[
                RightImageWidget(),
                ThreeImageWidget(),
                RightImageWidget(),
                ThreeImageWidget(),
                RightImageWidget(),
                ThreeImageWidget(),
                RightImageWidget(),
                ThreeImageWidget(),
                RightImageWidget(),
                ThreeImageWidget(),
                RightImageWidget(),
                ThreeImageWidget(),

                ListTile(title: Text("444"),),
              ],);
            }).toList(),),
          ));
  }

}
