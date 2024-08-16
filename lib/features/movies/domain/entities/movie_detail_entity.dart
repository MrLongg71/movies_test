import 'package:equatable/equatable.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/utils/utils.dart';
import 'genre_entity.dart';
import 'production_company_entity.dart';

class MovieDetailEntity extends Equatable {
  final bool? adult;
  final String? backdropPath;
  final int? budget;
  final List<GenreEntity>? genres;
  final String? homepage;
  final int? id;
  final String? imdbId;
  final String? originalLanguage;
  final String? originalTitle;
  final String? overview;
  final double? popularity;
  final String? posterPath;
  final List<ProductionCompanyEntity>? productionCompanies;
  final String? releaseDate;
  final int? revenue;
  final int? runtime;
  final String? status;
  final String? tagline;
  final String? title;
  final bool? video;
  final double? voteAverage;
  final int? voteCount;

  const MovieDetailEntity({
    this.adult,
    this.backdropPath,
    this.budget,
    this.genres,
    this.homepage,
    this.id,
    this.imdbId,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.productionCompanies,
    this.releaseDate,
    this.revenue,
    this.runtime,
    this.status,
    this.tagline,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
  });

  String getBackdropUrl() => '${ApiConstants.baseBackdropUrl}$backdropPath';

  String getVoteAverage() => NumberUtil.convertVote(voteAverage);

  String getYearMovieReleaseDate() =>
      DateUtil.getDate(releaseDate)?.year.toString() ?? '';

  String? getRuntime() => DateUtil.formatTime(runtime);

  String? getVotesCount() {
    if (voteCount == null) return null;
    if (voteCount! < 1000) {
      return '($voteCount)';
    }
    return '(${voteCount! ~/ 1000}k)';
  }

  @override
  List<Object?> get props => [id];
}
