///3个图片的widget
///Image占位图 https://flutterchina.club/cookbook/images/fading-in-images/
import 'package:flutter/material.dart';
import 'package:flutter_feed/model/recommand.dart';

class ThreeImageWidget extends StatelessWidget {
  Recommand currentData;
  ThreeImageWidget({Key key, this.currentData}) : super(key: key);

  List<Widget> _getPicWidget() {
    List<Widget> list = List();
    for (int i = 0; i < currentData.pic.length; i++) {

      list.add(Expanded(
        child: Image.network(currentData.pic[i], height: 80,),
      ));

      if (i != currentData.pic.length - 1) {
        list.add(SizedBox(width: 6, height: 80,));
      }
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final snackBar = SnackBar(content: Text("press"),);
        Scaffold.of(context).showSnackBar(snackBar);
      },
      child: Container(
        padding: EdgeInsets.only(top: 14, bottom: 0),
        child: Column(
          children: <Widget>[
            Text(currentData.title,
               style: TextStyle(fontSize: 17, color: Color(0xff222222)),),
            SizedBox(height: 11,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:_getPicWidget(),
            ),
            SizedBox(height: 12,),
            Row(mainAxisAlignment: MainAxisAlignment.start,
               children: <Widget>[Text(currentData.beike_name, style: TextStyle(fontSize: 12,
                   color: Color(0xff999999)),)],),
            SizedBox(height: 14,),
            Divider(color: Color(0xff999999),)
          ],
        ),
      ),
    );
  }
}
