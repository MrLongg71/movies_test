import 'package:equatable/equatable.dart';
import 'package:movies_test/core/constants/constants.dart';
import 'package:movies_test/core/utils/date_utils.dart';
import 'package:movies_test/core/utils/number_util.dart';

class MovieEntity extends Equatable {
  final String? backdropPath;
  final int? id;
  final String? title;
  final String? originalTitle;
  final String? overview;
  final String? posterPath;
  final String? mediaType;
  final bool? adult;
  final String? originalLanguage;
  final List<int>? genreIds;
  final double? popularity;
  final String? releaseDate;
  final bool? video;
  final double? voteAverage;
  final int? voteCount;

  const MovieEntity({
    this.backdropPath,
    this.id,
    this.title,
    this.originalTitle,
    this.overview,
    this.posterPath,
    this.mediaType,
    this.adult,
    this.originalLanguage,
    this.genreIds,
    this.popularity,
    this.releaseDate,
    this.video,
    this.voteAverage,
    this.voteCount,
  });

  String getPosterUrl() => '${ApiConstants.basePosterUrl}$posterPath';

  String getVoteAverage() => NumberUtil.convertVote(voteAverage);

  String getYearMovieReleaseDate() =>
      DateUtil.getDate(releaseDate)?.year.toString() ?? '';

  @override
  List<Object?> get props => [id];
}
