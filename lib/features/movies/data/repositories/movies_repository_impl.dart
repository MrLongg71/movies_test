import 'package:injectable/injectable.dart';
import 'package:movies_test/core/constants/error_constants.dart';
import 'package:movies_test/core/exceptions/app_exception.dart';
import 'package:movies_test/core/models/base_error_res_model.dart';
import 'package:movies_test/core/network/network_info.dart';
import 'package:movies_test/features/movies/data/models/movie_detail_model.dart';
import 'package:movies_test/features/movies/data/models/movies_model.dart';
import 'package:movies_test/features/movies/domain/entities/movie_detail_entity.dart';

import '../../domain/entities/movie_entity.dart';
import '../../domain/repositories/movies_repository.dart';
import '../datasources/local/movies_local_data_source.dart';
import '../datasources/remote/movies_remote_data_source.dart';

@Injectable(as: MoviesRepository)
class MoviesRepositoryImpl extends MoviesRepository {
  final MoviesRemoteDataSource remoteDataSource;
  final MoviesLocalDataSource localDataSource;
  final NetworkInfoImpl networkInfo;

  MoviesRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<List<MovieEntity>> getTrendingMovies({
    required int page,
    required int limit,
  }) async {
    if (await networkInfo.isConnected) {
      return _fetchAndCacheTrendingMovies(page: page, limit: limit);
    } else {
      return _getCachedTrendingMovies();
    }
  }

  Future<List<MovieEntity>> _fetchAndCacheTrendingMovies({
    required int page,
    required int limit,
  }) async {
    List<MoviesModel> movies = await remoteDataSource.getTrendingMovies(
      page: page,
      limit: limit,
    );
    await localDataSource.cacheTrendingMovies(movies);
    return movies;
  }

  Future<List<MovieEntity>> _getCachedTrendingMovies() async {
    List<MoviesModel> cachedMovies = await localDataSource.getTrendingMovies();
    if (cachedMovies.isEmpty) {
      throw AppException(
        err: BaseErrorResModel(
          statusCode: ErrorConstants.networkErrorCode,
          statusMessage: 'No cached data found and no network connection.',
        ),
      );
    }
    return cachedMovies;
  }

  @override
  Future<MovieDetailEntity> getMovie({required int id}) async {
    if (await networkInfo.isConnected) {
      return _fetchAndCacheMovie(id: id);
    } else {
      return _getCachedMovie(id: id);
    }
  }

  Future<MovieDetailEntity> _fetchAndCacheMovie({required int id}) async {
    MovieDetailModel movieDetail = await remoteDataSource.getMovie(id: id);
    await localDataSource.cacheMovie(movieDetail);
    return movieDetail;
  }

  Future<MovieDetailEntity> _getCachedMovie({required int id}) async {
    MovieDetailModel? cachedMovieDetail =
        await localDataSource.getMovie(id: id);
    if (cachedMovieDetail == null) {
      throw AppException(
        err: BaseErrorResModel(
          statusCode: ErrorConstants.networkErrorCode,
          statusMessage: 'No cached movie found for id: $id.',
        ),
      );
    }
    return cachedMovieDetail;
  }

  @override
  Future<List<MovieEntity>> search({String? query}) {
    return remoteDataSource.search(query: query);
  }
}
