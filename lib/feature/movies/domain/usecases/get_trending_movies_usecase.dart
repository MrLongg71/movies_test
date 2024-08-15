import 'package:injectable/injectable.dart';

import '../../../../core/usecases/usecase.dart';
import '../entities/movies_entity.dart';
import '../repositories/movies_repository.dart';

@injectable
class GetTrendingMoviesUseCase implements UseCase<List<MoviesEntity>, Params> {
  final MoviesRepository productRepository;

  GetTrendingMoviesUseCase({required this.productRepository});

  @override
  Future<List<MoviesEntity>> call(Params params) {
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
