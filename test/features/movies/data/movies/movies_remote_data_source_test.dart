import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movies_test/core/constants/api_constants.dart';
import 'package:movies_test/features/movies/data/datasources/remote/movies_remote_data_source_impl.dart';
import 'package:movies_test/features/movies/data/models/movie_detail_model.dart';
import 'package:movies_test/features/movies/data/models/movies_model.dart';

import '../../../../utils/dummy/json_reader.dart';
import '../../../../utils/mocks/mocks.mocks.dart';

void main() {
  late MockAppClient mockDioClient;
  late final MoviesRemoteDataSourceImpl moviesRemoteDataSourceImpl;

  late final List<MoviesModel> trendingMoviesModelList;
  late final Map<String, dynamic> trendingMoviesModelJson;

  late final MovieDetailModel movieDetailModel;
  late final Map<String, dynamic> movieDetailModelJson;

  setUpAll(() {
    mockDioClient = MockAppClient();
    moviesRemoteDataSourceImpl =
        MoviesRemoteDataSourceImpl(appClient: mockDioClient);

    trendingMoviesModelJson = jsonReader('trending_movies_dummy_data.json');
    movieDetailModelJson = jsonReader('movie_detail_dummy_data.json');

    trendingMoviesModelList = (trendingMoviesModelJson['results'] as List)
        .map((e) => MoviesModel.fromJson(e))
        .toList();
    movieDetailModel = MovieDetailModel.fromJson(movieDetailModelJson);
  });

  //* This is  the simple test for the getTrendingMovies() method
  group('getTrendingMovies', () {
    const int page = 1;

    late final Response<dynamic> response;

    setUpAll(() {
      response = Response<dynamic>(
        data: trendingMoviesModelJson,
        requestOptions: RequestOptions(
          path: ApiConstants.getTrendingMoviesOfDay,
          queryParameters: {
            'page': page,
            'limit': ApiConstants.limitRequest,
          },
        ),
      );
    });

    test('should return a List<MoviesModel> when the call is successful',
        () async {
      when(
        mockDioClient.get(
          ApiConstants.getTrendingMoviesOfDay,
          queryParams: {
            'page': page,
            'limit': ApiConstants.limitRequest,
          },
        ),
      ).thenAnswer(
        (_) async => response,
      );

      final result =
          await moviesRemoteDataSourceImpl.getTrendingMovies(page: page);

      expect(result, isA<List<MoviesModel>>());
      expect(result, equals(trendingMoviesModelList));
    });

    test('should throw an [Exception()] when the call is unsuccessful',
        () async {
      when(
        mockDioClient.get(
          ApiConstants.getTrendingMoviesOfDay,
          queryParams: {
            'page': page,
            'limit': ApiConstants.limitRequest,
          },
        ),
      ).thenThrow(Exception());

      final result = moviesRemoteDataSourceImpl.getTrendingMovies(
        page: page,
        limit: ApiConstants.limitRequest,
      );

      expect(result, throwsException);
    });
  });

  //* This is  the simple test for the getMovie() method
  group('getMovie', () {
    int id = 945961;

    late final Response<dynamic> response;

    setUpAll(() {
      response = Response<dynamic>(
        data: movieDetailModelJson,
        requestOptions: RequestOptions(
          path: '${ApiConstants.getMovies}/$id',
          queryParameters: {
            'append_to_response': 'similar',
          },
        ),
      );
    });

    test('should return a MovieDetailModel when the call is successful',
        () async {
      when(
        mockDioClient.get(
          '${ApiConstants.getMovies}/$id',
          queryParams: {
            'append_to_response': 'similar',
          },
        ),
      ).thenAnswer(
        (_) async => response,
      );

      final result = await moviesRemoteDataSourceImpl.getMovie(id: id);

      expect(result, isA<MovieDetailModel>());
      expect(result, equals(movieDetailModel));
    });

    test('should throw an [Exception()] when the call is unsuccessful',
        () async {
      when(
        mockDioClient.get(
          '${ApiConstants.getMovies}/$id',
          queryParams: {
            'append_to_response': 'similar',
          },
        ),
      ).thenThrow(Exception());

      final result = moviesRemoteDataSourceImpl.getMovie(id: id);

      expect(result, throwsException);
    });
  });
}
