// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recommand.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Recommand _$RecommandFromJson(Map<String, dynamic> json) {
  return Recommand(
      json['id'] as String,
      json['beike_name'] as String,
      json['beike_id'] as String,
      json['beike_avatar'] as String,
      json['content_id'] as String,
      json['title'] as String,
      (json['pic'] as List)?.map((e) => e as String)?.toList(),
      json['time'] as String,
      json['type'] as int,
      json['recom_type'] as int,
      json['url'] as String,
      json['channel'] as String,
      json['beike_grade'] as String,
      json['content_sub'] as String,
      json['v_txt'] as String,
      json['beikehao_show_txt'] as String,
      json['posted_time'] as int,
      json['show_type'] as int,
      json['img_count'] as int,
      json['show_time'] as String,
      json['is_hot'] as bool,
      json['hot_count'] as int)
    ..flog = json['flog'] == null
        ? null
        : Flog.fromJson(json['flog'] as Map<String, dynamic>);
}

Map<String, dynamic> _$RecommandToJson(Recommand instance) => <String, dynamic>{
      'id': instance.id,
      'beike_name': instance.beike_name,
      'beike_id': instance.beike_id,
      'beike_avatar': instance.beike_avatar,
      'content_id': instance.content_id,
      'title': instance.title,
      'pic': instance.pic,
      'time': instance.time,
      'type': instance.type,
      'recom_type': instance.recom_type,
      'url': instance.url,
      'channel': instance.channel,
      'beike_grade': instance.beike_grade,
      'content_sub': instance.content_sub,
      'v_txt': instance.v_txt,
      'beikehao_show_txt': instance.beikehao_show_txt,
      'posted_time': instance.posted_time,
      'show_type': instance.show_type,
      'img_count': instance.img_count,
      'show_time': instance.show_time,
      'is_hot': instance.is_hot,
      'hot_count': instance.hot_count,
      'flog': instance.flog
    };

Flog _$FlogFromJson(Map<String, dynamic> json) {
  return Flog(
      json['fid'] as String,
      (json['score'] as num)?.toDouble(),
      json['flog'] == null
          ? null
          : FlogExt.fromJson(json['flog'] as Map<String, dynamic>));
}

Map<String, dynamic> _$FlogToJson(Flog instance) => <String, dynamic>{
      'fid': instance.fid,
      'score': instance.score,
      'flog': instance.flog
    };

FlogExt _$FlogExtFromJson(Map<String, dynamic> json) {
  return FlogExt(json['rid'] as String, json['pos'] as int);
}

Map<String, dynamic> _$FlogExtToJson(FlogExt instance) =>
    <String, dynamic>{'rid': instance.rid, 'pos': instance.pos};
