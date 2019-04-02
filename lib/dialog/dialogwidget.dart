import 'package:flutter/material.dart';

class DialogWidget extends StatefulWidget {
  DialogWidget({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _DialogWidgetState createState() => new _DialogWidgetState();
}

class _DialogWidgetState extends State<DialogWidget>  {

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      body: Container(
         child: AlertDialog(title: Text('提示'),
           content: Text(widget.title),
           actions: <Widget>[FlatButton(child: Text('确定'),
               onPressed: (){ Navigator.of(context).pop();} ,)],),)// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
