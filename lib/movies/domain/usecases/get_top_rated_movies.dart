
import 'package:dartz/dartz.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/movies/domain/entities/Movie.dart';
import 'package:movies_app/movies/domain/repository/base_movies_repository.dart';

import '../../../core/base_usecase/base_usecase.dart';

class GetTopRatedMoviesUseCase extends BaseUseCase<List<Movie>,NoParameter>{
  final BaseMoviesRepository moviesRepository ;

  GetTopRatedMoviesUseCase(this.moviesRepository);
  @override
  Future<Either<Failure , List<Movie>>>  call(NoParameter parameter) async {
    return await moviesRepository.getTopRatedMovies();
  }

}

