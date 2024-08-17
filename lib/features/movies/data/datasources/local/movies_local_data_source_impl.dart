import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:movies_test/core/constants/constants.dart';
import 'package:movies_test/core/extensions/extensions.dart';
import 'package:movies_test/core/utils/logger_util.dart';
import 'package:movies_test/features/movies/data/models/movie_detail_model.dart';
import 'package:movies_test/features/movies/data/models/movies_model.dart';

import '../../../../../core/utils/spref_util.dart';
import 'movies_local_data_source.dart';

@Injectable(as: MoviesLocalDataSource)
class MoviesLocalDataSourceImpl implements MoviesLocalDataSource {
  final SPrefUtil sPrefUtil;

  MoviesLocalDataSourceImpl(this.sPrefUtil);

  /// Sample code (local) using SharedPreferences to save cached data.
  ///
  /// For more advanced scenarios, consider using local databases such as SQLite, Hive, or Isar
  /// to handle data storage, manage old data, and perform other data management tasks.

  @override
  Future<void> cacheMovie(MovieDetailModel item) async {
    List<MovieDetailModel> existingMovies = await _getCachedMovieDetail();

    _updateOrAddMovie(existingMovies, item);

    await _saveMovies(existingMovies.toSet().toList());
    appLog.i('Cached movie id: ${item.id}');
  }

  @override
  Future<void> cacheTrendingMovies(List<MoviesModel> items) async {
    List<MoviesModel> existingMovies = await getTrendingMovies();

    List<MoviesModel> combinedMovies = List.from(existingMovies)..addAll(items);
    List<MoviesModel> uniqueMovies = combinedMovies.toSet().toList();
    String combinedMoviesJson = jsonEncode(
      uniqueMovies
          .map(
            (e) => e.toJson(),
          )
          .toList(),
    );
    await sPrefUtil.setString(
      SPrefConstants.trendingMovies,
      combinedMoviesJson,
    );
    appLog.i('Cached trending movies ${uniqueMovies.length}');
  }

  @override
  Future<List<MoviesModel>> getTrendingMovies() async {
    String? existingMoviesJson =
        await sPrefUtil.getString(SPrefConstants.trendingMovies);

    if (existingMoviesJson == null) {
      return [];
    }

    List decodedList = jsonDecode(existingMoviesJson);
    return decodedList.map((e) => MoviesModel.fromJson(e)).toList();
  }

  @override
  Future<MovieDetailModel?> getMovie({required int id}) async {
    String? existingMoviesJson = await sPrefUtil.getString(
      SPrefConstants.movies,
    );
    List<MovieDetailModel> existingMovies = [];

    if (existingMoviesJson != null) {
      List decodedList = jsonDecode(existingMoviesJson);
      existingMovies = decodedList
          .map(
            (e) => MovieDetailModel.fromJson(e),
          )
          .toList();
    }
    return existingMovies.firstWhereOrNull((e) => e.id == id);
  }

  Future<List<MovieDetailModel>> _getCachedMovieDetail() async {
    String? existingMoviesJson =
        await sPrefUtil.getString(SPrefConstants.movies);

    if (existingMoviesJson == null) {
      return [];
    }

    List decodedList = jsonDecode(existingMoviesJson);
    return decodedList.map((e) => MovieDetailModel.fromJson(e)).toList();
  }

  void _updateOrAddMovie(List<MovieDetailModel> movies, MovieDetailModel item) {
    int index = movies.indexWhere((element) => element.id == item.id);

    if (index != -1) {
      movies[index] = item;
    } else {
      movies.add(item);
    }
  }

  //save movie detail
  Future<void> _saveMovies(List<MovieDetailModel> movies) async {
    String updatedMoviesJson = jsonEncode(movies
        .map(
          (e) => e.toJson(),
        )
        .toList());
    await sPrefUtil.setString(SPrefConstants.movies, updatedMoviesJson);
  }
}
