import 'package:equatable/equatable.dart';
import 'package:movies_app/movies/domain/entities/Movie.dart';

import '../../../core/utils/enums.dart';

class MovieState extends Equatable {

  final List<Movie> nowPlayingMovies;
  final List<Movie> popularMovies;
  final List<Movie> topRatedMovies;
  final RequestState nowPlayingState;
  final RequestState popularState;
  final RequestState topRatedState;
  final String nowPlayingMessage;
  final String popularMessage;
  final String topRatedMessage;

  const MovieState({
    this.nowPlayingMovies = const [],
    this.popularMovies = const [],
    this.topRatedMovies = const [],
    this.nowPlayingState = RequestState.loading,
    this.popularState = RequestState.loading,
    this.topRatedState = RequestState.loading,
    this.nowPlayingMessage = '',
    this.popularMessage = '',
    this.topRatedMessage = '',
  });

  MovieState copyWith({
     List<Movie>? nowPlayingMovies,
     List<Movie>? popularMovies,
     List<Movie>? topRatedMovies,
     RequestState? nowPlayingState,
     RequestState? popularState,
     RequestState? topRatedState,
     String? nowPlayingMessage,
     String? popularMessage,
     String? topRatedMessage,

}){

    return MovieState(
      nowPlayingMovies: nowPlayingMovies ?? this.nowPlayingMovies ,
      popularMovies: popularMovies ?? this.popularMovies ,
      topRatedMovies: topRatedMovies ?? this.topRatedMovies ,
      nowPlayingState: nowPlayingState ?? this.nowPlayingState ,
      popularState: popularState ?? this.popularState ,
      topRatedState: topRatedState ?? this.topRatedState ,
      nowPlayingMessage: nowPlayingMessage ?? this.nowPlayingMessage ,
      popularMessage: popularMessage ?? this.popularMessage ,
      topRatedMessage: topRatedMessage ?? this.topRatedMessage ,

    );
}

  @override
  List<Object?> get props => [nowPlayingMovies, nowPlayingState ,popularState,topRatedState , nowPlayingMessage , popularMovies , topRatedMovies , popularMessage , topRatedMessage];

}