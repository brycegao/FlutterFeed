///
/// 左边是文案， 右边是图片
/// 对应250看到频道—iOS标注 推荐第一行
///

import 'package:flutter/material.dart';
import 'package:flutter_feed/model/recommand.dart';

class RightImageWidget extends StatelessWidget {
  Recommand currentData;
  RightImageWidget({Key key, this.currentData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final snackBar = SnackBar(content: Text("press"),);
        Scaffold.of(context).showSnackBar(snackBar);
      },
      child: Container(
        padding: EdgeInsets.only(top: 16, bottom: 16),
        decoration: BoxDecoration(
          border: Border(
            bottom: Divider.createBorderSide(context, color: Color(0xff999999)),
          ),
        ),
        child: Row(
          children: <Widget>[
            Expanded(child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(currentData.title,
                  style: TextStyle(fontSize: 17, color: Color(0xff222222)),
                  maxLines: 2,),
                SizedBox(height: 20,),
                Row(children: <Widget>[
                  Text(currentData.beike_name, style: TextStyle(fontSize: 12,
                      color: Color(0xff999999)),)
                ],),
              ],
            ),),
            SizedBox(width: 12,),
            Image.network(currentData.beike_avatar, width: 105, height: 80,),
          ],
        ),

      )

    );
  }
}
