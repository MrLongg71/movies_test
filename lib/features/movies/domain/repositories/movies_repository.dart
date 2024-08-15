import 'package:movies_test/features/movies/domain/entities/movie_detail_entity.dart';

import '../entities/movies_entity.dart';

abstract class MoviesRepository {
  Future<List<MoviesEntity>> getTrendingMovies({int page, int limit});

  Future<MovieDetailEntity> getMovie({required int id});

  Future<List<MoviesEntity>> search({String? query});
}
