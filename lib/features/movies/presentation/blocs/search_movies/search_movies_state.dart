part of 'search_movies_bloc.dart';

enum SearchMoviesStatus {
  loading,
  success,
  failure,
}

@freezed
class SearchMoviesState with _$SearchMoviesState {
  const factory SearchMoviesState({
    @Default(SearchMoviesStatus.loading) SearchMoviesStatus status,
    @Default([]) List<MovieEntity> items,
  }) = _SearchMoviesState;
}
