import 'package:equatable/equatable.dart';

abstract class MovieEvent extends Equatable {
const MovieEvent();

@override
  List<Object> get props => [];
}

class getNowPlayingMoviesEvent extends MovieEvent {}

class getPopularMoviesEvent extends MovieEvent {}

class getTopRatedMoviesEvent extends MovieEvent {}