import 'package:equatable/equatable.dart';

abstract class MovieDetailsEvent extends Equatable {
  const MovieDetailsEvent();

  @override
  List<Object> get props => [];
}

class GetMovieDetailsEvent extends MovieDetailsEvent {
  final int id ;
  const GetMovieDetailsEvent(this.id);
  @override
  List<Object> get props => [id];
}

class GetRecommendationMoviesEvent extends MovieDetailsEvent {
  final int id ;
  const GetRecommendationMoviesEvent(this.id);
  @override
  List<Object> get props => [id];
}

