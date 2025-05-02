
import 'package:get_it/get_it.dart';
import 'package:movies_app/movies/data/datasource/movie_remote_data_source.dart';
import 'package:movies_app/movies/data/repository/movies_repository.dart';
import 'package:movies_app/movies/domain/repository/base_movies_repository.dart';
import 'package:movies_app/movies/domain/usecases/get_now_playing_movies.dart';

final sl = GetIt.instance ;

class ServicesLocator {

  void onInit(){

    /// DataSources
    sl.registerLazySingleton<BaseMovieRemoteDataSource>(() => MovieRemoteDataSource(),); 
    /// Repository
    sl.registerLazySingleton<BaseMoviesRepository>(() => MoviesRepository(sl()),); 
    /// NowPlaying UseCases
    sl.registerLazySingleton(() => GetNowPlayingMoviesUseCase(sl()),);
  }
}