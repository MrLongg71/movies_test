import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_test/core/utils/logger_util.dart';

import '../../../domain/entities/movie_detail_entity.dart';
import '../../../domain/usecases/get_movies_detail_usecase.dart';
import 'movies_detail_event.dart';
import 'movies_detail_state.dart';

@injectable
class MoviesDetailBloc extends Bloc<MoviesDetailEvent, MoviesDetailState> {
  GetMoviesDetailUseCase? getMoviesDetailUseCase;

  MoviesDetailBloc({this.getMoviesDetailUseCase})
      : super(const MoviesDetailState()) {
    on(_onGetMoviesEvent);
  }

  void _onGetMoviesEvent(
    OnGetMoviesDetailEvent event,
    Emitter<MoviesDetailState> emit,
  ) async {
    emit(
      state.copyWith(
        status: MoviesDetailStatus.loading,
      ),
    );

    try {
      final MovieDetailEntity? item = await getMoviesDetailUseCase?.call(
        Params(id: event.id),
      );

      emit(state.copyWith(
        status: MoviesDetailStatus.success,
        item: item,
      ));
    } catch (e) {
      LOG.e('OnGetMoviesDetailEvent ${e.toString()}');
      emit(
        state.copyWith(
          status: MoviesDetailStatus.failure,
        ),
      );
    }
  }
}
