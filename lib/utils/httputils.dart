/// 处理网络交互
/// 使用dio组件 https://github.com/flutterchina/dio
///

import 'package:dio/dio.dart';
import 'package:flutter_feed/model/basicresult.dart';
import 'package:flutter_feed/model/channelinfo.dart';
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
			"summary": "\u638c\u83b7\u5317\u4eac\u5357\u57ce\u53d1\u5c55\u89c4\u5212\uff0c\u5317\u4eac\u5357\u57ce\u7f6e\u4e1a\u53c2\u9605\u5e73\u53f0\u3002",
			"content_sub": "\u3010\u5fae\u4fe1\u516c\u4f17\u53f7\uff1a\u5357\u57ce\u8fd9\u4e9b\u4e8b\u513f\u3011\u00a0\u00a0\u00a0\u638c\u83b7\u5317\u4eac\u5357\u57ce\u53d1\u5c55\u89c4\u5212\uff0c\u5317\u4eac\u5357\u57ce\u7f6e\u4e1a\u53c2\u9605\u5e73\u53f0\u3002\u3010\u5357\u57ce\u541b\u89e3\u8bfb\u3011\uff1a\u5317\u4eac\u897f\u5357\u8fce\u6765\u91cd\u78c5\u5229\u597d\uff01\u5317\u4eac\u65b0\u9996\u94a2\u5730\u533a\u4e09\u5e74\u8ba1\u5212\u53d1\u5e03\uff0c\u5305\u62ec\u4e30\u53f0\u3001\u77f3\u666f\u5c71\u3001\u95e8\u5934\u6c9f\u4e09\u5730\uff0c\u8981\u6253\u9020\u65b0\u9996\u94a2\u9ad8\u7aef\u4ea7\u4e1a\u7efc\u5408\u670d\u52a1\u533a\uff0122\u5e73\u65b9\u516c\u91cc\uff0c\u5357\u57ce\u541b\u7c97\u7b97\u4e86\u4e00\u4e0b\uff0c\u5927\u7ea6\u76f8\u5f53\u4e8e50\u500d\u5929\u5b89\u95e8\u5e7f\u573a\u5927\u5c0f\uff0c\u89c4\u6a21\u76f8\u5f53\u5927\u3002\u5357\u57ce\u541b\u8ba4\u4e3a\u4ee5\u524d\u5404",
			"v_txt": "\u638c\u83b7\u5317\u4eac\u5357\u57ce\u53d1\u5c55\u89c4\u5212\uff0c\u5317\u4eac\u5357\u57ce\u7f6e\u4e1a\u53c2\u9605\u5e73\u53f0\u3002",
			"beikehao_show_txt": "\u5357\u57ce\u8fd9\u4e9b\u4e8b\u513f\uff0c\u6bcf\u65e5\u64ad\u62a5\u4eac\u57ce\u5357\u90e8\u65b0\u95fb\u4fe1\u606f\u53d1\u5c55\u53d8\u5316\uff0c\u6c47\u603b\u6700\u5168\u8863\u98df\u4f4f\u7528\u884c\u5403\u559d\u73a9\u4e50\u7b49\u4fe1\u606f\u3002",
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
			"content_sub": "\u65b0\u4eac\u62a5\u5feb\u8baf \u4ece\u5386\u5e74\u6570\u636e\u770b\uff0c\u6625\u8282\u56e0\u7d20\u5bf9\u5e02\u573a\u6210\u4ea4\u91cf\u7684\u5f71\u54cd\u975e\u5e38\u660e\u663e\uff0c2019\u5e74\u4e5f\u4e0d\u4f8b\u5916\u30022019\u5e742\u6708\uff0c\u5317\u4eac\u697c\u5e02\u9677\u5165\u5b63\u8282\u6027\u4f4e\u8c37\uff0c\u65e0\u8bba\u4e8c\u624b\u623f\uff0c\u8fd8\u662f\u65b0\u623f\uff0c\u6210\u4ea4\u91cf\u90fd\u6709\u6240\u4e0b\u6ed1\u3002\u4e1a\u5185\u4eba\u58eb\u79f0\uff0c\u4ece\u6574\u4f53\u770b\uff0c\u5317\u4eac\u697c\u5e02\u4f9d\u7136\u5904\u4e8e\u4f4e\u4f4d\u30022\u6708\u4efd\uff0c\u53d7\u6625\u8282\u5f71\u54cd\uff0c\u591a\u6570\u4e1a\u4e3b\u548c\u5ba2\u6237\u7531\u4e8e\u79bb\u4eac\u51fa\u6e38\u6216\u63a2\u4eb2\u7684\u884c\u4e3a\uff0c\u800c\u6682\u65f6\u6401\u7f6e\u552e\u623f\u6216\u7f6e\u4e1a\u8ba1\u5212\u3002\u6765\u81ea\u4e2d",
			"v_txt": "\u65b0\u4eac\u62a5\u5feb\u8baf \u4ece\u5386\u5e74\u6570\u636e\u770b\uff0c\u6625\u8282\u56e0\u7d20\u5bf9\u5e02\u573a\u6210\u4ea4\u91cf\u7684\u5f71\u54cd\u975e\u5e38\u660e\u663e\uff0c2019\u5e74\u4e5f\u4e0d\u4f8b\u5916\u30022019\u5e742\u6708\uff0c\u5317\u4eac\u697c\u5e02\u9677\u5165\u5b63\u8282\u6027\u4f4e\u8c37\uff0c\u65e0\u8bba\u4e8c\u624b\u623f\uff0c\u8fd8\u662f\u65b0\u623f\uff0c\u6210\u4ea4\u91cf\u90fd\u6709\u6240\u4e0b\u6ed1\u3002\u4e1a\u5185\u4eba\u58eb\u79f0\uff0c\u4ece\u6574\u4f53\u770b\uff0c\u5317\u4eac\u697c\u5e02\u4f9d\u7136\u5904\u4e8e\u4f4e\u4f4d\u30022\u6708\u4efd\uff0c\u53d7\u6625\u8282\u5f71\u54cd\uff0c\u591a\u6570\u4e1a\u4e3b\u548c\u5ba2\u6237\u7531\u4e8e\u79bb\u4eac\u51fa\u6e38\u6216\u63a2\u4eb2\u7684\u884c\u4e3a\uff0c\u800c\u6682\u65f6\u6401\u7f6e\u552e\u623f\u6216\u7f6e\u4e1a\u8ba1\u5212\u3002\u6765\u81ea\u4e2d",
			"beikehao_show_txt": "\u4e3a\u8d2d\u623f\u8005\u63d0\u4f9b\u5168\u9762\u7684\u8d44\u8baf\u3001\u4e13\u4e1a\u7684\u8bc4\u8bba\u3001\u4e30\u5bcc\u7684\u697c\u76d8\u4fe1\u606f\u4e0e\u8d2d\u623f\u670d\u52a1\u3002",
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
			"content_sub": "\u9996\u5148\uff0c\u5468\u516d\u88ab\u201c\u53d6\u6d88\u516c\u644a\u9762\u79ef\u201d\u7684\u6d88\u606f\u5237\u5c4f\u4e86\uff0c\u4e5f\u6709\u4e0d\u5c11\u670b\u53cb\u6765\u95ee\uff0c\u5728\u8fd9\u91cc\uff0c\u623f\u53d4\u4e0d\u5f97\u4e0d\u63d0\u9192\u51e0\u53e5\u30021.\u8fd9\u4e2a\u6587\u4ef6\u63d0\u51fa\u201c\u53d6\u6d88\u516c\u644a\u201d\uff0c\u8ddf\u6211\u4eec\u6d88\u8d39\u8005\u6ca1\u5565\u5173\u7cfb...\u201c\u4f4f\u5b85\u5efa\u7b51\u5e94\u4ee5\u5957\u5185\u9762\u79ef\u8fdb\u884c\u4ea4\u6613\u201d\u6240\u5728\u7684\u6587\u4ef6 \u2014\u2014\u300a\u4f4f\u5b85\u9879\u76ee\u89c4\u8303\uff08\u5f81\u6c42\u610f\u89c1\u7a3f\uff09\u300b\uff0c\u76ee\u524d\u53ea\u662f\u505c\u7559\u5728\u201c\u5f81\u6c42\u610f\u89c1\u201d\u9636\u6bb5\uff0c\u800c\u4e14\u8fd9\u4e2a\u5f81\u6c42\u610f\u89c1\u7a3f\uff0c\u53ea\u662f\u4e2a\u6280\u672f\u89c4\u8303\uff0c\u4e5f\u4e0d\u786e",
			"v_txt": "\u9996\u5148\uff0c\u5468\u516d\u88ab\u201c\u53d6\u6d88\u516c\u644a\u9762\u79ef\u201d\u7684\u6d88\u606f\u5237\u5c4f\u4e86\uff0c\u4e5f\u6709\u4e0d\u5c11\u670b\u53cb\u6765\u95ee\uff0c\u5728\u8fd9\u91cc\uff0c\u623f\u53d4\u4e0d\u5f97\u4e0d\u63d0\u9192\u51e0\u53e5\u30021.\u8fd9\u4e2a\u6587\u4ef6\u63d0\u51fa\u201c\u53d6\u6d88\u516c\u644a\u201d\uff0c\u8ddf\u6211\u4eec\u6d88\u8d39\u8005\u6ca1\u5565\u5173\u7cfb...\u201c\u4f4f\u5b85\u5efa\u7b51\u5e94\u4ee5\u5957\u5185\u9762\u79ef\u8fdb\u884c\u4ea4\u6613\u201d\u6240\u5728\u7684\u6587\u4ef6 \u2014\u2014\u300a\u4f4f\u5b85\u9879\u76ee\u89c4\u8303\uff08\u5f81\u6c42\u610f\u89c1\u7a3f\uff09\u300b\uff0c\u76ee\u524d\u53ea\u662f\u505c\u7559\u5728\u201c\u5f81\u6c42\u610f\u89c1\u201d\u9636\u6bb5\uff0c\u800c\u4e14\u8fd9\u4e2a\u5f81\u6c42\u610f\u89c1\u7a3f\uff0c\u53ea\u662f\u4e2a\u6280\u672f\u89c4\u8303\uff0c\u4e5f\u4e0d\u786e",
			"beikehao_show_txt": "\u662f\u641c\u72d0\u77e9\u9635\u6210\u5458\u4e4b\u4e00\uff0c\u4f5c\u4e3a\u4e2d\u56fd\u623f\u5730\u4ea7\u5bb6\u5c45\u5728\u7ebf\u670d\u52a1\u5e73\u53f0\uff0c\u4e3a\u7528\u6237\u63d0\u4f9b\u4e70\u623f\u3001\u5356\u623f\u3001\u79df\u623f\u3001\u88c5\u4fee\u3001\u91d1\u878d\u7b49\u670d\u52a1\u3002",
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
			"summary": "\u6625\u8282\u4e4b\u540e\uff0c\u5927\u91cf\u6d41\u52a8\u4eba\u53e3\u4ece\u8001\u5bb6\u8fd4\u56de\u5927\u57ce\u5e02\u3002\u5f80\u5e38\u8fd9\u4e2a\u65f6\u5019\uff0c\u623f\u4e1c\u662f\u6700\u5f00\u5fc3\u7684\uff0c\u501f\u52a9\u7a81\u7136\u589e\u52a0\u7684\u79df\u623f\u9700\u6c42\uff0c\u4ed6\u4eec\u53ef\u4ee5\u987a\u52bf\u6da8\u4e00\u6ce2\u623f\u79df\u3002\u800c\u4e14\u518d\u8fc7\u51e0\u4e2a\u6708\uff0c\u6bd5\u4e1a\u751f\u4e5f\u4f1a\u8d70\u51fa\u6821\u56ed\uff0c\u66f4\u589e\u52a0\u4e86\u623f\u4e1c\u4eec\u7684\u4fe1\u5fc3\u3002\u53ef\u662f\uff0c\u4eca\u5e74\u7684\u60c5\u51b5\u4f3c\u4e4e\u6709\u6240\u4e0d\u540c\u3002\u6bd4\u5982\uff0c\u6709\u4f4d\u5317\u4eac\u7684\u623f\u4e1c\u5c31\u62b1\u6028\u8bf4\uff1a\u201c\u6211",
			"content_sub": "\u6625\u8282\u4e4b\u540e\uff0c\u5927\u91cf\u6d41\u52a8\u4eba\u53e3\u4ece\u8001\u5bb6\u8fd4\u56de\u5927\u57ce\u5e02\u3002\u5f80\u5e38\u8fd9\u4e2a\u65f6\u5019\uff0c\u623f\u4e1c\u662f\u6700\u5f00\u5fc3\u7684\uff0c\u501f\u52a9\u7a81\u7136\u589e\u52a0\u7684\u79df\u623f\u9700\u6c42\uff0c\u4ed6\u4eec\u53ef\u4ee5\u987a\u52bf\u6da8\u4e00\u6ce2\u623f\u79df\u3002\u800c\u4e14\u518d\u8fc7\u51e0\u4e2a\u6708\uff0c\u6bd5\u4e1a\u751f\u4e5f\u4f1a\u8d70\u51fa\u6821\u56ed\uff0c\u66f4\u589e\u52a0\u4e86\u623f\u4e1c\u4eec\u7684\u4fe1\u5fc3\u3002\u53ef\u662f\uff0c\u4eca\u5e74\u7684\u60c5\u51b5\u4f3c\u4e4e\u6709\u6240\u4e0d\u540c\u3002\u6bd4\u5982\uff0c\u6709\u4f4d\u5317\u4eac\u7684\u623f\u4e1c\u5c31\u62b1\u6028\u8bf4\uff1a\u201c\u6211\u5c31\u63d0\u51fa\u6da8300\u5143\uff0c\u5e76\u4e0d\u7b97\u72ee\u5b50\u5927\u5f00\u53e3\u554a\uff0c\u6ca1\u60f3\u5230\u79df\u5ba2\u5c31\u4e0d\u79df\u4e86\u3002",
			"v_txt": "\u6625\u8282\u4e4b\u540e\uff0c\u5927\u91cf\u6d41\u52a8\u4eba\u53e3\u4ece\u8001\u5bb6\u8fd4\u56de\u5927\u57ce\u5e02\u3002\u5f80\u5e38\u8fd9\u4e2a\u65f6\u5019\uff0c\u623f\u4e1c\u662f\u6700\u5f00\u5fc3\u7684\uff0c\u501f\u52a9\u7a81\u7136\u589e\u52a0\u7684\u79df\u623f\u9700\u6c42\uff0c\u4ed6\u4eec\u53ef\u4ee5\u987a\u52bf\u6da8\u4e00\u6ce2\u623f\u79df\u3002\u800c\u4e14\u518d\u8fc7\u51e0\u4e2a\u6708\uff0c\u6bd5\u4e1a\u751f\u4e5f\u4f1a\u8d70\u51fa\u6821\u56ed\uff0c\u66f4\u589e\u52a0\u4e86\u623f\u4e1c\u4eec\u7684\u4fe1\u5fc3\u3002\u53ef\u662f\uff0c\u4eca\u5e74\u7684\u60c5\u51b5\u4f3c\u4e4e\u6709\u6240\u4e0d\u540c\u3002\u6bd4\u5982\uff0c\u6709\u4f4d\u5317\u4eac\u7684\u623f\u4e1c\u5c31\u62b1\u6028\u8bf4\uff1a\u201c\u6211",
			"beikehao_show_txt": "\u63d0\u4f9b\u623f\u4ea7\u8d44\u8baf\uff0c\u51b7\u9759\u5206\u6790\uff0c\u4e13\u4e1a\u8bc4\u6790\uff0c\u4ee5\u6743\u5a01\u7684\u6570\u636e\u5c55\u793a\u697c\u5e02\u884c\u60c5\uff0c\u6c47\u96c6\u697c\u5e02\u52a8\u6001\u3002",
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
			"content_sub": "\u89c2\u70b9\u5730\u4ea7\u7f51\u8baf\uff1a2\u670825\u65e5\uff0c\u5317\u4eac\u5e02\u5927\u5174\u533a\u4e24\u5b97\u4f4f\u5b85\u6df7\u5408\u516c\u5efa\u7528\u5730\u5c06\u4e8e\u5f53\u65e5\u4e0b\u5348\u622a\u6b62\u6302\u724c\u7ade\u4ef7\u8fdb\u5165\u73b0\u573a\u7ade\u62cd\uff0c\u4e24\u5b97\u5730\u603b\u51fa\u8ba9\u9762\u79ef\u4e3a11.42\u4e07\u5e73\u65b9\u7c73\u3002 \u636e\u89c2\u70b9\u5730\u4ea7\u65b0\u5a92\u4f53\u83b7\u6089\uff0c\u9996\u5148\u5f00\u62cd\u7684\u5927\u5174\u533a\u701b\u6d77\u9547\u5730\u5757\uff0c\u88ab\u4e2d\u6d77\u4ee544.4\u4ebf\u5143\u7684\u4ef7\u683c\u6458\u5f97\u3002 \u8d44\u6599\u663e\u793a\uff0c\u5927\u5174\u533a\u701b\u6d77\u9547YZ00-0803-6024\u30016025\u30016032\u3001603",
			"v_txt": "\u89c2\u70b9\u5730\u4ea7\u7f51\u8baf\uff1a2\u670825\u65e5\uff0c\u5317\u4eac\u5e02\u5927\u5174\u533a\u4e24\u5b97\u4f4f\u5b85\u6df7\u5408\u516c\u5efa\u7528\u5730\u5c06\u4e8e\u5f53\u65e5\u4e0b\u5348\u622a\u6b62\u6302\u724c\u7ade\u4ef7\u8fdb\u5165\u73b0\u573a\u7ade\u62cd\uff0c\u4e24\u5b97\u5730\u603b\u51fa\u8ba9\u9762\u79ef\u4e3a11.42\u4e07\u5e73\u65b9\u7c73\u3002 \u636e\u89c2\u70b9\u5730\u4ea7\u65b0\u5a92\u4f53\u83b7\u6089\uff0c\u9996\u5148\u5f00\u62cd\u7684\u5927\u5174\u533a\u701b\u6d77\u9547\u5730\u5757\uff0c\u88ab\u4e2d\u6d77\u4ee544.4\u4ebf\u5143\u7684\u4ef7\u683c\u6458\u5f97\u3002 \u8d44\u6599\u663e\u793a\uff0c\u5927\u5174\u533a\u701b\u6d77\u9547YZ00-0803-6024\u30016025\u30016032\u3001603",
			"beikehao_show_txt": "\u4e2d\u56fd\u623f\u5730\u4ea7\u884c\u4e1a\u9886\u5148\u8d44\u8baf\u3001\u6570\u636e\u548c\u5206\u6790\u4f9b\u5e94\u5546\uff0c\u662f\u8986\u76d6\u623f\u5730\u4ea7\u884c\u4e1a\u4e0a\u4e0b\u6e38\u4ea7\u4e1a\u94fe\u7684\u6743\u5a01\u4e13\u4e1a\u5168\u5a92\u4f53\u3002",
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
			"summary": "\u4f5c\u5bb6\u5218\u745c\u8bf4\u8fc7\uff0c\u4e00\u4e2a\u4eba\u8981\u6d3b\u6210\u4e00\u652f\u961f\u4f0d\u3002\u540c\u6837\u7684\uff0c\u4e00\u4e2a\u4eba\u4e5f\u8981\u6709\u4e2a\u5bb6\u3002\u5bb6\u662f\u5feb\u8282\u594f\u751f\u6d3b\u7684\u4e00\u5904\u7cbe\u795e\u7f13\u51b2\u5730\uff0c\u5c45\u4f4f\u54c1",
			"content_sub": "\u4f5c\u5bb6\u5218\u745c\u8bf4\u8fc7\uff0c\u4e00\u4e2a\u4eba\u8981\u6d3b\u6210\u4e00\u652f\u961f\u4f0d\u3002\u540c\u6837\u7684\uff0c\u4e00\u4e2a\u4eba\u4e5f\u8981\u6709\u4e2a\u5bb6\u3002\u5bb6\u662f\u5feb\u8282\u594f\u751f\u6d3b\u7684\u4e00\u5904\u7cbe\u795e\u7f13\u51b2\u5730\uff0c\u5c45\u4f4f\u54c1\u8d28\u8d8a\u9ad8\uff0c\u6cbb\u6108\u6027\u8d8a\u5f3a\u3002\u8f9b\u82e6\u52b3\u7d2f\u4e00\u5929\uff0c\u63a8\u5f00\u5bb6\u95e8\uff0c\u4e00\u9762\u4e66\u5899\uff0c\u4e00\u5f20\u5927\u5e8a\uff0c\u4e00\u6247\u7a97\u2026\u2026\u4e00\u5929\u7684\u75b2\u60eb\u611f\u90fd\u4f1a\u9010\u6e10\u6d88\u6563\u3002\u4eca\u5929\u805a\u7126\u660c\u5e73\uff0c\u7cbe\u9009\u4e00\u5c45\u5ba4\uff0c\u8ba9\u4f60\u4e00\u4e2a\u4eba\u4e5f\u6709\u5bb6\u7684\u5f52\u5c5e\u611f\u3002\n\n\u6838\u5fc3\u5356\u70b9\uff1a\u6b64\u623f\u662f2003\u5e74\u5efa\u6210\u7684\u7535\u68af\u623f\uff0c\u6ee1\u4e94",
			"v_txt": "\u4f5c\u5bb6\u5218\u745c\u8bf4\u8fc7\uff0c\u4e00\u4e2a\u4eba\u8981\u6d3b\u6210\u4e00\u652f\u961f\u4f0d\u3002\u540c\u6837\u7684\uff0c\u4e00\u4e2a\u4eba\u4e5f\u8981\u6709\u4e2a\u5bb6\u3002\u5bb6\u662f\u5feb\u8282\u594f\u751f\u6d3b\u7684\u4e00\u5904\u7cbe\u795e\u7f13\u51b2\u5730\uff0c\u5c45\u4f4f\u54c1",
			"posted_time": 1551082485,
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
			"summary": "\u8d22\u5988\u8bf4\u4e28\u8d22\u5546",
			"content_sub": "\u6211\u4eec\u90fd\u77e5\u9053\u4e70\u623f\u5b50\uff0c\u77ed\u671f\u770b\u91d1\u878d\uff0c\u4e2d\u671f\u770b\u571f\u5730\uff0c\u957f\u671f\u770b\u4eba\u53e3\u3002\u5728\u8fd9\u4e2a\u91d1\u79d1\u7389\u5f8b\u4e2d\uff0c\u201c\u4eba\u53e3\u201d\u662f\u4e00\u9879\u91cd\u8981\u7684\u6307\u6807\uff0c\u5173\u7cfb\u5230\u4f60\u4e70\u7684\u623f\u5b50\u80fd\u5426\u957f\u671f\u5347\u503c\u3002\u90a3\u4e48\uff0c\u76ee\u524d\u5404\u4e2a\u57ce\u5e02\u7684\u4eba\u53e3\u6d41\u52a8\u662f\u4ec0\u4e48\u60c5\u51b5\u5462\uff1f\u6700\u8fd1\u6709\u4e2a\u8001\u5916\u56e2\u961f\u6839\u636e\u5168\u7403\u4eba\u53e3\u7684\u5bc6\u96c6\u7a0b\u5ea6\u505a\u4e86\u4e00\u4e2a\u201c\u4eba\u53e3\u5c71\u201d\u5730\u56fe\u7684\u9879\u76ee\uff0c\u5176\u4e2d\u5c31\u6709\u4e2d\u56fd\u3002\u63a5\u4e0b\u6765\u6211\u5e26\u5927\u5bb6\u4e00\u8d77\u6765\u770b\u4e00\u4e0b\u5404\u4e2a\u57ce\u5e02\u76ee\u524d\u7684\u4eba\u53e3\u6d41",
			"v_txt": "\u8d22\u5988\u8bf4\u4e28\u8d22\u5546",
			"beikehao_show_txt": "\u6700\u61c2\u5bb6\u5ead\u7406\u8d22\u768480\u540e\u5b9d\u5988\u3002\u5de6\u624b\u7406\u8d22\uff0c\u53f3\u624b\u8bfb\u5fc3\uff0c\u505a\u4e00\u4e2a\u6709\u94b1\u6709\u667a\u6167\u7684\u5973\u4eba\u3002",
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
			"summary": "\u9999\u6cb3\u697c\u5e02\u8d77\u6ce2\u6f9c",
			"content_sub": "\u5317\u4e09\u53bf\u6bd5\u7adf\u4e00\u8109\u76f8\u627f\u3002\u7ee7\u71d5\u90ca\u4e4b\u540e\uff0c\u697c\u5e02\u7684\u590d\u82cf\u4e4b\u5149\uff0c\u53c8\u5230\u4e86\u9999\u6cb3\u3002\u8fd1\u65e5\uff0c\u636e\u300a\u5317\u4eac\u5546\u62a5\u300b\u7b49\u5a92\u4f53\u62a5\u9053\uff0c\u6c89\u5bc2\u5df2\u4e45\u7684\u9999\u6cb3\u697c\u5e02\uff0c\u56e0\u4e00\u4f17\u623f\u5730\u4ea7\u7ecf\u7eaa\u673a\u6784\u7ecf\u7eaa\u4eba\u7684\u697c\u76d8\u63a8\u4ecb\u6587\u6848\u8d77\u4e86\u6ce2\u6f9c\u3002\u201c\u901a\u77e5\uff01\u5916\u5730\u4eba\u53ef\u4ee5\u7b2c\u4e00\u8003\u8651\u8fd9\u4e2a\u9879\u76ee\uff01\u9999\u6cb3\u5927\u7231\u57ce\u5df2\u7ecf\u89e3\u9664\u9650\u8d2d\u4e86\uff01\u201d\u8fd1\u65e5\uff0c\u4e00\u5219\u5173\u4e8e\u9999\u6cb3\u697c\u76d8\u653e\u5f00\u9650\u8d2d\u7684\u6d88\u606f\u5728\u7f51\u4e0a\u8fc5\u901f\u6d41\u4f20\u3002\u6839\u636e\u6d88\u606f\uff0c\u5916\u5730\u4eba\u53ea\u8981",
			"v_txt": "\u9999\u6cb3\u697c\u5e02\u8d77\u6ce2\u6f9c",
			"beikehao_show_txt": "\u4e2d\u56fd\u697c\u5e02\u6700\u6709\u601d\u60f3\u529b\u3001\u8d44\u8baf\u529b\u7684\u81ea\u5a92\u4f53\uff0c\u6df1\u5ea6\u5173\u6ce8\u697c\u5e02\u8d8b\u52bf\uff0c\u5173\u6ce8\u6bcf\u4e2a\u4eba\u7684\u8d22\u5bcc\u5347\u503c\uff01",
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
			"summary": "\u65b0\u5efa\u4f4f\u5b85\u8981\u5168\u88c5\u4fee\u4ea4\u4ed8!",
			"content_sub": "\u201c\u4f4f\u5b85\u5efa\u7b51\u5e94\u4ee5\u5957\u5185\u4f7f\u7528\u9762\u79ef\u8fdb\u884c\u4ea4\u6613\u3002\u201d\u4f4f\u623f\u548c\u57ce\u4e61\u5efa\u8bbe\u90e8\u516c\u5e03\u7684\u4e00\u9879\u65b0\u89c4\u5f81\u6c42\u610f\u89c1\u7a3f\u663e\u793a\uff0c\u623f\u5730\u4ea7\u4ea4\u6613\u5c06\u6b63\u5f0f\u544a\u522b\u201c\u516c\u644a\u9762\u79ef\u201d\uff0c\u8fd1\u4e00\u5e74\u6765\u8206\u8bba\u5bc6\u5207\u5173\u6ce8\u7684\u201c\u4e70100\u5e73\u7c73\u623f\u5b50\u53ea\u5f9770\u5e73\u7c73\u201d\u73b0\u8c61\u6709\u671b\u7ec8\u7ed3\u30022\u670818\u65e5\uff0c\u4f4f\u623f\u548c\u57ce\u4e61\u5efa\u8bbe\u90e8\u5b98\u65b9\u7f51\u7ad9\u53d1\u5e03\u300a\u5173\u4e8elt\u57ce\u4e61\u7ed9\u6c34\u5de5\u7a0b\u9879\u76ee\u89c4\u8303gt\u7b4938\u9879\u4f4f\u623f\u548c\u57ce\u4e61\u5efa\u8bbe\u9886\u57df\u5168\u6587\u5f3a\u5236\u6027\u5de5",
			"v_txt": "\u65b0\u5efa\u4f4f\u5b85\u8981\u5168\u88c5\u4fee\u4ea4\u4ed8!",
			"beikehao_show_txt": "\u5173\u4e8e\u5317\u4eac\u4e70\u623f\u7684\u4e00\u5207\uff0c\u6211\u4eec\u90fd\u77e5\u9053\u3002",
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
			"summary": "\u5173\u6ce8\u901a\u5dde\u5c0f\u5175\uff08tzxb1986\uff09\uff0c\u4e86\u89e3\u66f4\u591a\u901a\u5dde\u5403\u559d\u73a9\u4e50\u65b0\u9c9c\u8d44\u8baf\uff01",
			"content_sub": "\u8054\u7cfb\u6211\u4eecgtgtgt\u672c\u5730\u8d44\u8baf\u7206\u6599\u3001\u5403\u559d\u73a9\u4e50\u63a8\u8350\u4e2a\u4eba\u5fae\u4fe1\uff1atzx523\u5317\u4eac\u73af\u7403\u4e3b\u9898\u516c\u56ed\u3001\u901a\u5dde\u73af\u7403\u5f71\u57ce\u3001\u73af\u7403\u5f71\u57ce\u2026\u2026\u5907\u53d7\u5927\u5bb6\u5173\u6ce8\u7684\u5728\u54b1\u901a\u5dde\u5c06\u6b63\u5728\u52a0\u901f\u5efa\u8bbe\u7684\u201c\u73af\u7403\u5f71\u57ce\u201d\uff0c\u7ec8\u4e8e\u6709\u4e86\u6b63\u5f0f\u540d\u79f0--\u201c\u5317\u4eac\u73af\u7403\u5ea6\u5047\u533a\u201d\uff0c\u82f1\u6587\u540d\u4e3aUiveral Beijig Reort\uff0c\u7b80\u5199\u4e3aUBR\u3002\u5317\u4eac\u73af\u7403\u5ea6\u5047\u533a\u5317\u4eac\u73af\u7403\u5ea6\u5047\u533a\u9879",
			"v_txt": "\u5173\u6ce8\u901a\u5dde\u5c0f\u5175\uff08tzxb1986\uff09\uff0c\u4e86\u89e3\u66f4\u591a\u901a\u5dde\u5403\u559d\u73a9\u4e50\u65b0\u9c9c\u8d44\u8baf\uff01",
			"beikehao_show_txt": "\u201c\u901a\u5dde\u5c0f\u5175\u201d\u4e13\u6ce8\u901a\u5dde\u672c\u5730\u751f\u6d3b\u8d44\u8baf\uff0c\u7f51\u7f57\u5403\u559d\u73a9\u4e50\u4fe1\u606f\uff0c\u7b2c\u4e00\u65f6\u95f4\u7206\u6599\u4f60\u4e0d\u77e5\u9053\u7684\u901a\u5dde\u4e8b\u513f\uff01",
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
			"summary": "\u4eca\u5929\uff0c\u963f\u5386\u60f3\u7ed9\u8ddf\u5927\u5bb6\u804a\u804a\u4e00\u4e2a\u88ab\u5f88\u591a\u8d2d\u623f\u8005\uff0c\u751a\u81f3\u5730\u4ea7\u548c\u4e2d\u4ecb\u4eba\u58eb\u90fd\u5e38\u5ffd\u7565\u7684\u6307\u6807\u2014\u2014\u6cd5\u9662\u62cd\u5356\u623f\u4ea7\u7684\u6570\u636e\u3002",
			"content_sub": "\u5927\u5bb6\u597d\uff0c\u6211\u662f\u963f\u5386\u3002\u524d\u51e0\u5929\u7684\u6587\u7ae0\u91cc\u6211\u6839\u636e2018\u5e74\u697c\u5e02\u98ce\u5411\u53d1\u751f\u53d8\u5316\u540e\u63d0\u51fa\u4e86\u4e00\u4e9b\u65b0\u7684\u8d2d\u623f\u6307\u5bfc\u3002\u8fd9\u4e9b\u89c4\u5219\u662f\u6839\u636e\u5f53\u5730\u7684\u4eba\u53e3\uff0c\u4ea7\u4e1a\u548c\u8d44\u91d1\u6765\u786e\u5b9a\u662f\u5426\u6709\u771f\u5b9e\u7684\u9700\u6c42\u548c\u4e0a\u6da8\u7a7a\u95f4\u3002\u4f46\u662f\u4eca\u5929\uff0c\u963f\u5386\u60f3\u7ed9\u8ddf\u5927\u5bb6\u804a\u804a\u4e00\u4e2a\u88ab\u5f88\u591a\u8d2d\u623f\u8005\uff0c\u751a\u81f3\u5730\u4ea7\u548c\u4e2d\u4ecb\u4eba\u58eb\u90fd\u5e38\u5ffd\u7565\u7684\u6307\u6807\u2014\u2014\u6cd5\u9662\u62cd\u5356\u623f\u4ea7\u7684\u6570\u636e\u3002\u4ec0\u4e48\u662f\u6cd5\u62cd\u623f\uff0c\u4eba\u4eec\u4e3a\u4ec0\u4e48\u8981\u4e70\uff1f\u901a\u4fd7\u7406",
			"v_txt": "\u4eca\u5929\uff0c\u963f\u5386\u60f3\u7ed9\u8ddf\u5927\u5bb6\u804a\u804a\u4e00\u4e2a\u88ab\u5f88\u591a\u8d2d\u623f\u8005\uff0c\u751a\u81f3\u5730\u4ea7\u548c\u4e2d\u4ecb\u4eba\u58eb\u90fd\u5e38\u5ffd\u7565\u7684\u6307\u6807\u2014\u2014\u6cd5\u9662\u62cd\u5356\u623f\u4ea7\u7684\u6570\u636e\u3002",
			"beikehao_show_txt": "\u5b9e\u5b9e\u5728\u5728\u804a\u5730\u4ea7\uff0c\u8ba4\u8ba4\u771f\u771f\u8c08\u4e70\u623f\u3002",
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
			"content_sub": "\u56fd\u5bb6\u53d1\u5c55\u6539\u9769\u59d4\u5458\u4f1a\u4eca\u5929\u53d1\u5e03\u300a\u5173\u4e8e\u57f9\u80b2\u53d1\u5c55\u73b0\u4ee3\u5316\u90fd\u5e02\u5708\u7684\u6307\u5bfc\u610f\u89c1\u300b\u4e2d\u63d0\u51fa\uff0c\u672a\u6765\u5c06\u52a0\u5feb\u4eba\u529b\u8d44\u6e90\u5e02\u573a\u4e00\u4f53\u5316\u3002\u653e\u5f00\u653e\u5bbd\u9664\u4e2a\u522b\u8d85\u5927\u57ce\u5e02\u5916\u7684\u57ce\u5e02\u843d\u6237\u9650\u5236\u3002\u8be5\u300a\u610f\u89c1\u300b\u4e2d\u660e\u786e\uff0c\u5728\u5177\u5907\u6761\u4ef6\u7684\u90fd\u5e02\u5708\u7387\u5148\u5b9e\u73b0\u6237\u7c4d\u51c6\u5165\u5e74\u9650\u540c\u57ce\u5316\u7d2f\u79ef\u4e92\u8ba4\uff0c\u52a0\u5feb\u6d88\u9664\u57ce\u4e61\u533a\u57df\u95f4\u6237\u7c4d\u58c1\u5792\uff0c\u7edf\u7b79\u63a8\u8fdb\u672c\u5730\u4eba\u53e3\u548c\u5916\u6765\u4eba\u53e3\u5e02\u6c11\u5316\uff0c\u4fc3\u8fdb\u4eba\u53e3\u6709\u5e8f\u6d41\u52a8\u3001\u5408\u7406",
			"v_txt": "\u5229\u597d\u6d88\u606f\uff01",
			"beikehao_show_txt": "\u514b\u800c\u745e\u623f\u4ef7\u5317\u4eac\u662f\u96b6\u5c5e\u4e8e\u6613\u5c45\u4f01\u4e1a\u96c6\u56e2\uff0c\u4ee5\u623f\u5730\u4ea7\u5927\u6570\u636e\u4e3a\u6838\u5fc3\uff0c\u5b9e\u65f6\u5206\u6790\u884c\u4e1a\u54a8\u8be2\uff0c\u63d0\u4f9b\u884c\u4e1a\u4e13\u4e1a\u89e3\u6790\u3002",
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
  Future<List> testFeed() async {
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

