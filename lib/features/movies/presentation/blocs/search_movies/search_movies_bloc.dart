import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_test/core/exceptions/app_exception.dart';
import 'package:movies_test/features/movies/domain/usecases/search_movies_usecase.dart';

import '../../../../../core/utils/utils.dart';
import '../../../domain/entities/movie_entity.dart';

part 'search_movies_bloc.freezed.dart';
part 'search_movies_event.dart';
part 'search_movies_state.dart';

@injectable
class SearchMoviesBloc extends Bloc<SearchMoviesEvent, SearchMoviesState> {
  SearchMoviesUseCase searchMoviesUseCase;

  SearchMoviesBloc({required this.searchMoviesUseCase})
      : super(const SearchMoviesState()) {
    on(_onSearchMovies);
  }

  void _onSearchMovies(
    OnSearchMovies event,
    Emitter<SearchMoviesState> emit,
  ) async {
    try {
      emit(state.copyWith(status: SearchMoviesStatus.loading));

      final List<MovieEntity> items = await searchMoviesUseCase.call(
        SearchParams(query: event.query),
      );

      appLog.i('OnSearchMovies Success: ${items.length}');

      emit(state.copyWith(
        status: SearchMoviesStatus.success,
        items: items,
      ));
    } on AppException catch (e) {
      appLog.i('OnSearchMovies Error: $e');
      emit(
        state.copyWith(
          status: SearchMoviesStatus.failure,
          appException: e,
        ),
      );
    }
  }
}
