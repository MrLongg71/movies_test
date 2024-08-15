import 'package:movies_test/features/movies/data/models/movie_detail_model.dart';

import '../../models/movies_model.dart';

abstract class MoviesRemoteDataSource {
  Future<List<MoviesModel>> getTrendingMovies({
    int page = 1,
    int limit = 20,
  });

  Future<MovieDetailModel> getMovie({required int id});

  Future<List<MoviesModel>> search({String? query});
}
