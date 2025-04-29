import '../../domain/entities/Movie.dart';

class MovieModel extends Movie {
  MovieModel({
    required super.id,
    required super.backdropPath,
    required super.genreIds,
    required super.title,
    required super.overview,
    required super.posterPath,
    required super.voteAverage,
    required super.releaseDate,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
        id: json['id'],
        backdropPath: json['backdrop_path'],
        genreIds: List<int>.from(json['genre_ids'].map((e)=>e)),
        title: json['title'],
        overview: json['overview'],
        posterPath: json['poster_path'],
        voteAverage: json['vote_average'],
      releaseDate: json['release_date'],
    );
  }
}
