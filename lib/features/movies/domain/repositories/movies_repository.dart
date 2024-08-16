import 'package:movies_test/features/movies/domain/entities/movie_detail_entity.dart';

import '../entities/movie_entity.dart';

abstract class MoviesRepository {
  Future<List<MovieEntity>> getTrendingMovies(
      {required int page, required int limit});

  Future<MovieDetailEntity> getMovie({required int id});

  Future<List<MovieEntity>> search({String? query});
}
