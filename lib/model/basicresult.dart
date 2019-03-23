/// 返回结果 基类
/// 工具生成 https://blog.csdn.net/u014205247/article/details/80652350
///
///参考 https://flutterchina.club/json/
///生成json类： flutter packages pub run build_runner build
///更新json类： flutter packages pub run build_runner watch
///@JsonKey设置序列化key值， 作用同Gson的@SerializaName
///
import 'package:json_annotation/json_annotation.dart';

part 'basicresult.g.dart';

@JsonSerializable()
class BasicResult {
  BasicResult(this.error_code, this.error_msg, this.request_id,
      this.data, this.uniqid);
  int error_code;
  String error_msg;
  int request_id;
  dynamic data;
  String uniqid;


  factory BasicResult.fromJson(Map<String, dynamic> json) => _$BasicResultFromJson(json);

  Map<String, dynamic> toJson() => _$BasicResultToJson(this);
}