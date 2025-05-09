import 'package:dartz/dartz.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/movies/domain/entities/movie_details.dart';
import 'package:movies_app/movies/domain/entities/recommendation.dart';
import 'package:movies_app/movies/domain/usecases/get_movie_details.dart';

import '../entities/Movie.dart';

abstract class BaseMoviesRepository {

  Future<Either<Failure , List<Movie>>> getNowPlayingMovies();
  Future<Either<Failure , List<Movie>>>  getPopularMovies();
  Future<Either<Failure , List<Movie>>>  getTopRatedMovies();


  Future<Either<Failure , MovieDetails>>  getMoviesDetails(MovieDetailsParameters parameters);
  Future<Either<Failure ,List<Recommendations>>>  getMovieRecommendation(MovieDetailsParameters parameters);

}

