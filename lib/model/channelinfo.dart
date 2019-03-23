/// 返回结果 频道信息
/// 工具生成 https://blog.csdn.net/u014205247/article/details/80652350
///
///参考 https://flutterchina.club/json/
///生成json类： flutter packages pub run build_runner build
///更新json类： flutter packages pub run build_runner watch
///@JsonKey设置序列化key值， 作用同Gson的@SerializaName
///
import 'package:json_annotation/json_annotation.dart';

part 'channelinfo.g.dart';

@JsonSerializable()
class ChannelInfo {
  ChannelInfo(this.name, this.key);
  String name;
  String key;

  factory ChannelInfo.fromJson(Map<String, dynamic> json) => _$ChannelInfoFromJson(json);

  Map<String, dynamic> toJson() => _$ChannelInfoToJson(this);
}