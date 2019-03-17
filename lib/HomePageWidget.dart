/**
 * 实现首页ViewPage效果
**/

import 'package:flutter/material.dart';

class HomePageWidget extends StatefulWidget {
  HomePageWidget({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _HomePageWidgetState createState() => new _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> with WidgetsBindingObserver {
  int _currentPageIndex = 0;
  var _pageController = new PageController(initialPage: 0);

  AppLifecycleState _lastLifecycleState;

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
  }

  void _onPressed() {
  }

  @override
  Widget build(BuildContext context) {
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return new Scaffold(
      appBar: new AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: new Text("测试ViewPager"),
      ),
      body: new PageView.builder(
        onPageChanged: _pageChange,
        controller: _pageController,
        itemBuilder: (BuildContext context, int index) {
          return new Text("我是第$index页");
        },
        itemCount: 3,
      ),
      bottomNavigationBar: new BottomNavigationBar(items: [
        BottomNavigationBarItem(
          icon: new Icon(Icons.category), title: new Text("首页"),
        ),
        BottomNavigationBarItem(
          icon: new Icon(Icons.message), title: new Text("我的")
        )],
        currentIndex: _currentPageIndex,
        onTap: _onTap),
    );
  }

  void _onTap(int index) {
    _pageController.animateToPage(index,
        duration: const Duration(microseconds: 300),
        curve: Curves.ease);
  }
  void _pageChange(int index) {
    print("pageChange index: $index");

    setState(() {
      if (_currentPageIndex != index) {
        _currentPageIndex = index;
      }
    });
  }
}
