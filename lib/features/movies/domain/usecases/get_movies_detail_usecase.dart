import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/usecases/usecase.dart';
import '../entities/movie_detail_entity.dart';
import '../repositories/movies_repository.dart';

@Injectable()
class GetMoviesDetailUseCase implements UseCase<MovieDetailEntity, Params> {
  final MoviesRepository? moviesRepository;

  GetMoviesDetailUseCase({required this.moviesRepository});

  @override
  Future<MovieDetailEntity> call(Params params) {
    return moviesRepository!.getMovie(id: params.id!);
  }
}

class Params extends Equatable {
  final int? id;

  const Params({required this.id});

  @override
  List<Object?> get props => [id];
}
