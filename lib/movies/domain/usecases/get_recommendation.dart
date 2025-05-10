import 'package:dartz/dartz.dart';
import 'package:movies_app/movies/domain/entities/recommendation.dart';
import 'package:movies_app/movies/domain/usecases/get_movie_details.dart';

import '../../../core/base_usecase/base_usecase.dart';
import '../../../core/error/failure.dart';
import '../repository/base_movies_repository.dart';

class GetRecommendationsUseCase extends BaseUseCase<Recommendations,MovieDetailsParameters>{
  final BaseMoviesRepository moviesRepository ;

  GetRecommendationsUseCase(this.moviesRepository);
  @override
  Future<Either<Failure, Recommendations>> call(MovieDetailsParameters parameters) async{
    return await moviesRepository.getMovieRecommendation(parameters);
  }

}