import 'package:dio/dio.dart';
import 'package:movies_app/core/utils/app_constants.dart';
import 'package:movies_app/movies/data/models/movie_model.dart';

class MovieRemoteDataSource {

  // getNowPlayingMovies
  Future<List<MovieModel>> getNowPlayingMovies()async {

    final response = await Dio().get('${AppConstants.baseUrl}movie/now_playing?api_key=${AppConstants.apiKey}');

    if(response.statusCode == 200){
      return List<MovieModel>.from((response.data['results'] as List).map((e)=> MovieModel.fromJson(e)));
    }
    return [];

  }
  // getPopularMovies
  Future<List<MovieModel>> getPopularMovies()async {

    final response = await Dio().get('${AppConstants.baseUrl}movie/popular?api_key=${AppConstants.apiKey}');

    if(response.statusCode == 200){
      return List<MovieModel>.from((response.data['results'] as List).map((e)=> MovieModel.fromJson(e)));
    }
    return [];

  }
// getTopRatedMovies
  Future<List<MovieModel>> getTopRatedMovies()async {

    final response = await Dio().get('${AppConstants.baseUrl}movie/top_rated?api_key=${AppConstants.apiKey}');

    if(response.statusCode == 200){
      return List<MovieModel>.from((response.data['results'] as List).map((e)=> MovieModel.fromJson(e)));
    }
    return [];

  }
}