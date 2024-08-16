import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/movie_detail_entity.dart';
import 'genre_model.dart';
import 'production_company_model.dart';

part 'movie_detail_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class MovieDetailModel extends MovieDetailEntity {
  @override
  final List<GenreModel>? genres;
  @override
  final List<ProductionCompanyModel>? productionCompanies;

  MovieDetailModel({
    super.adult,
    super.backdropPath,
    super.budget,
    this.genres,
    super.homepage,
    super.id,
    super.imdbId,
    super.originalLanguage,
    super.originalTitle,
    super.overview,
    super.popularity,
    super.posterPath,
    this.productionCompanies,
    super.releaseDate,
    super.revenue,
    super.runtime,
    super.status,
    super.tagline,
    super.title,
    super.video,
    super.voteAverage,
    super.voteCount,
  }) : super(
          genres: genres?.map((e) => e.toEntity()).toList(),
          productionCompanies: productionCompanies
              ?.map(
                (e) => e.toEntity(),
              )
              .toList(),
        );

  factory MovieDetailModel.fromJson(Map<String, dynamic> json) =>
      _$MovieDetailModelFromJson(json);

  Map<String, dynamic> toJson() => _$MovieDetailModelToJson(this);
}
