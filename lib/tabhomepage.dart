///
/// 实现tabbarview式首页
/// 
/// 缺陷是有导航栏

import 'package:flutter/material.dart';

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

  ///todo 先用静态数据
  final List<Tab> myTabs = <Tab> [
    Tab(text: '推荐',),
    Tab(text: '北京'),
    Tab(text: '行情',),
    Tab(text: '大V观点',)
  ];

  TabController _controller;

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

    _controller = TabController(length: myTabs.length,
        vsync: ScrollableState());
  }

  void _onPressed() {
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: myTabs.length,
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
                  tabs: myTabs,
                ),toolbarOpacity: 0.0,),
                preferredSize: Size.fromHeight(50)),
            body: TabBarView(children: myTabs.map((Tab tab){
              return Center(child: Text(tab.text),);
            }).toList(),),
          ));
  }

}
