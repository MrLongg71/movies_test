import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movies_test/core/constants/api_constants.dart';
import 'package:movies_test/features/movies/data/datasources/remote/movies_remote_data_source_impl.dart';
import 'package:movies_test/features/movies/data/models/movies_model.dart';

import '../../../../utils/dummy/json_reader.dart';
import '../../../../utils/mocks/mocks.mocks.dart';

void main() {
  late MockAppClient mockDioClient;
  late final MoviesRemoteDataSourceImpl moviesRemoteDataSourceImpl;

  late final List<MoviesModel> trendingMoviesModelList;

  late final Map<String, dynamic> trendingMoviesModelJson;

  setUpAll(() {
    mockDioClient = MockAppClient();
    moviesRemoteDataSourceImpl =
        MoviesRemoteDataSourceImpl(appClient: mockDioClient);

    trendingMoviesModelJson = jsonReader('trending_movies_dummy_data.json');

    trendingMoviesModelList = (trendingMoviesModelJson['results'] as List)
        .map((e) => MoviesModel.fromJson(e))
        .toList();
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
      // Arrange
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

      // Act
      final result =
          await moviesRemoteDataSourceImpl.getTrendingMovies(page: page);

      // Assert
      expect(result, isA<List<MoviesModel>>());
      expect(result, equals(trendingMoviesModelList));
    });
    //
    test('should throw an [Exception()] when the call is unsuccessful',
        () async {
      // Arrange
      when(
        mockDioClient.get(
          ApiConstants.getTrendingMoviesOfDay,
          queryParams: {
            'page': page,
            'limit': ApiConstants.limitRequest,
          },
        ),
      ).thenThrow(Exception());

      // Act
      final result = moviesRemoteDataSourceImpl.getTrendingMovies(page: page);

      // Assert
      expect(result, throwsException);
    });
  });
}
