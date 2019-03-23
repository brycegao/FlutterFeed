///
/// 左边是文案， 右边是图片
/// 对应250看到频道—iOS标注 推荐第一行
///

import 'package:flutter/material.dart';

class RightImageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final snackBar = SnackBar(content: Text("press"),);
        Scaffold.of(context).showSnackBar(snackBar);
      },
      child: Container(
        padding: EdgeInsets.only(left: 24, right: 20, top: 16, bottom: 16),
        child: Row(
          children: <Widget>[
            Expanded(child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('购房者心里可以踏实了？这四大因素或是决定未来房产业大局的关键',
                   style: TextStyle(fontSize: 17, color: Color(0xff222222)), maxLines: 2,),
                SizedBox(height: 20,),
                Row(children: <Widget>[
                  Text('贝壳研究员 1小时前 热度 685', style: TextStyle(fontSize: 12,
                     color: Color(0xff999999)),)
                ],)
              ],
            ),),
            SizedBox(width: 12,),
            Image.asset('assets/image/luck_draw_pop_bg.png', width: 105, height: 80,)
          ],
        ),
      ),
    );
  }
}
