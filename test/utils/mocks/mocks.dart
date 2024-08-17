import 'package:mockito/annotations.dart';
import 'package:movies_test/core/network/client.dart';
import 'package:movies_test/features/movies/data/datasources/remote/movies_remote_data_source.dart';

@GenerateMocks([
  AppClient,
  MoviesRemoteDataSource,
  // MovieLocalDataSource,
  // ActorRemoteDataSource,
  // MovieRepository,
  // ActorRepository,
  // MovieUsecases,
  // ActorUsecases,
])
void main() {}
