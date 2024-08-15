import 'package:movies_test/features/movies/data/models/movie_detail_model.dart';

import '../../models/movies_model.dart';

abstract class MoviesLocalDataSource {
  Future<List<MoviesModel>> getTrendingMovies();

  Future<void> cacheTrendingMovies(List<MoviesModel> items);

  Future<MovieDetailModel?> getMovie({required int id});

  Future<void> cacheMovie(MovieDetailModel item);
}
