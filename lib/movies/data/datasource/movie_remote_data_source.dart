import 'package:dio/dio.dart';
import 'package:movies_app/core/error/exceptions.dart';
import 'package:movies_app/core/network/error_message_model.dart';
import 'package:movies_app/core/utils/app_constants.dart';
import 'package:movies_app/movies/data/models/movie_model.dart';

abstract class BaseMovieRemoteDataSource {

  Future<List<MovieModel>> getNowPlayingMovies();
  Future<List<MovieModel>> getPopularMovies();
  Future<List<MovieModel>> getTopRatedMovies();

}


class MovieRemoteDataSource extends BaseMovieRemoteDataSource {

  // getNowPlayingMovies
  @override
  Future<List<MovieModel>> getNowPlayingMovies()async {

    final response = await Dio().get(AppConstants.nowPlayingMoviePath);

    if(response.statusCode == 200){
      return List<MovieModel>.from((response.data['results'] as List).map((e)=> MovieModel.fromJson(e)));
    }
    throw ServerException(errorMessageModel: ErrorMessageModel.fromjson(response.data));
  }
  // getPopularMovies
  @override
  Future<List<MovieModel>> getPopularMovies()async {

    final response = await Dio().get(AppConstants.popularMoviePath);

    if(response.statusCode == 200){
      return List<MovieModel>.from((response.data['results'] as List).map((e)=> MovieModel.fromJson(e)));
    }
    throw ServerException(errorMessageModel: ErrorMessageModel.fromjson(response.data));

  }
// getTopRatedMovies
  @override
  Future<List<MovieModel>> getTopRatedMovies()async {

    final response = await Dio().get(AppConstants.topRatedMoviePath);

    if(response.statusCode == 200){
      return List<MovieModel>.from((response.data['results'] as List).map((e)=> MovieModel.fromJson(e)));
    }
    throw ServerException(errorMessageModel: ErrorMessageModel.fromjson(response.data));

  }
}