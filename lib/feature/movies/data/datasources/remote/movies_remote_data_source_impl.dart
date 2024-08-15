import 'package:injectable/injectable.dart';

import '../../../../../core/constants/api_constants.dart';
import '../../../../../core/network/client.dart';
import '../../models/movies_model.dart';
import 'movies_remote_data_source.dart';

@Injectable(as: MoviesRemoteDataSource)
class MoviesRemoteDataSourceImpl extends MoviesRemoteDataSource {
  final AppClient? appClient;

  MoviesRemoteDataSourceImpl({required this.appClient});

  @override
  Future<List<MoviesModel>> getTrendingMovies({
    int page = 0,
    int limit = 10,
  }) async {
    final res = await appClient?.get(
      ApiConstants.getTrendingMoviesOfDay,
      queryParams: {
        'page': page,
        'limit': limit,
      },
    );

    final data = res?.data['results'] as List;
    return data.map((e) => MoviesModel.fromJson(e)).toList();
  }

  @override
  Future<MoviesModel> getMovies({required int id}) async {
    final res = await appClient?.get('${ApiConstants.getMovies}/$id');
    return MoviesModel.fromJson(res?.data);
  }

  //load more
  @override
  Future<List<MoviesModel>> search({String? query}) async {
    final res = await appClient?.get(
      ApiConstants.searchMovies,
      queryParams: {
        'query': query,
      },
    );

    final data = res?.data['results'] as List;
    return data.map((e) => MoviesModel.fromJson(e)).toList();
  }
}
