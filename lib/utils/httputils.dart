/// 处理网络交互
/// 使用dio组件 https://github.com/flutterchina/dio
///

import 'package:dio/dio.dart';
import 'package:flutter_feed/model/basicresult.dart';
import 'package:flutter_feed/model/channelinfo.dart';
import 'package:flutter_feed/model/recommand.dart';
import 'dart:convert';


///test单元测试返回400， 运行程序功能正常
/// dio用法参考：https://segmentfault.com/a/1190000015853959

var feed = '''
{
	"error_code": 0,
	"error_msg": "success",
	"request_id": 3491499135,
	"data": [{
		"name": "\u63a8\u8350",
		"key": "0"
	}, {
		"name": "\u5317\u4eac",
		"key": "1"
	}, {
		"name": "\u884c\u60c5",
		"key": "3"
	}, {
		"name": "\u5927V\u89c2\u70b9",
		"key": "2"
	}],
	"uniqid": "010A1A640221D7C2A969019E76C7B937"
}
''';

var advise = '''
{
	"error_code": 0,
	"error_msg": "success",
	"request_id": 3491551636,
	"data": {
		"list": [{
			"id": "104995",
			"beike_name": "\u5357\u57ce\u8fd9\u4e9b\u4e8b\u513f",
			"beike_id": "00000000000000100627",
			"beike_avatar": "http:\/\/img.ljcdn.com\/materials\/appindexconf\/a512fb9c1a8fd04e3a9533c69927169f.jpg",
			"beike_url": "http:\/\/m.ke.com\/beikehao\/show\/MDAwMDAwMDAwMDAwMDAxMDA2Mjc=",
			"content_id": "257386",
			"title": "\u5317\u4eac\u5c06\u6253\u902022\u5e73\u65b9\u516c\u91cc\u9ad8\u7aef\u4ea7\u4e1a\u670d\u52a1\u533a\uff0140\u4ebf\uff013\u6761\u5730\u94c1\uff01\u5317\u4eac\u897f\u5357\u8981\u7206\u53d1\u4e86\uff01",
			"pic": ["http:\/\/img.ljcdn.com\/\/spider-search-image\/17382da8a2a313713c0cf3b88d927b8b.jpg!m_fill,w_315,h_234", "http:\/\/img.ljcdn.com\/\/spider-search-image\/1f4bfd1e17b45ed100f2046ec16bc6fb.jpg!m_fill,w_315,h_234", "http:\/\/img.ljcdn.com\/\/spider-search-image\/3f08430e2782c55baf1983bc81d62e33.jpg!m_fill,w_315,h_234"],
			"time": "2019-03-23 16:55:13",
			"next_id": 200155333029700399,
			"type": 1,
			"recom_type": 1,
			"url": "http:\/\/m.ke.com\/kandian\/MjU3Mzg2.html?beikefrom=app_kd_index",
			"bd_source": "1",
			"is_attend": 0,
			"city_code": "110000",
			"channel": "0",
			"beike_grade": "3",
			"is_history": 1,
			"posted_time": 1551528789,
			"show_type": 1,
			"img_count": 3,
			"show_time": "2019-03-02",
			"is_hot": false,
			"hot_count": 4936
		}, {
			"id": "103670",
			"beike_name": "\u51e4\u51f0\u7f51\u623f\u4ea7",
			"beike_id": "00000000000000100066",
			"beike_avatar": "http:\/\/img.ljcdn.com\/materials\/appindexconf\/448b93ae67ccdb45a4d4f95ebde77245.jpg",
			"beike_url": "http:\/\/m.ke.com\/beikehao\/show\/MDAwMDAwMDAwMDAwMDAxMDAwNjY=",
			"content_id": "255567",
			"title": "2\u6708\u5317\u4eac\u4e8c\u624b\u4f4f\u5b85\u7f51\u7b7e\u91cf\u73af\u6bd4\u964d\u56db\u6210",
			"pic": ["http:\/\/img.ljcdn.com\/\/spider-search-image\/38d02a3fbbaae0d05a82ba8d60cc0ced.jpg!m_fill,w_360,h_270"],
			"time": "2019-03-23 16:55:13",
			"next_id": 200155333029700398,
			"type": 2,
			"recom_type": 1,
			"url": "http:\/\/m.ke.com\/kandian\/MjU1NTY3.html?beikefrom=app_kd_index",
			"bd_source": "1",
			"is_attend": 0,
			"city_code": "999",
			"channel": "0",
			"beike_grade": "3",
			"is_history": 1,
			"posted_time": 1551489579,
			"show_type": 1,
			"img_count": 1,
			"show_time": "2019-03-02",
			"is_hot": false,
			"hot_count": 2196
		}, {
			"id": "99729",
			"beike_name": "\u641c\u72d0\u7126\u70b9",
			"beike_id": "00000000000000100217",
			"beike_avatar": "http:\/\/img.ljcdn.com\/materials\/appindexconf\/05312539a71aaf69d8819dc21221d832.jpeg",
			"beike_url": "http:\/\/m.ke.com\/beikehao\/show\/MDAwMDAwMDAwMDAwMDAxMDAyMTc=",
			"content_id": "249865",
			"title": "\u71d5\u90ca\u55b7\u8584\u4e86!\u5317\u4e09\u53bf\u5730\u94c1\u6765\u4e86\u2026\u2026",
			"pic": ["http:\/\/img.ljcdn.com\/\/spider-search-image\/1436fca52668074b4175ab063b28901c.jpg!m_fill,w_315,h_234", "http:\/\/img.ljcdn.com\/\/spider-search-image\/003d2fb2c297e33c2292489bf0206308.jpg!m_fill,w_315,h_234", "http:\/\/img.ljcdn.com\/\/spider-search-image\/ad83fae728a20e026c1c7f00142488d4.jpg!m_fill,w_315,h_234"],
			"time": "2019-03-23 16:55:13",
			"next_id": 200155333029700397,
			"type": 1,
			"recom_type": 1,
			"url": "http:\/\/m.ke.com\/kandian\/MjQ5ODY1.html?beikefrom=app_kd_index",
			"bd_source": "1",
			"is_attend": 0,
			"city_code": "999",
			"channel": "0",
			"beike_grade": "3",
			"is_history": 1,
			"posted_time": 1551088089,
			"show_type": 1,
			"img_count": 3,
			"show_time": "2019-02-25",
			"is_hot": false,
			"hot_count": 5744
		}, {
			"id": "99430",
			"beike_name": "\u5317\u4eac\u6709\u8d1d\u58f3",
			"beike_id": "00000000000000100346",
			"beike_avatar": "http:\/\/img.ljcdn.com\/materials\/appindexconf\/078ba0806362a9c8ae4872d055689408.jpg",
			"beike_url": "http:\/\/m.ke.com\/beikehao\/show\/MDAwMDAwMDAwMDAwMDAxMDAzNDY=",
			"content_id": "249572",
			"title": "\u5e74\u5e74\u6da8\u623f\u79df\u4eca\u5e74\u4e0d\u7075\u4e86 \u623f\u4e1c\uff1a\u624d\u6da8300\u5143\u79df\u5ba2\u5c31\u8dd1\u4e86",
			"time": "2019-03-23 16:55:13",
			"next_id": 200155333029700396,
			"type": 3,
			"recom_type": 1,
			"url": "http:\/\/m.ke.com\/kandian\/MjQ5NTcy.html?beikefrom=app_kd_index",
			"bd_source": "7",
			"is_attend": 0,
			"city_code": "110000",
			"channel": "0",
			"beike_grade": "3",
			"is_history": 1,
			"posted_time": 1551086754,
			"show_type": 1,
			"img_count": 0,
			"show_time": "2019-02-25",
			"is_hot": false,
			"hot_count": 4589
		}, {
			"id": "99527",
			"beike_name": "\u89c2\u70b9\u5730\u4ea7\u65b0\u5a92\u4f53",
			"beike_id": "00000000000000100046",
			"beike_avatar": "http:\/\/img.ljcdn.com\/materials\/appindexconf\/7fa14af9dfeb0097ecab882d8f15ee8c.jpeg",
			"beike_url": "http:\/\/m.ke.com\/beikehao\/show\/MDAwMDAwMDAwMDAwMDAxMDAwNDY=",
			"content_id": "249626",
			"title": "\u4e2d\u6d7744.4\u4ebf\u843d\u5b50\u5317\u4eac\u5927\u5174 \u6700\u9ad8\u9500\u552e\u5355\u4ef75.79\u4e07\u5143\/\u5e73\u65b9\u7c73",
			"pic": ["http:\/\/img.ljcdn.com\/\/spider-search-image\/199dca37b34a125aeeb9d986b822cf35.jpg!m_fill,w_360,h_270"],
			"time": "2019-03-23 16:55:13",
			"next_id": 200155333029700395,
			"type": 2,
			"recom_type": 1,
			"url": "http:\/\/m.ke.com\/kandian\/MjQ5NjI2.html?beikefrom=app_kd_index",
			"bd_source": "1",
			"is_attend": 0,
			"city_code": "999",
			"channel": "0",
			"beike_grade": "4",
			"is_history": 1,
			"posted_time": 1551080947,
			"show_type": 1,
			"img_count": 1,
			"show_time": "2019-02-25",
			"is_hot": false,
			"hot_count": 363
		}, {
			"id": "99304",
			"beike_name": "\u5c0f\u667a\u5317\u4eac\u8350\u623f",
			"beike_id": "00000000000000100884",
			"beike_avatar": "http:\/\/img.ljcdn.com\/materials\/appindexconf\/60f5c33668268586e9c22e37b8a407b8.jpg",
			"beike_url": "http:\/\/m.ke.com\/beikehao\/show\/MDAwMDAwMDAwMDAwMDAxMDA4ODQ=",
			"content_id": "249534",
			"title": "\u805a\u7126\u660c\u5e73 \u7cbe\u9009\u4e00\u5c45\u5ba4",
			"time": "2019-03-23 16:55:13",
			"next_id": 200155333029700394,
			"type": 3,
			"recom_type": 1,
			"url": "http:\/\/m.ke.com\/kandian\/MjQ5NTM0.html?beikefrom=app_kd_index",
			"bd_source": "11",
			"is_attend": 0,
			"city_code": "110000",
			"channel": "0",
			"beike_grade": "3",
			"is_history": 1,
			"show_type": 1,
			"img_count": 0,
			"show_time": "2019-02-25",
			"is_hot": false,
			"hot_count": 86
		}, {
			"id": "98308",
			"beike_name": "\u8d22\u5988\u8bf4",
			"beike_id": "00000000000000100569",
			"beike_avatar": "http:\/\/img.ljcdn.com\/materials\/appindexconf\/270a81273a9b0bdd6ba27a9811917178.jpg",
			"beike_url": "http:\/\/m.ke.com\/beikehao\/show\/MDAwMDAwMDAwMDAwMDAxMDA1Njk=",
			"content_id": "247941",
			"title": "\u672a\u6765\u5341\u5e74\uff0c\u8fd9\u4e9b\u57ce\u5e02\u7684\u623f\u4ef7\u53ef\u80fd\u8981\u8d77\u98de\u4e86\uff01",
			"pic": ["http:\/\/img.ljcdn.com\/\/spider-search-image\/27081eb7fccb9a44c0431945456eaae8.jpg!m_fill,w_315,h_234", "http:\/\/img.ljcdn.com\/\/spider-search-image\/5fe3796c1bb94af827cd9183628235a9.jpg!m_fill,w_315,h_234", "http:\/\/img.ljcdn.com\/\/spider-search-image\/205eb5ca3d213db42b3ef3f6e326c6e3.jpg!m_fill,w_315,h_234"],
			"time": "2019-03-23 16:55:13",
			"next_id": 200155333029700393,
			"type": 1,
			"recom_type": 1,
			"url": "http:\/\/m.ke.com\/kandian\/MjQ3OTQx.html?beikefrom=app_kd_index",
			"bd_source": "1",
			"is_attend": 0,
			"city_code": "999",
			"channel": "0",
			"beike_grade": "3",
			"is_history": 1,
			"posted_time": 1550847618,
			"show_type": 1,
			"img_count": 3,
			"show_time": "2019-02-22",
			"is_hot": false,
			"hot_count": 7156
		}, {
			"id": "97542",
			"beike_name": "\u697c\u5e02\u8d44\u672c\u8bba",
			"beike_id": "00000000000000100245",
			"beike_avatar": "http:\/\/img.ljcdn.com\/materials\/appindexconf\/e0d1f205d8d3ce3942ec4ae433442580.jpg",
			"beike_url": "http:\/\/m.ke.com\/beikehao\/show\/MDAwMDAwMDAwMDAwMDAxMDAyNDU=",
			"content_id": "246723",
			"title": "\u73af\u4eac\u697c\u5e02\u53c8\u89c1\u70ed\u6d6a\uff01\u9999\u6cb3\u9650\u8d2d\u89e3\u7981\uff0c\u5f00\u53d1\u5546\u8d81\u673a\u6da8\u4ef7\uff1f",
			"pic": ["http:\/\/img.ljcdn.com\/\/spider-search-image\/086dd81a977d921a7c99557bf1c88dbe.jpg!m_fill,w_315,h_234", "http:\/\/img.ljcdn.com\/\/spider-search-image\/24e0a2bc959cf7d698e25a9e886b71b6.jpg!m_fill,w_315,h_234", "http:\/\/img.ljcdn.com\/\/spider-search-image\/b47fcc79c702037620d422fb989feb55.jpg!m_fill,w_315,h_234"],
			"time": "2019-03-23 16:55:13",
			"next_id": 200155333029700392,
			"type": 1,
			"recom_type": 1,
			"url": "http:\/\/m.ke.com\/kandian\/MjQ2NzIz.html?beikefrom=app_kd_index",
			"bd_source": "1",
			"is_attend": 0,
			"city_code": 0,
			"channel": "0",
			"beike_grade": "3",
			"is_history": 1,
			"posted_time": 1550761213,
			"show_type": 1,
			"img_count": 3,
			"show_time": "2019-02-21",
			"is_hot": false,
			"hot_count": 4083
		}, {
			"id": "98451",
			"beike_name": "\u5317\u4eac\u4e70\u623f\u4eba",
			"beike_id": "00000000000000100181",
			"beike_avatar": "http:\/\/img.ljcdn.com\/materials\/appindexconf\/8c8720000eaf2713c96207a505b98625.jpg",
			"beike_url": "http:\/\/m.ke.com\/beikehao\/show\/MDAwMDAwMDAwMDAwMDAxMDAxODE=",
			"content_id": "248153",
			"title": "\u544a\u522b\u4e70100\u5e73\u7c73\u53ea\u5f9770\u5e73\uff01\u4f4f\u5efa\u90e8\u65b0\u89c4\uff1a\u4f4f\u5b85\u6309\u5957\u5185\u9762\u79ef\u7b97",
			"pic": ["http:\/\/img.ljcdn.com\/\/spider-search-image\/a30f20b711cc24ae908a56b19eddf434.jpg!m_fill,w_315,h_234", "http:\/\/img.ljcdn.com\/\/spider-search-image\/e9e90fb9e23df3af8b44fad88e9ee274.jpg!m_fill,w_315,h_234", "http:\/\/img.ljcdn.com\/\/spider-search-image\/35a363f17ce33e5b2fba7a34896f4213.jpg!m_fill,w_315,h_234"],
			"time": "2019-03-23 16:55:13",
			"next_id": 200155333029700391,
			"type": 1,
			"recom_type": 1,
			"url": "http:\/\/m.ke.com\/kandian\/MjQ4MTUz.html?beikefrom=app_kd_index",
			"bd_source": "1",
			"is_attend": 0,
			"city_code": "110000",
			"channel": "0",
			"beike_grade": "3",
			"is_history": 1,
			"posted_time": 1550890842,
			"show_type": 1,
			"img_count": 3,
			"show_time": "2019-02-23",
			"is_hot": false,
			"hot_count": 344
		}, {
			"id": "97917",
			"beike_name": "\u901a\u5dde\u5c0f\u5175",
			"beike_id": "00000000000000100633",
			"beike_avatar": "http:\/\/img.ljcdn.com\/materials\/appindexconf\/4cec29857a43f8aa3fd50a5c3c906318.jpg",
			"beike_url": "http:\/\/m.ke.com\/beikehao\/show\/MDAwMDAwMDAwMDAwMDAxMDA2MzM=",
			"content_id": "246568",
			"title": "\u5b9a\u4e86\uff01\u4ee5\u540e\u901a\u5dde\u8fd9\u4e2a\u5730\u65b9\u5c31\u53eb\u201c\u5317\u4eac\u73af\u7403\u5ea6\u5047\u533a\u201d\uff01",
			"pic": ["http:\/\/img.ljcdn.com\/\/\/spider-search-image\/64c64211ee308dc9ac8b8d3bd895d007.jpg!m_fill,w_315,h_234", "http:\/\/img.ljcdn.com\/\/\/spider-search-image\/fe3c42ac81daa9163e6e1b2ff59b4bf6.jpg!m_fill,w_315,h_234", "http:\/\/img.ljcdn.com\/\/\/spider-search-image\/47dce1f458ca8ebdde2d607316323cd3.jpg!m_fill,w_315,h_234"],
			"time": "2019-03-23 16:55:13",
			"next_id": 200155333029700390,
			"type": 1,
			"recom_type": 1,
			"url": "http:\/\/m.ke.com\/kandian\/MjQ2NTY4.html?beikefrom=app_kd_index",
			"bd_source": "1",
			"is_attend": 0,
			"city_code": "110000",
			"channel": "0",
			"beike_grade": "3",
			"is_history": 1,
			"posted_time": 1550746871,
			"show_type": 1,
			"img_count": 3,
			"show_time": "2019-02-21",
			"is_hot": false,
			"hot_count": 350
		}, {
			"id": "97488",
			"beike_name": "\u963f\u5386\u89c2\u697c\u5e02",
			"beike_id": "00000000000000100567",
			"beike_avatar": "http:\/\/img.ljcdn.com\/materials\/appindexconf\/a1646c88726e156a56ed973148746e88.jpg",
			"beike_url": "http:\/\/m.ke.com\/beikehao\/show\/MDAwMDAwMDAwMDAwMDAxMDA1Njc=",
			"content_id": "246700",
			"title": "\u8fd9\u7c7b\u623f\u5b50\u7adf\u7136\u4ee3\u8868\u4e2d\u56fd\u697c\u5e02\u6700\u771f\u5b9e\u7684\u9700\u6c42\uff01",
			"pic": ["http:\/\/img.ljcdn.com\/\/spider-search-image\/8939f0dcccf38a99298f1bd6a944667a.jpg!m_fill,w_315,h_234", "http:\/\/img.ljcdn.com\/\/spider-search-image\/392756d839cb97c4631b627d1687eafc.jpg!m_fill,w_315,h_234", "http:\/\/img.ljcdn.com\/\/spider-search-image\/5531dcc2bb6c782f48dd6b29c270a625.jpg!m_fill,w_315,h_234"],
			"time": "2019-03-23 16:55:13",
			"next_id": 200155333029700389,
			"type": 1,
			"recom_type": 1,
			"url": "http:\/\/m.ke.com\/kandian\/MjQ2NzAw.html?beikefrom=app_kd_index",
			"bd_source": "1",
			"is_attend": 0,
			"city_code": "999",
			"channel": "0",
			"beike_grade": "3",
			"is_history": 1,
			"posted_time": 1550757634,
			"show_type": 1,
			"img_count": 3,
			"show_time": "2019-02-21",
			"is_hot": false,
			"hot_count": 260
		}, {
			"id": "97371",
			"beike_name": "\u514b\u800c\u745e\u623f\u4ef7\u5317\u4eac",
			"beike_id": "00000000000000100641",
			"beike_avatar": "http:\/\/img.ljcdn.com\/materials\/appindexconf\/c905f2057cd662403b0ffe9a12ed2753.jpg",
			"beike_url": "http:\/\/m.ke.com\/beikehao\/show\/MDAwMDAwMDAwMDAwMDAxMDA2NDE=",
			"content_id": "246350",
			"title": "\u53d1\u6539\u59d4\uff1a\u653e\u5f00\u653e\u5bbd\u9664\u4e2a\u522b\u8d85\u5927\u57ce\u5e02\u5916\u7684\u57ce\u5e02\u843d\u6237\u9650\u5236",
			"time": "2019-03-23 16:55:13",
			"next_id": 200155333029700388,
			"type": 3,
			"recom_type": 1,
			"url": "http:\/\/m.ke.com\/kandian\/MjQ2MzUw.html?beikefrom=app_kd_index",
			"bd_source": "2",
			"is_attend": 0,
			"city_code": "110000",
			"channel": "0",
			"beike_grade": "3",
			"is_history": 1,
			"summary": "\u5229\u597d\u6d88\u606f\uff01",
			"posted_time": 1550743243,
			"show_type": 1,
			"img_count": 0,
			"show_time": "2019-02-21",
			"is_hot": false,
			"hot_count": 178
		}],
		"is_end": 0
	},
	"uniqid": "010A1A64022BD9C2A96901A8764E22D5"
}
''';

