import '../entities/movies_entity.dart';


abstract class MoviesRepository {
  Future<List<MoviesEntity>> getTrendingMovies({int page, int limit});
  Future<MoviesEntity> getMovies({required int id});
  Future<List<MoviesEntity>> search({String? query});
}
