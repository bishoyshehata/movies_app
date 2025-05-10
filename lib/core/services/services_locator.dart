import 'package:get_it/get_it.dart';
import 'package:movies_app/movies/data/datasource/movie_remote_data_source.dart';
import 'package:movies_app/movies/data/repository/movies_repository.dart';
import 'package:movies_app/movies/domain/repository/base_movies_repository.dart';
import 'package:movies_app/movies/domain/usecases/get_now_playing_movies.dart';
import 'package:movies_app/movies/domain/usecases/get_popular_movies.dart';
import 'package:movies_app/movies/domain/usecases/get_top_rated_movies.dart';
import 'package:movies_app/movies/presentation/controllers/movie_bloc.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void onInit() {
    /// MoviesBloc
    sl.registerLazySingleton<MoviesBloc>(
      () => MoviesBloc(
        sl<GetNowPlayingMoviesUseCase>(),
        sl<GetPopularMoviesUseCase>(),
        sl<GetTopRatedMoviesUseCase>(),
      ),
    );

    /// DataSources
    sl.registerLazySingleton<BaseMovieRemoteDataSource>(
      () => MovieRemoteDataSource(),
    );

    /// Repository
    sl.registerLazySingleton<BaseMoviesRepository>(
      () => MoviesRepository(sl()),
    );

    /// NowPlaying UseCases
    sl.registerLazySingleton(() => GetNowPlayingMoviesUseCase(sl()));

    /// Popular UseCases
    sl.registerLazySingleton(() => GetPopularMoviesUseCase(sl()));

    /// TopRated UseCases
    sl.registerLazySingleton(() => GetTopRatedMoviesUseCase(sl()));
  }
}
