import 'package:flutter/material.dart';
import 'package:flutter_refresh/flutter_refresh.dart';
import 'package:flutter_feed/model/recommand.dart';
import 'package:flutter_feed/model/channelinfo.dart';
import 'package:flutter_feed/customwidget/rightimageItemwidget.dart';
import 'package:flutter_feed/customwidget/threeimagewidget.dart';

class ContentWidget extends StatefulWidget {
  List dataItems;

  ContentWidget({Key key, this.title, this.dataItems}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _ContentWidgetState createState() => new _ContentWidgetState(dataItems);
}

class _ContentWidgetState extends State<ContentWidget> with AutomaticKeepAliveClientMixin {
  List dataItems;

  _ContentWidgetState(this.dataItems):super();

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
    super.build(context);
    return new Scaffold(
      body: Container(
        padding: EdgeInsets.only(left: 24, right: 24, ),
        child: new Refresh(
          onFooterRefresh: onFooterRefresh,
          onHeaderRefresh: onHeaderRefresh,
          childBuilder: (BuildContext context,
              {ScrollController controller, ScrollPhysics physics}) {
            return new Container(
                child: new ListView.builder(
                  physics: physics,
                  controller: controller,
                  itemCount: dataItems.length,
                  itemBuilder: (context, item) {
                    return _getItemWidgetByIndex(item);
                  },
                ));
          },
        ),
      )
    );
  }

  // TODO: implement wantKeepAlive
  @override
  bool get wantKeepAlive => true;

  ///根据下标返回对应的item widget
  Widget _getItemWidgetByIndex(int index) {
    if (dataItems != null && index < dataItems.length) {
      Recommand data = Recommand.fromJson(dataItems[index]);

      //根据类型生成对应的控件widget
      if (data.type == 1) {
        return ThreeImageWidget(currentData: data,);
      } else {
        return RightImageWidget(currentData: data,);
      }
    }
    return ListTile(title: Text('dddd'),);
  }

  // 下拉刷新
  Future<Null> onHeaderRefresh() {
    return new Future.delayed(new Duration(seconds: 2), () {

    });
  }

  // 加载刷新
  Future<Null> onFooterRefresh() async {
    return new Future.delayed(new Duration(seconds: 2), () {

    });
  }

}
