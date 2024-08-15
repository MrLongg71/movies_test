import 'package:freezed_annotation/freezed_annotation.dart';

part 'movies_detail_event.freezed.dart';

@freezed
class MoviesDetailEvent with _$MoviesDetailEvent {
  const factory MoviesDetailEvent.onStarted({required int id}) = OnGetMoviesDetailEvent;
}