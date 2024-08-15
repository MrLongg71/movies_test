import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entities/movies_entity.dart';

part 'search_movies_event.dart';
part 'search_movies_state.dart';
part 'search_movies_bloc.freezed.dart';

class SearchMoviesBloc extends Bloc<SearchMoviesEvent, SearchMoviesState> {
  SearchMoviesBloc() : super(const SearchMoviesState()) {
    on<SearchMoviesEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
