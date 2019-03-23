///3个图片的widget

import 'package:flutter/material.dart';

class ThreeImageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final snackBar = SnackBar(content: Text("press"),);
        Scaffold.of(context).showSnackBar(snackBar);
      },
      child: Container(
        padding: EdgeInsets.only(left: 24, right: 24, top: 14, bottom: 0),
        child: Column(
          children: <Widget>[
            Text('“地产界崔永元”胡景晖离职背后：直斥资本推高房租 住房租赁企业北',
               style: TextStyle(fontSize: 17, color: Color(0xff222222)),),
            SizedBox(height: 11,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Image.asset('assets/image/icon_beike_haofang.png', width: 105, height: 80,),
                Image.asset('assets/image/icon_beike_haofang.png', width: 105, height: 80,),
                Image.asset('assets/image/luck_draw_pop_bg.png', width: 105, height: 80,),
              ],
            ),
            SizedBox(height: 12,),
            Row(mainAxisAlignment: MainAxisAlignment.start,
               children: <Widget>[Text('贝壳研究员 1小时前 热度 1111', style: TextStyle(fontSize: 12,
                   color: Color(0xff999999)),)],),
            SizedBox(height: 14,),
            Divider(color: Colors.red,)
          ],
        ),
      ),
    );
  }
}
