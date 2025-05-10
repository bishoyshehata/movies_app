import 'package:movies_app/movies/data/models/genres_model.dart';

import '../../domain/entities/movie_details.dart';

class MovieDetailsModel extends MovieDetails {
  const MovieDetailsModel({
    required super.backdropPath,
    required super.genres,
    required super.id,
    required super.overview,
    required super.runtime,
    required super.voteAverage,
    required super.title,
    required super.releaseDate,
  });

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) =>
      MovieDetailsModel(
        backdropPath: json['backdrop_path'],
        genres: List<GenresModel>.from(json['genres'].map((x)=>GenresModel.fromJson(x))),
        id: json['id'],
        overview: json['overview'],
        runtime: json['runtime'],
        voteAverage: json['vote_average'].toDouble(),
        title: json['title'],
        releaseDate: json['release_date'],
      );
}
