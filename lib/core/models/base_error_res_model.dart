import 'package:json_annotation/json_annotation.dart';

part 'base_error_res_model.g.dart';

@JsonSerializable()
class BaseErrorResModel {
  @JsonKey(name: 'status_code')
  int? statusCode;
  @JsonKey(name: 'status_message')
  String? statusMessage;
  bool? success;

  factory BaseErrorResModel.fromJson(Map<String, dynamic> json) =>
      _$BaseErrorResModelFromJson(json);

  Map<String, dynamic> toJson() => _$BaseErrorResModelToJson(this);

  BaseErrorResModel({
    this.statusCode,
    this.statusMessage,
    this.success,
  });
}
