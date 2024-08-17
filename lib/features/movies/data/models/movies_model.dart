import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/movie_entity.dart';

part 'movies_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class MoviesModel extends MovieEntity {
  const MoviesModel({
    super.backdropPath,
    super.id,
    super.title,
    super.originalTitle,
    super.overview,
    super.posterPath,
    super.mediaType,
    super.adult,
    super.originalLanguage,
    super.genreIds,
    super.popularity,
    super.releaseDate,
    super.video,
    super.voteAverage,
    super.voteCount,
  });

  factory MoviesModel.fromJson(Map<String, dynamic> json) =>
      _$MoviesModelFromJson(json);

  Map<String, dynamic> toJson() => _$MoviesModelToJson(this);
}
