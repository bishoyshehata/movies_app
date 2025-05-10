
import 'package:dartz/dartz.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/movies/domain/entities/Movie.dart';
import 'package:movies_app/movies/domain/repository/base_movies_repository.dart';

import '../../../core/base_usecase/base_usecase.dart';

class GetPopularMoviesUseCase extends BaseUseCase<List<Movie>> {
  final BaseMoviesRepository moviesRepository ;

  GetPopularMoviesUseCase(this.moviesRepository);

  @override
  Future<Either<Failure , List<Movie>>>  call() async {
    return await moviesRepository.getPopularMovies();
  }

}

