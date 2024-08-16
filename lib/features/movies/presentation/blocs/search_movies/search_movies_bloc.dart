import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entities/movie_entity.dart';

part 'search_movies_bloc.freezed.dart';
part 'search_movies_event.dart';
part 'search_movies_state.dart';

class SearchMoviesBloc extends Bloc<SearchMoviesEvent, SearchMoviesState> {
  SearchMoviesBloc() : super(const SearchMoviesState()) {
    on<SearchMoviesEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
