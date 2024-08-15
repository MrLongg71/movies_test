part of 'search_movies_bloc.dart';

@freezed
class SearchMoviesEvent with _$SearchMoviesEvent {
  const factory SearchMoviesEvent.onSearchMovies({String? query}) =
      OnSearchMovies;
}
