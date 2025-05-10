import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utils/enums.dart';
import 'package:movies_app/movies/domain/usecases/get_now_playing_movies.dart';
import 'package:movies_app/movies/domain/usecases/get_popular_movies.dart';
import 'package:movies_app/movies/domain/usecases/get_top_rated_movies.dart';
import 'package:movies_app/movies/presentation/controllers/movie_event.dart';
import 'package:movies_app/movies/presentation/controllers/movie_state.dart';

class MoviesBloc extends Bloc<MovieEvent, MovieState> {
  final GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase;

  final GetPopularMoviesUseCase getPopularMoviesUseCase;

  final GetTopRatedMoviesUseCase getTopRatedMoviesUseCase;

  MoviesBloc(
    this.getNowPlayingMoviesUseCase,
    this.getPopularMoviesUseCase,
    this.getTopRatedMoviesUseCase,
  ) : super(const MovieState()) {
    on<GetNowPlayingMoviesEvent>(_getNowPlayingMovies);

    on<GetPopularMoviesEvent>(_getPopularMovies);

    on<GetTopRatedMoviesEvent>(_getTopRatedMovies);
  }



  FutureOr<void> _getTopRatedMovies(GetTopRatedMoviesEvent event, Emitter<MovieState> emit)async {
    final topRated = await getTopRatedMoviesUseCase();
    topRated.fold(
          (error) => emit(
        state.copyWith(
          topRatedMessage: error.message,
          topRatedState: RequestState.error,
        ),
      ),
          (data) => emit(
        state.copyWith(
          topRatedState: RequestState.loaded,
          topRatedMovies: data,
        ),
      ),
    );
  }

  FutureOr<void> _getNowPlayingMovies(GetNowPlayingMoviesEvent event, Emitter<MovieState> emit) async{
    // get data of nowPlayingMovies
    final nowPlaying = await getNowPlayingMoviesUseCase();
    nowPlaying.fold(
          (error) => emit(
        state.copyWith(
          nowPlayingMessage: error.message,
          nowPlayingState: RequestState.error,
        ),
      ),
          (data) {
        return emit(
          state.copyWith(
            nowPlayingMovies: data,
            nowPlayingState: RequestState.loaded,
          ),
        );
      },
    );
  }

  FutureOr<void> _getPopularMovies(GetPopularMoviesEvent event, Emitter<MovieState> emit) async{
    final popular = await getPopularMoviesUseCase();
    popular.fold(
          (error) => emit(
        state.copyWith(
          popularMessage: error.message,
          popularState: RequestState.error,
        ),
      ),
          (data) => emit(
        state.copyWith(
          popularState: RequestState.loaded,
          popularMovies: data,
        ),
      ),
    );
  }
}
