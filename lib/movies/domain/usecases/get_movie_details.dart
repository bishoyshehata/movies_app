import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/core/base_usecase/base_usecase.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/movies/domain/entities/movie_details.dart';

import '../repository/base_movies_repository.dart';

class GetMovieDetailsUseCase extends BaseUseCase<MovieDetails,MovieDetailsParameters>{
  final BaseMoviesRepository moviesRepository ;

   GetMovieDetailsUseCase(this.moviesRepository);
  @override
  Future<Either<Failure, MovieDetails>> call(MovieDetailsParameters parameter) async{
    return await moviesRepository.getMoviesDetails(parameter);
  }

}

class MovieDetailsParameters extends Equatable {
  final int movieId ;
 const MovieDetailsParameters({required this.movieId});
  @override
  List<Object?> get props => [movieId];
  }