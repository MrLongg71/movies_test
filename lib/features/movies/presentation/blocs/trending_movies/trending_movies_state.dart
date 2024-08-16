import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entities/movie_entity.dart';

part 'trending_movies_state.freezed.dart';

enum TrendingMoviesStatus {
  loading,
  success,
  failure,
}

@freezed
class TrendingMoviesState with _$TrendingMoviesState {
  const factory TrendingMoviesState({
    @Default(TrendingMoviesStatus.loading) TrendingMoviesStatus status,
    @Default([]) List<MovieEntity> items,
  }) = _TrendingMoviesState;
}
