import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:integration_test/integration_test.dart';
import 'package:movies_test/core/injector/injection_container.dart';

import 'movies/movies_integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  // Load variables from .env
  _initEnv();
  //simple search movies
  MoviesIntegrationTest().searchMovies();
}

Future<void> _initEnv() async {
  await dotenv.load();
  await configureDependencies();

}
