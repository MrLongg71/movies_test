import 'package:injectable/injectable.dart';

import '../../domain/entities/movies_entity.dart';
import '../../domain/repositories/movies_repository.dart';
import '../datasources/remote/movies_remote_data_source.dart';

@Injectable(as: MoviesRepository)
class MoviesRepositoryImpl extends MoviesRepository {
  final MoviesRemoteDataSource moviesRemoteDataSource;

  MoviesRepositoryImpl({required this.moviesRemoteDataSource});

  @override
  Future<List<MoviesEntity>> getTrendingMovies({
    int page = 0,
    int limit = 10,
  }) {
    //handle caching data here.
    return moviesRemoteDataSource.getTrendingMovies(
      page: 0,
      limit: 10,
    );
  }

  @override
  Future<MoviesEntity> getMovies({required int id}) {
    return moviesRemoteDataSource.getMovies(id: id);
  }

  @override
  Future<List<MoviesEntity>> search({String? query}) {
    return moviesRemoteDataSource.search(
      query: query,
    );
  }
}
