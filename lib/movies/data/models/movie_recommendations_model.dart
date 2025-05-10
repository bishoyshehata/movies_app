import 'package:movies_app/movies/domain/entities/recommendation.dart';

class MovieRecommendationsModel extends Recommendations {
  MovieRecommendationsModel({required super.backdropPath, required super.id});

  factory MovieRecommendationsModel.fromjson(Map<String, dynamic> json) =>
      MovieRecommendationsModel(
        backdropPath: json['backdropPath'],
        id: json['id'],
      );
}
