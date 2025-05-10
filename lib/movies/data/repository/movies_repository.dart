import 'package:dartz/dartz.dart';
import 'package:movies_app/core/error/exceptions.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/movies/data/datasource/movie_remote_data_source.dart';
import 'package:movies_app/movies/data/models/movie_details_model.dart';
import 'package:movies_app/movies/data/models/movie_model.dart';
import 'package:movies_app/movies/data/models/movie_recommendations_model.dart';
import 'package:movies_app/movies/domain/entities/movie_details.dart';
import 'package:movies_app/movies/domain/entities/recommendation.dart';
import 'package:movies_app/movies/domain/repository/base_movies_repository.dart';
import 'package:movies_app/movies/domain/usecases/get_movie_details.dart';

class MoviesRepository implements BaseMoviesRepository {

  final BaseMovieRemoteDataSource movieRemoteDataSource ;
  const MoviesRepository(this.movieRemoteDataSource);

  @override
  Future<Either<Failure , List<MovieModel>>> getNowPlayingMovies() async{
    final result = await movieRemoteDataSource.getNowPlayingMovies();
    try {
      return Right(result);
    }on ServerException catch (failur){
      return Left(ServerFailure(failur.errorMessageModel.statusMessage));
    }
  }


  @override
  Future<Either<Failure , List<MovieModel>>> getPopularMovies() async{
    final result = await movieRemoteDataSource.getPopularMovies();
    try {
      return Right(result);
    }on ServerException catch (failur){
      return Left(ServerFailure(failur.errorMessageModel.statusMessage));
    }
  }


  @override
  Future<Either<Failure , List<MovieModel>>> getTopRatedMovies() async{
    final result = await movieRemoteDataSource.getTopRatedMovies();
    try {
      return Right(result);
    }on ServerException catch (failur){
      return Left(ServerFailure(failur.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, MovieDetails>> getMoviesDetails(MovieDetailsParameters parameters) async{
    final result = await movieRemoteDataSource.getMoviesDetails(parameters);
    try {
      return Right(result);
    }on ServerException catch (failur){
      return Left(ServerFailure(failur.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Recommendations>>> getMovieRecommendation(MovieDetailsParameters parameters)async {
    final result = await movieRemoteDataSource.getMovieRecommendation(parameters);
    try {
      return Right(result);
    }on ServerException catch (failur){
      return Left(ServerFailure(failur.errorMessageModel.statusMessage));
    }

  }
  }