class FeedHttpUtils {
  static const BASE_URL = "https://app.api.ke.com";

  final FRESH_CHANNEL = "/openapi/feed/api/feed/freshchannel";
  final FRESH_CONTENT = "/openapi/feed/api/feed/fresh";

  static FeedHttpUtils _instance;
  Dio dio;
  var _formData;

  static FeedHttpUtils getInstance() {
    if (_instance != null) {
      return _instance;
    }

    _instance = FeedHttpUtils();
    _instance.dio = Dio();
    _instance.dio.options.baseUrl = BASE_URL;
    _instance.dio.options.connectTimeout = 5000;
    _instance.dio.options.receiveTimeout = 5000;
    var headers = <String, dynamic> {
      "Page-Schema": "feedTab",
      "Refer": "homepage",
      "Cookie": "lianjia_udid=867179036958019;lianjia_uuid=dafadafa-3921-4b77-a28c-00d8a7e5ea32",
      "Lianjia-City-id": "110000",
      "extension": "lj_duid=DuItml1kI9vJAdN4fzI078fw24py4180h5GRza10OTJd5nMTPGUS295tH2avSaxg/MLrc2x4sdunjVymbVCnCqpw&lj_android_id=ca9c234bc645896b&lj_imei=867179036958019&lj_device_id_android=867179036958019&mac_id=B0:E1:7E:14:83:32",
      "User-Agent": "Beike2.2.0;HONOR PRA-AL00X; Android 8.0.0",
      "Lianjia-Channel": "lianjiabeike",
      "Lianjia-Version": "2.5.0",
    };
    _instance.dio.options.headers.addAll(headers);

    return _instance;
  }

