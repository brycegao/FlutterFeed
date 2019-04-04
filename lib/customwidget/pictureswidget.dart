import 'package:flutter/material.dart';

class PictureWidget extends StatefulWidget {
  PictureWidget({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _PictureWidgetState createState() => new _PictureWidgetState();
}

class _PictureWidgetState extends State<PictureWidget> with WidgetsBindingObserver {

  Widget _getFirstLine() {
    return Container(height: 120,
      color: Colors.white,
      alignment: Alignment.center,
      child: Row(children: <Widget>[
        SizedBox(width: 20,),
        Text('预置资源原图'),
        SizedBox(width: 10,),
        Image.asset('assets/image/icon_beike_haofang.png')
      ],),
    );
  }

  //装饰者模式， 设置容器的decoration参数来添加背景图
  Widget _getSecondLine() {
    return Container(
      height: 170,
      child: Center(child: Text('假装我是ViewGroup，有个蓝色背景图', style: TextStyle(color: Colors.white),),),
      decoration: BoxDecoration(image:
          DecorationImage(
              image: ExactAssetImage('assets/image/luck_draw_pop_bg.png',),
              fit: BoxFit.fill),
              ));
  }

  //矩形框
  Widget _getThreeLine() {
    return Container(padding: EdgeInsets.all(10),
        child: Container(height: 100,
           child: Center(child: Text('我是输入栏背景方框,圆角5dp'),),
           decoration: BoxDecoration(color: Colors.white,
               borderRadius: BorderRadius.circular(5.0),
               border: Border.all(color: Colors.grey, width: 1.0)),),
      );
  }

  //圆形图
  Widget _getFourLine() {
    return Container(padding: EdgeInsets.all(10),
      color: Colors.green,
      alignment: Alignment.center,
      child: Row(children: <Widget>[
        SizedBox(width: 20,),
        Text('圆形图片'),
        SizedBox(width: 20,),
        Container(height: 100, width: 100,
          child:         ClipOval(child: Image.asset('assets/image/icon_beike_haofang.png'),),)

      ],),);
  }



  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: ListView(children: <Widget>[
        _getFirstLine(),
        Container(height: 10,
        color: Colors.red,),
        _getSecondLine(),
        Container(height: 10,),
        _getThreeLine(),
        SizedBox(height: 10,),
        _getFourLine(),
      ],)
    );
  }
}
