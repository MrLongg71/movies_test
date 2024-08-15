import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/production_company_entity.dart';

part 'production_company_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ProductionCompanyModel extends ProductionCompanyEntity {
  ProductionCompanyModel({
    super.id,
    super.logoPath,
    super.name,
    super.originCountry,
  });

  factory ProductionCompanyModel.fromJson(Map<String, dynamic> json) =>
      _$ProductionCompanyModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductionCompanyModelToJson(this);

  ProductionCompanyEntity toEntity() {
    return ProductionCompanyEntity(
      id: id,
      logoPath: logoPath,
      name: name,
      originCountry: originCountry,
    );
  }
}
