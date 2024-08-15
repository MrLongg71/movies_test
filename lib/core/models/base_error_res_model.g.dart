// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_error_res_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseErrorResModel _$BaseErrorResModelFromJson(Map<String, dynamic> json) =>
    BaseErrorResModel(
      statusCode: (json['status_code'] as num?)?.toInt(),
      statusMessage: json['status_message'] as String?,
      success: json['success'] as bool?,
    );

Map<String, dynamic> _$BaseErrorResModelToJson(BaseErrorResModel instance) =>
    <String, dynamic>{
      'status_code': instance.statusCode,
      'status_message': instance.statusMessage,
      'success': instance.success,
    };
