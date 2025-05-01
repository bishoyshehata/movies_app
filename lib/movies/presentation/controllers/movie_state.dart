import 'package:equatable/equatable.dart';
import 'package:movies_app/movies/domain/entities/Movie.dart';

import '../../../core/utils/enums.dart';

class MovieState extends Equatable {

  final List<Movie> nowPlayingMovies;
  final RequestState requestState;
  final String nowPlayingMessage;

  const MovieState({
    this.nowPlayingMovies = const [],
    this.requestState = RequestState.loading,
    this.nowPlayingMessage = '',
  });


  @override
  List<Object?> get props => [nowPlayingMovies, requestState, nowPlayingMessage];

}