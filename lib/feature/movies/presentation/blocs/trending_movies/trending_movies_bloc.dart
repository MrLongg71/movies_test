import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../domain/entities/movies_entity.dart';
import '../../../domain/usecases/get_trending_movies_usecase.dart';

import 'trending_movies_event.dart';
import 'trending_movies_state.dart';

@injectable
class TrendingMoviesBloc extends Bloc<TrendingMoviesEvent, TrendingMoviesState> {
  GetTrendingMoviesUseCase? getTrendingMoviesUseCase;

  TrendingMoviesBloc({this.getTrendingMoviesUseCase})
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
      final List<MoviesEntity>? items = await getTrendingMoviesUseCase?.call(
        Params(
          10,
          state.items.length,
        ),
      );

      emit(state.copyWith(
        status: TrendingMoviesStatus.success,
        items: items ?? [],
      ));
    } catch (e) {
      emit(
        state.copyWith(
          status: TrendingMoviesStatus.failure,
        ),
      );
    }
  }
}
