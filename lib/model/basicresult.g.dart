// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'basicresult.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BasicResult _$BasicResultFromJson(Map<String, dynamic> json) {
  return BasicResult(json['error_code'] as int, json['error_msg'] as String,
      json['request_id'] as int, json['data'], json['uniqid'] as String);
}

Map<String, dynamic> _$BasicResultToJson(BasicResult instance) =>
    <String, dynamic>{
      'error_code': instance.error_code,
      'error_msg': instance.error_msg,
      'request_id': instance.request_id,
      'data': instance.data,
      'uniqid': instance.uniqid
    };
