import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/genre_entity.dart';

part 'genre_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class GenreModel extends GenreEntity {
  GenreModel({super.id, super.name});

  factory GenreModel.fromJson(Map<String, dynamic> json) =>
      _$GenreModelFromJson(json);

  Map<String, dynamic> toJson() => _$GenreModelToJson(this);

  GenreEntity toEntity() {
    return GenreEntity(
      id: id,
      name: name,
    );
  }
}
