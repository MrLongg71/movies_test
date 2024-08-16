import 'package:injectable/injectable.dart';

import '../../../../core/usecases/usecase.dart';
import '../entities/movie_entity.dart';
import '../repositories/movies_repository.dart';

@injectable
class GetTrendingMoviesUseCase implements UseCase<List<MovieEntity>, Params> {
  final MoviesRepository productRepository;

  GetTrendingMoviesUseCase({required this.productRepository});

  @override
  Future<List<MovieEntity>> call(Params params) {
    return productRepository.getTrendingMovies(
      page: params.page,
      limit: params.limit,
    );
  }
}

class Params {
  final int limit;
  final int page;

  Params(this.limit, this.page);
}
