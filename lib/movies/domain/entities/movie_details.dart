import 'package:equatable/equatable.dart';
import 'package:movies_app/movies/domain/entities/geners.dart';

abstract class MovieDetails extends Equatable {
  final String backdropPath;
  final List<Genres> genres;
  final String id;
  final String overview;
  final String runtime;
  final String voteAverage;
  final String title;
  final String releaseDate;

  const MovieDetails({
    required this.backdropPath,
    required this.genres,
    required this.id,
    required this.overview,
    required this.runtime,
    required this.voteAverage,
    required this.title,
    required this.releaseDate,
  });

  @override
  List<Object> get props =>[backdropPath,genres,id,override,runtime,voteAverage,title,releaseDate];
}
