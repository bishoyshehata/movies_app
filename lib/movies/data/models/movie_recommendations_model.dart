import 'package:movies_app/movies/domain/entities/recommendation.dart';

class MovieRecommendationsModel extends Recommendations {
  const MovieRecommendationsModel({ super.backdropPath, required super.id});

  factory MovieRecommendationsModel.fromJson(Map<String, dynamic> json) =>
      MovieRecommendationsModel(
        backdropPath:json["backdrop_path"] ?? '/ta17TltHGdZ5PZz6oUD3N5BRurb.jpg',
        id: json['id'],
      );
}
