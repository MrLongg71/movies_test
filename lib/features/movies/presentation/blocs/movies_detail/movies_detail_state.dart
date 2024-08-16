import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movies_test/core/exceptions/app_exception.dart';

import '../../../domain/entities/movie_detail_entity.dart';

part 'movies_detail_state.freezed.dart';

enum MoviesDetailStatus {
  loading,
  success,
  failure,
}

@freezed
class MoviesDetailState with _$MoviesDetailState {
  const factory MoviesDetailState({
    @Default(MoviesDetailStatus.loading) MoviesDetailStatus status,
    MovieDetailEntity? item,
    AppException? appException,
  }) = _MoviesDetailState;
}
