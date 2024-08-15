import '../../models/movies_model.dart';

abstract class LocalDataSource {
  Future<List<MoviesModel>> getLastCachedData();

  Future<void> cacheData(List<MoviesModel> items);
}
