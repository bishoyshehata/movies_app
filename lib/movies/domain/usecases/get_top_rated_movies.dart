
import 'package:dartz/dartz.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/movies/domain/entities/Movie.dart';
import 'package:movies_app/movies/domain/repository/base_movies_repository.dart';

class GetTopRatedMoviesUseCase {
  final BaseMoviesRepository moviesRepository ;

  GetTopRatedMoviesUseCase(this.moviesRepository);

  Future<Either<Failure , List<Movie>>>  execute() async {
    return await moviesRepository.getTopRatedMovies();
  }

}

