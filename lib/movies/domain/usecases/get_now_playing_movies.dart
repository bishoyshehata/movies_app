
import 'package:movies_app/movies/domain/entities/Movie.dart';
import 'package:movies_app/movies/domain/repository/base_movies_repository.dart';

class GetNowPlayingMoviesUseCase {
  final BaseMoviesRepository moviesRepository ;

  GetNowPlayingMoviesUseCase(this.moviesRepository);

  Future<List<Movie>> execute() async {
    return await moviesRepository.getNowPlaying();
  }

}

