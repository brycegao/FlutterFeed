// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_feed/main.dart';
import 'package:flutter_feed/model/recommand.dart';
import 'dart:convert';

void main() {
  group('jsonparse test', () {
      String mockdata = ''' {
  "id": "105172",
  "beike_name": "\u641c\u72d0\u7126\u70b9",
  "beike_id": "00000000000000100217",
  "beike_avatar": "http:\/\/img.ljcdn.com\/materials\/appindexconf\/05312539a71aaf69d8819dc21221d832.jpeg",
  "beike_url": "http:\/\/m.ke.com\/beikehao\/show\/MDAwMDAwMDAwMDAwMDAxMDAyMTc=",
  "content_id": "257841",
  "title": "\u5373\u5c06\u5b9e\u9524?!\u5e1d\u90fd\u623f\u4ea7\u76d1\u7ba1\u66f4\u4e25!\u5c06\u4e3a\u623f\u4ea7\u7a0e\u94fa\u8def?",
  "pic": [
    "http:\/\/img.ljcdn.com\/\/spider-search-image\/58c6f3873bac401b516ec0398f04fd17.jpg!m_fill,w_360,h_270"
  ],
  "time": "2019-03-18 18:27:14",
  "next_id": 200155290483400000,
  "type": 2,
  "recom_type": 1,
  "flog": {
    "fid": "105172",
    "score": 37.580001831055,
    "flog": {
      "pos": 2,
      "rid": "3793331776-VGpv26g"
    }
  }
}''';

    test('mockdata test', () {
      Recommand recommand = Recommand.fromJson(json.decode(mockdata));
      expect(recommand.beike_id, "00000000000000100217");
      expect(recommand.flog.fid, "105172");
      expect(recommand.flog.flog.pos, 2);
      print(recommand.flog.fid);
      print(recommand.flog.flog.pos);
    });
  });
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}
