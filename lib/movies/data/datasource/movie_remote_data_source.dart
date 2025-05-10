import 'package:dio/dio.dart';
import 'package:movies_app/core/error/exceptions.dart';
import 'package:movies_app/core/network/error_message_model.dart';
import 'package:movies_app/movies/data/models/movie_details_model.dart';
import 'package:movies_app/movies/data/models/movie_model.dart';
import 'package:movies_app/movies/data/models/movie_recommendations_model.dart';
import 'package:movies_app/movies/domain/usecases/get_movie_details.dart';

import '../../../core/network/api_constants.dart';

abstract class BaseMovieRemoteDataSource {

  Future<List<MovieModel>> getNowPlayingMovies();
  Future<List<MovieModel>> getPopularMovies();
  Future<List<MovieModel>> getTopRatedMovies();
  Future<MovieDetailsModel> getMoviesDetails(MovieDetailsParameters parameters);
  Future<MovieRecommendationsModel> getMovieRecommendation(MovieDetailsParameters parameters);

}


class MovieRemoteDataSource extends BaseMovieRemoteDataSource {

  // getNowPlayingMovies
  @override
  Future<List<MovieModel>> getNowPlayingMovies()async {

    final response = await Dio().get(ApiConstants.nowPlayingMoviePath);

    if(response.statusCode == 200){
      return List<MovieModel>.from((response.data['results'] as List).map((e)=> MovieModel.fromJson(e)));
    }
    throw ServerException(errorMessageModel: ErrorMessageModel.fromjson(response.data));
  }
  // getPopularMovies
  @override
  Future<List<MovieModel>> getPopularMovies()async {

    final response = await Dio().get(ApiConstants.popularMoviePath);

    if(response.statusCode == 200){
      return List<MovieModel>.from((response.data['results'] as List).map((e)=> MovieModel.fromJson(e)));
    }
    throw ServerException(errorMessageModel: ErrorMessageModel.fromjson(response.data));

  }
// getTopRatedMovies
  @override
  Future<List<MovieModel>> getTopRatedMovies()async {

    final response = await Dio().get(ApiConstants.topRatedMoviePath);

    if(response.statusCode == 200){
      return List<MovieModel>.from((response.data['results'] as List).map((e)=> MovieModel.fromJson(e)));
    }
    throw ServerException(errorMessageModel: ErrorMessageModel.fromjson(response.data));

  }


// MovieRecommendations

  @override
  Future<MovieRecommendationsModel> getMovieRecommendation(MovieDetailsParameters parameters)async {
    final response = await Dio().get(ApiConstants.movieRecommendationPath(parameters.movieId));

    if(response.statusCode == 200){
      return MovieRecommendationsModel.fromjson(response.data);
    }
    throw ServerException(errorMessageModel: ErrorMessageModel.fromjson(response.data));

  }
// getMovieDetails

  @override
  Future<MovieDetailsModel> getMoviesDetails(MovieDetailsParameters parameters) async{
    final response = await Dio().get(ApiConstants.movieDetailsPath(parameters.movieId));

    if(response.statusCode == 200){
      return MovieDetailsModel.fromjson(response.data);
    }
    throw ServerException(errorMessageModel: ErrorMessageModel.fromjson(response.data));

  }
}


