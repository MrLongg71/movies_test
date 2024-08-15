import 'package:freezed_annotation/freezed_annotation.dart';

part 'trending_movies_event.freezed.dart';

@freezed
class TrendingMoviesEvent with _$TrendingMoviesEvent {
  const factory TrendingMoviesEvent.onGetTrendingMoviesEvent() =
      OnGetTrendingMoviesEvent;
}
