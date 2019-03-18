/// 推荐页面 数据结构
/// 工具生成 https://blog.csdn.net/u014205247/article/details/80652350
///
///参考 https://flutterchina.club/json/
///生成json类： flutter packages pub run build_runner build
///更新json类： flutter packages pub run build_runner watch
///@JsonKey设置序列化key值， 作用同Gson的@SerializaName
import 'package:json_annotation/json_annotation.dart';

part 'recommand.g.dart';

@JsonSerializable()
class Recommand {
  Recommand(this.id, this.beike_name, this.beike_id,
      this.beike_avatar, this.content_id, this.title, this.pic,
      this.time, this.type, this.recom_type, this.url, this.channel,
      this.beike_grade, this.content_sub, this.v_txt, this.beikehao_show_txt,
      this.posted_time, this.show_type, this.img_count, this.show_time,
      this.is_hot, this.hot_count);
  String id;
  String beike_name;
  String beike_id;
  String beike_avatar;
  String content_id;
  String title;
  List<String> pic;
  String time;
  int    type;
  int recom_type;
  String url;
  int  channel;
  String beike_grade;
  String content_sub;
  String v_txt;
  String beikehao_show_txt;
  int posted_time;
  int show_type;
  int img_count;
  String show_time;
  bool is_hot;
  int hot_count;
  Flog flog;

  factory Recommand.fromJson(Map<String, dynamic> json) => _$RecommandFromJson(json);

  Map<String, dynamic> toJson() => _$RecommandToJson(this);
}

@JsonSerializable()
class Flog {
  Flog(this.fid, this.score, this.flog);
  String fid;
  double score;
  @JsonKey(name: "flog")
  FlogExt flog;
  factory Flog.fromJson(Map<String, dynamic> json) => _$FlogFromJson(json);

  Map<String, dynamic> toJson() => _$FlogToJson(this);
}

@JsonSerializable()
class FlogExt {
  FlogExt(this.rid, this.pos);
  String rid;
  int pos;

  factory FlogExt.fromJson(Map<String, dynamic> json) => _$FlogExtFromJson(json);

  Map<String, dynamic> toJson() => _$FlogExtToJson(this);
}