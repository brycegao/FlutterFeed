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

  void _onTabClick(int index) {
    print("点击了$index");

    showDialog(context: context,
        builder: (_) =>  AlertDialog(title: Text("提示"),
            content: Text("点击了$index"),
            actions: <Widget>[
              FlatButton(child: Text('确定'),
               onPressed: () {
                print("点击了确定");
                Navigator.of(context).pop();
                _pageChange(index);
               },)
            ],));
  }

  @override
  Widget build(BuildContext context) {
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return new Scaffold(
      appBar: PreferredSize(
          child: AppBar(

          ),
          preferredSize: Size(0, 0)),
      body: Column(children: <Widget>[
        new SizedBox(height: 50,
          child: Row(mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  _onTabClick(0);
                },
                child:  Text("推荐", style: new TextStyle(
                    color: const Color(0xff3072f6),
                    fontSize: 18.0,
                    decoration: TextDecoration.underline,
                    decorationStyle: TextDecorationStyle.solid
                )),
              )
              ,
              SizedBox(width: 16.0,),
              GestureDetector(
                  onTap: () {
                    _onTabClick(1);
                  },
                  child:  Text("北京", style: new TextStyle(
                      color: const Color(0xff222222),
                      fontSize: 18.0
                  ),)),
              SizedBox(width: 16.0,),
              GestureDetector(
                  onTap: () {
                    _onTabClick(2);
                  },
                  child:
                  Text("行情", style: new TextStyle(
                      color: const Color(0xff222222),
                      fontSize: 18.0
                  ),)),
              SizedBox(width: 16.0,),
              Text("大V观点", style: new TextStyle(
                  color: const Color(0xff222222),
                  fontSize: 18.0
              ),)
            ],
          ),
        ),

        Expanded(child: PageView.builder(
            itemCount: 4,
            onPageChanged: _pageChange, controller: _pageController,
            itemBuilder: (context, index) {
                return Container(height: 800,
                  child: ListView(children: <Widget>[
                    ListTile(title: Text("dddd"),),
                    ListTile(title: Text("1111"),),
                    ListTile(title: Text("2222"),),
                    ListTile(title: Text("3333"),),
                    ListTile(title: Text("444"),),
                    ListTile(title: Text("dddd"),),
                    ListTile(title: Text("1111"),),
                    ListTile(title: Text("2222"),),
                    ListTile(title: Text("3333"),),
                    ListTile(title: Text("444"),),
                    ListTile(title: Text("dddd"),),
                    ListTile(title: Text("1111"),),
                    ListTile(title: Text("2222"),),
                    ListTile(title: Text("3333"),),
                    ListTile(title: Text("444"),),
                    ListTile(title: Text("dddd"),),
                    ListTile(title: Text("1111"),),
                    ListTile(title: Text("2222"),),
                    ListTile(title: Text("3333"),),
                    ListTile(title: Text("444"),),
                    ListTile(title: Text("dddd"),),
                    ListTile(title: Text("1111"),),
                    ListTile(title: Text("2222"),),
                    ListTile(title: Text("3333"),),
                    ListTile(title: Text("444"),),
                    ListTile(title: Text("dddd"),),
                    ListTile(title: Text("1111"),),
                    ListTile(title: Text("2222"),),
                    ListTile(title: Text("3333"),),
                    ListTile(title: Text("444"),),
                    ListTile(title: Text("dddd"),),
                    ListTile(title: Text("1111"),),
                    ListTile(title: Text("2222"),),
                    ListTile(title: Text("3333"),),
                    ListTile(title: Text("444"),),
                  ],),);
            }
                 ))
      ],)

    );
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
