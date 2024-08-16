import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_test/core/constants/api_constants.dart';
import 'package:movies_test/core/utils/logger_util.dart';

import '../../../domain/entities/movie_entity.dart';
import '../../../domain/usecases/get_trending_movies_usecase.dart';
import 'trending_movies_event.dart';
import 'trending_movies_state.dart';

@injectable
class TrendingMoviesBloc
    extends Bloc<TrendingMoviesEvent, TrendingMoviesState> {
  GetTrendingMoviesUseCase getTrendingMoviesUseCase;

  TrendingMoviesBloc({required this.getTrendingMoviesUseCase})
      : super(
          const TrendingMoviesState(),
        ) {
    on(_onGetTrendingMoviesEvent);
  }

  void _onGetTrendingMoviesEvent(
    OnGetTrendingMoviesEvent event,
    Emitter<TrendingMoviesState> emit,
  ) async {
    emit(
      state.copyWith(
        status: TrendingMoviesStatus.loading,
      ),
    );

    try {
      final List<MovieEntity> items = await getTrendingMoviesUseCase.call(
        Params(
          ApiConstants.limitRequest,
          event.page,
        ),
      );

      LOG.i('OnGetTrendingMoviesEvent Success: ${items.length}');

      emit(state.copyWith(
        status: TrendingMoviesStatus.success,
        items: event.page == 1 ? items : [...state.items, ...items],
      ));
    } catch (e) {
      LOG.i('OnGetTrendingMoviesEvent Error: $e');

      emit(
        state.copyWith(
          status: TrendingMoviesStatus.failure,
        ),
      );
    }
  }
}
