import 'package:flutter/material.dart';

class FocusWidget extends StatefulWidget {
  FocusWidget({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _FocusWidgetState createState() => new _FocusWidgetState();
}

class _FocusWidgetState extends State<FocusWidget>  {
  var _focus = false;

  void _onTapDown(TapDownDetails details) {
    setState(() {
      _focus = true;
    });
  }

  void _onTapUp(TapUpDetails details) {
    setState(() {
      _focus = false;
    });
  }

  void _onTabCancel() {
    setState(() {
      _focus = false;
    });
  }

  void _onTab() {
    final snackBar = SnackBar(content: Text("试试就试试"),);
    Scaffold.of(context).showSnackBar(snackBar);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTab,
      onTapDown: _onTapDown,
      onTapUp:  _onTapUp,
      onTapCancel: _onTabCancel,
      child: Container(
        color: _focus? Colors.blue:Colors.white,
        height: 50,
        alignment: Alignment.center,
        child: Text('点我一下试试'),
      ),
    );
  }
}
