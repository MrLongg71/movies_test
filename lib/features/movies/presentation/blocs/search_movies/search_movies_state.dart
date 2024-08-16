part of 'search_movies_bloc.dart';

enum SearchMoviesStatus {
  initial,
  loading,
  success,
  failure,
}

@freezed
class SearchMoviesState with _$SearchMoviesState {
  const factory SearchMoviesState({
    @Default(SearchMoviesStatus.initial) SearchMoviesStatus status,
    @Default([]) List<MovieEntity> items,
    AppException? appException,
  }) = _SearchMoviesState;
}
