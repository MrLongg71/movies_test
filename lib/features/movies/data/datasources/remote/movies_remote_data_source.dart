import '../../models/movies_model.dart';

abstract class MoviesRemoteDataSource {
  Future<List<MoviesModel>> getTrendingMovies({
    int page = 1,
    int limit = 20,
  });

  Future<MoviesModel> getMovies({required int id});
  Future<List<MoviesModel>> search({String? query});
}

