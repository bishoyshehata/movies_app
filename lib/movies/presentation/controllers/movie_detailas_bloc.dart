import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utils/enums.dart';
import 'package:movies_app/movies/domain/usecases/get_movie_details.dart';
import 'package:movies_app/movies/domain/usecases/get_recommendation.dart';
import 'package:movies_app/movies/presentation/controllers/movie_detailas_event.dart';
import 'package:movies_app/movies/presentation/controllers/movie_detailas_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  final GetMovieDetailsUseCase getMovieDetailsUseCase;
  final GetRecommendationsUseCase getRecommendationsUseCase;

  MovieDetailsBloc(
      this.getMovieDetailsUseCase,
      this.getRecommendationsUseCase,
      ) : super(const MovieDetailsState()) {

    on<GetMovieDetailsEvent>(_getMoviesDetails);
    on<GetRecommendationMoviesEvent>(_getRecommendationMovies);
  }

  FutureOr<void> _getMoviesDetails(GetMovieDetailsEvent event, Emitter<MovieDetailsState> emit)async {

    final moviesDetails = await getMovieDetailsUseCase(MovieDetailsParameters(movieId: event.id));
    moviesDetails.fold(
          (error) => emit(
        state.copyWith(
          movieDetailsError: error.message,
          movieDetailsState: RequestState.error,
        ),
      ),
          (data) => emit(
        state.copyWith(
          movieDetailsState: RequestState.loaded,
          movieDetails: data,
        ),
      ),
    );
  }
  FutureOr<void> _getRecommendationMovies(GetRecommendationMoviesEvent event, Emitter<MovieDetailsState> emit) async{

    final recommendationMovies = await getRecommendationsUseCase(MovieDetailsParameters(movieId: event.id));
    recommendationMovies.fold(
          (error) => emit(
        state.copyWith(
          recommendedMoviesError: error.message,
          recommendedMoviesState: RequestState.error,
        ),
      ),
          (data) {
        return emit(
          state.copyWith(
            recommendedMovies: data,
            recommendedMoviesState: RequestState.loaded,
          ),
        );
      },
    );
  }

}
