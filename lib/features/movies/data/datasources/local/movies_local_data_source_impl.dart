import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:movies_test/core/constants/constants.dart';
import 'package:movies_test/features/movies/data/models/movie_detail_model.dart';
import 'package:movies_test/features/movies/data/models/movies_model.dart';

import '../../../../../core/utils/spref_util.dart';
import 'movies_local_data_source.dart';

@Injectable(as: MoviesLocalDataSource)
class MoviesLocalDataSourceImpl implements MoviesLocalDataSource {
  final SPrefUtil sPrefUtil;

  MoviesLocalDataSourceImpl(this.sPrefUtil);

  @override
  Future<void> cacheMovie(MovieDetailModel item) async {
    List<MovieDetailModel> existingMovies = await _getCachedMovieDetail();

    _updateOrAddMovie(existingMovies, item);

    await _saveMovies(existingMovies.toSet().toList());
  }

  @override
  Future<void> cacheTrendingMovies(List<MoviesModel> items) async {
    List<MoviesModel> existingMovies = await getTrendingMovies();

    List<MoviesModel> combinedMovies = List.from(existingMovies)..addAll(items);

    String combinedMoviesJson = jsonEncode(
      combinedMovies
          .map(
            (e) => e.toJson(),
          )
          .toSet()
          .toList(),
    );
    await sPrefUtil.setString(
      SPrefConstants.trendingMovies,
      combinedMoviesJson,
    );
  }

  @override
  Future<MovieDetailModel?> getMovie({required int id}) async {
    String? existingMoviesJson = await sPrefUtil.getString(
      SPrefConstants.trendingMovies,
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
    return existingMovies.firstWhere((e) => e.id == id);
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

  Future<void> _saveMovies(List<MovieDetailModel> movies) async {
    String updatedMoviesJson = jsonEncode(movies
        .map(
          (e) => e.toJson(),
        )
        .toList());
    await sPrefUtil.setString(SPrefConstants.movies, updatedMoviesJson);
  }
}
