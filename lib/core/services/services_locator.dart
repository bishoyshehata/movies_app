import 'package:get_it/get_it.dart';
import 'package:movies_app/movies/data/datasource/movie_remote_data_source.dart';
import 'package:movies_app/movies/data/repository/movies_repository.dart';
import 'package:movies_app/movies/domain/repository/base_movies_repository.dart';
import 'package:movies_app/movies/domain/usecases/get_movie_details.dart';
import 'package:movies_app/movies/domain/usecases/get_now_playing_movies.dart';
import 'package:movies_app/movies/domain/usecases/get_popular_movies.dart';
import 'package:movies_app/movies/domain/usecases/get_recommendation.dart';
import 'package:movies_app/movies/domain/usecases/get_top_rated_movies.dart';
import 'package:movies_app/movies/presentation/controllers/movie_bloc.dart';
import 'package:movies_app/movies/presentation/controllers/movie_detailas_bloc.dart';

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
    /// MoviesDetailedBloc
    sl.registerLazySingleton<MovieDetailsBloc>(
      () => MovieDetailsBloc(
        sl<GetMovieDetailsUseCase>(),
        sl<GetRecommendationsUseCase>(),
      ),
    );

    /// DataSources
    sl.registerLazySingleton<BaseMovieRemoteDataSource>(
      () => MovieRemoteDataSource(),
    );

    /// MoviesRepository
    sl.registerLazySingleton<BaseMoviesRepository>(
      () => MoviesRepository(sl()),
    );

    /// movieDetails UseCases
    sl.registerLazySingleton(() => GetMovieDetailsUseCase(sl()));

    /// RecommendationsMovieDetails UseCases
    sl.registerLazySingleton(() => GetRecommendationsUseCase(sl()));


    /// NowPlaying UseCases
    sl.registerLazySingleton(() => GetNowPlayingMoviesUseCase(sl()));

    /// Popular UseCases
    sl.registerLazySingleton(() => GetPopularMoviesUseCase(sl()));

    /// TopRated UseCases
    sl.registerLazySingleton(() => GetTopRatedMoviesUseCase(sl()));
  }
}