  ///获取 频道 名称
  ///https://app.api.ke.com/openapi/feed/api/feed/freshchannel
  Future<List> getFeed() async {
    var list = List();
    try {
      print(FRESH_CHANNEL);
      Response response = await dio.get(FRESH_CHANNEL);
      print(response);  //只能在测试环境使用， 先用mockdata验证

      var map = json.decode(feed);
      var basicinfo = BasicResult.fromJson(map);
      if (basicinfo != null && basicinfo.data != null && basicinfo.data is List) {
        var tmp = basicinfo.data as List;
        list.addAll(tmp);
      }
    } catch (e) {
      print(e);
    }

    return list;
  }

  ///获取 推荐 数据
  Future<List> getAdviseData(int channel) async {
    var list = List();
    try {
      print(FRESH_CONTENT);
      _formData = FormData.from({
        "type": 1,
        "screen_type": 3,
        "channel": channel,
      });
      Response response = await dio.post(FRESH_CONTENT, data: _formData);
      print(response);

      var map = json.decode(advise);
      var info = BasicResult.fromJson(map);
      if (info != null && info.data != null && info.data["list"] is List) {
        var tmp = info.data['list'] as List;
        list.addAll(tmp);
      }
    } catch (e) {
      print(e);
    }
    return list;
  }
}


void testGetHttp() async {
  try {
    Response response = await Dio().get("http://www.baidu.com");

    print(response.request);
    print(response.data);
  } catch (e) {
    print(e);
  }
}

