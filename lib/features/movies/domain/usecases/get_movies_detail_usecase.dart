import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import '../../../movies/domain/entities/movies_entity.dart';

import '../../../../core/usecases/usecase.dart';
import '../repositories/movies_repository.dart';

@Injectable()
class GetMoviesDetailUseCase implements UseCase<MoviesEntity, Params> {
  final MoviesRepository? moviesRepository;

  GetMoviesDetailUseCase({required this.moviesRepository});

  @override
  Future<MoviesEntity> call(Params params) {
    return moviesRepository!.getMovies(id: params.id!);
  }
}

class Params extends Equatable {
  final int? id;

  const Params({required this.id});

  @override
  List<Object?> get props => [id];
}
