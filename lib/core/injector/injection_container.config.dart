// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../feature/movies/data/datasources/remote/movies_remote_data_source.dart'
    as _i770;
import '../../feature/movies/data/datasources/remote/movies_remote_data_source_impl.dart'
    as _i179;
import '../../feature/movies/data/repositories/movies_repository_impl.dart'
    as _i573;
import '../../feature/movies/domain/repositories/movies_repository.dart'
    as _i247;
import '../../feature/movies/domain/usecases/get_movies_detail_usecase.dart'
    as _i532;
import '../../feature/movies/domain/usecases/get_trending_movies_usecase.dart'
    as _i32;
import '../../feature/movies/domain/usecases/search_movies_usecase.dart'
    as _i469;
import '../../feature/movies/presentation/blocs/movies_detail/movies_detail_bloc.dart'
    as _i715;
import '../../feature/movies/presentation/blocs/trending_movies/trending_movies_bloc.dart'
    as _i178;
import '../network/client.dart' as _i99;
import '../network/network_info.dart' as _i932;

// initializes the registration of main-scope dependencies inside of GetIt
_i174.GetIt $initGetIt(
  _i174.GetIt getIt, {
  String? environment,
  _i526.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i526.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  gh.factory<_i99.AppClient>(() => _i99.AppClient());
  gh.singleton<_i932.NetworkInfoImpl>(() => _i932.NetworkInfoImpl());
  gh.factory<_i469.SearchMoviesUseCase>(() => _i469.SearchMoviesUseCase(
      moviesRepository: gh<_i247.MoviesRepository>()));
  gh.factory<_i532.GetMoviesDetailUseCase>(() => _i532.GetMoviesDetailUseCase(
      moviesRepository: gh<_i247.MoviesRepository>()));
  gh.factory<_i770.MoviesRemoteDataSource>(
      () => _i179.MoviesRemoteDataSourceImpl(appClient: gh<_i99.AppClient>()));
  gh.factory<_i715.MoviesDetailBloc>(() => _i715.MoviesDetailBloc(
      getMoviesDetailUseCase: gh<_i532.GetMoviesDetailUseCase>()));
  gh.factory<_i178.TrendingMoviesBloc>(() => _i178.TrendingMoviesBloc(
      getTrendingMoviesUseCase: gh<_i32.GetTrendingMoviesUseCase>()));
  gh.factory<_i247.MoviesRepository>(() => _i573.MoviesRepositoryImpl(
      moviesRemoteDataSource: gh<_i770.MoviesRemoteDataSource>()));
  gh.factory<_i32.GetTrendingMoviesUseCase>(() => _i32.GetTrendingMoviesUseCase(
      productRepository: gh<_i247.MoviesRepository>()));
  return getIt;
}
