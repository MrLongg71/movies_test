// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/movies/data/datasources/remote/movies_remote_data_source.dart'
    as _i448;
import '../../features/movies/data/datasources/remote/movies_remote_data_source_impl.dart'
    as _i587;
import '../../features/movies/data/repositories/movies_repository_impl.dart'
    as _i985;
import '../../features/movies/domain/repositories/movies_repository.dart'
    as _i435;
import '../../features/movies/domain/usecases/get_movies_detail_usecase.dart'
    as _i452;
import '../../features/movies/domain/usecases/get_trending_movies_usecase.dart'
    as _i391;
import '../../features/movies/domain/usecases/search_movies_usecase.dart'
    as _i794;
import '../../features/movies/presentation/blocs/movies_detail/movies_detail_bloc.dart'
    as _i545;
import '../../features/movies/presentation/blocs/trending_movies/trending_movies_bloc.dart'
    as _i394;
import '../network/client.dart' as _i99;

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
  gh.singleton<_i99.AppClient>(() => _i99.AppClient());
  gh.factory<_i545.MoviesDetailBloc>(() => _i545.MoviesDetailBloc(
      getMoviesDetailUseCase: gh<_i452.GetMoviesDetailUseCase>()));
  gh.factory<_i394.TrendingMoviesBloc>(() => _i394.TrendingMoviesBloc(
      getTrendingMoviesUseCase: gh<_i391.GetTrendingMoviesUseCase>()));
  gh.factory<_i794.SearchMoviesUseCase>(() => _i794.SearchMoviesUseCase(
      moviesRepository: gh<_i435.MoviesRepository>()));
  gh.factory<_i452.GetMoviesDetailUseCase>(() => _i452.GetMoviesDetailUseCase(
      moviesRepository: gh<_i435.MoviesRepository>()));
  gh.factory<_i448.MoviesRemoteDataSource>(
      () => _i587.MoviesRemoteDataSourceImpl(appClient: gh<_i99.AppClient>()));
  gh.factory<_i435.MoviesRepository>(() => _i985.MoviesRepositoryImpl(
      moviesRemoteDataSource: gh<_i448.MoviesRemoteDataSource>()));
  gh.factory<_i391.GetTrendingMoviesUseCase>(() =>
      _i391.GetTrendingMoviesUseCase(
          productRepository: gh<_i435.MoviesRepository>()));
  return getIt;
}
