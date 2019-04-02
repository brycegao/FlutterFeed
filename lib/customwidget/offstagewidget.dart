import 'package:flutter/material.dart';

/**
 * 模拟点击展开布局， 再次点击收缩布局
 */
class OffstageWidget extends StatefulWidget {
  OffstageWidget({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _OffstageWidgetState createState() => new _OffstageWidgetState();
}

class _OffstageWidgetState extends State<OffstageWidget> with WidgetsBindingObserver {
  AppLifecycleState _lastLifecycleState;
  bool _offstate = true;

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
    setState(() {
      _offstate = !_offstate;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      padding: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('测试展开/收缩布局', style: TextStyle(color: Colors.white,
                     fontSize: 20),),
              GestureDetector(
                onTap: _onPressed,
                child: Text('点我啊', style: TextStyle(color: Colors.white,
                     fontSize: 20),),
              )
            ],
          ),
          SizedBox(height: 10,),
          Offstage(
            offstage: _offstate,
            child: Text('冒个泡, 我是隐藏布局', style: TextStyle(color:Colors.white,
                  fontSize: 30),),
          )
        ],
      ),
    );
  }
}
