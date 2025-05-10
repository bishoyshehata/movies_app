import 'package:equatable/equatable.dart';
import 'package:movies_app/movies/domain/entities/movie_details.dart';
import 'package:movies_app/movies/domain/entities/recommendation.dart';
import '../../../core/utils/enums.dart';

class MovieDetailsState extends Equatable {

  final MovieDetails? movieDetails;
  final List<Recommendations> recommendedMovies;
  final RequestState movieDetailsState;
  final RequestState recommendedMoviesState;
  final String movieDetailsError;
  final String recommendedMoviesError;



  const MovieDetailsState(
  {
    this.movieDetails,
    this.recommendedMovies = const[],
    this.movieDetailsState = RequestState.loading,
    this.recommendedMoviesState = RequestState.loading,
    this.movieDetailsError = '',
    this.recommendedMoviesError = '',
  });

  MovieDetailsState copyWith({
     MovieDetails? movieDetails,
    List<Recommendations>? recommendedMovies,
     RequestState? movieDetailsState,
     RequestState? recommendedMoviesState,
     String? movieDetailsError,
     String? recommendedMoviesError,

  }){

    return MovieDetailsState(

      movieDetails: movieDetails ?? this.movieDetails ,
      recommendedMovies: recommendedMovies ?? this.recommendedMovies ,
      movieDetailsState: movieDetailsState ?? this.movieDetailsState ,
      recommendedMoviesState: recommendedMoviesState ?? this.recommendedMoviesState ,
      movieDetailsError: movieDetailsError ?? this.movieDetailsError ,
      recommendedMoviesError: recommendedMoviesError ?? this.recommendedMoviesError ,


    );
  }

  @override
  List<Object?> get props => [MovieDetails,Recommendations,movieDetailsState,recommendedMoviesState,movieDetailsError,recommendedMoviesError];

}