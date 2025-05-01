import 'package:dartz/dartz.dart';
import 'package:movies_app/core/error/failure.dart';

import '../entities/Movie.dart';

abstract class BaseMoviesRepository {

  Future<Either<Failure , List<Movie>>> getNowPlayingMovies();
  Future<Either<Failure , List<Movie>>>  getPopularMovies();
  Future<Either<Failure , List<Movie>>>  getTopRatedMovies();
}

