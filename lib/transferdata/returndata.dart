import 'package:flutter/material.dart';

class ReturnDataWidget extends StatefulWidget {
  ReturnDataWidget({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _ReturnDataWidgetState createState() => new _ReturnDataWidgetState();
}

class _ReturnDataWidgetState extends State<ReturnDataWidget> {


  //内容改变的回调
  void _onTextChange(String str) {
    print(str);
  }

  @override
  Widget build(BuildContext context) {
    final _controller = TextEditingController();
    _controller.addListener(() {
      print('input ${_controller.text}');
    });

    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(widget.title),
        ),
        body: Container(padding: EdgeInsets.all(10),
           child: Column(children: <Widget>[
             Text('请随便输入点什么', style: TextStyle(fontSize: 18),),
             TextField(onChanged: _onTextChange,
               maxLength: 30,
                maxLines: 1,
                style: TextStyle(fontSize: 18, color: Colors.blue),
                onSubmitted: (text) {
                  print('点击了enter键');
                },
               decoration: InputDecoration(fillColor: Colors.white,
                     helperText: '请输入点什么吧',
                     helperStyle: TextStyle(fontSize: 18, color: Colors.grey)
                    ),
               enabled: true,
                controller: _controller,),
             SizedBox(height: 20,),
             TextField(decoration: InputDecoration(
               contentPadding: EdgeInsets.all(8),
               border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0))
             ),),
             SizedBox(height: 20,),
             TextField(decoration: InputDecoration(
                 contentPadding: EdgeInsets.all(8),
                 hintText: '请输入点东西吧， 且有焦点时边框会变色',
                 border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
             ),),
             SizedBox(height: 20,),
             TextField(textAlign: TextAlign.end,
               decoration: InputDecoration(
                 contentPadding: EdgeInsets.all(8),
                 hintText: '我是hint，且靠右对齐. 有焦点时边框不变色',
                 focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
                 border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
               ),),
             SizedBox(height: 20,),
             Text('下面是有下划线的输入栏， 实际开发中经常遇到'),
             TextField(decoration: InputDecoration(
               contentPadding: EdgeInsets.all(3),
               border: InputBorder.none
             ),),
             Container(color: Colors.grey, height: 1,),
             SizedBox(height: 20,),
             Container(height: 50, width: 100,
                child: RaisedButton(onPressed: (){
                  Navigator.of(context).pop('我是返回值');
                }, child: Text('点我啊'),),)
           ],),));
  }
}
