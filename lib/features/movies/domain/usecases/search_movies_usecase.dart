import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/usecases/usecase.dart';
import '../../../movies/domain/entities/movie_entity.dart';
import '../repositories/movies_repository.dart';

@Injectable()
class SearchMoviesUseCase implements UseCase<List<MovieEntity>, SearchParams> {
  final MoviesRepository? moviesRepository;

  SearchMoviesUseCase({required this.moviesRepository});

  @override
  Future<List<MovieEntity>> call(SearchParams params) {
    return moviesRepository!.search(query: params.query);
  }
}

class SearchParams extends Equatable {
  final String? query;

  const SearchParams({required this.query});

  @override
  List<Object?> get props => [query];
}
