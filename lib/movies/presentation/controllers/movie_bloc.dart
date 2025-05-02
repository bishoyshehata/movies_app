import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utils/enums.dart';
import 'package:movies_app/movies/domain/usecases/get_now_playing_movies.dart';
import 'package:movies_app/movies/presentation/controllers/movie_event.dart';
import 'package:movies_app/movies/presentation/controllers/movie_state.dart';

class MoviesBloc extends Bloc<MovieEvent,MovieState> {
  final GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase ;
  MoviesBloc(this.getNowPlayingMoviesUseCase) : super(const MovieState()){
    on<GetNowPlayingMoviesEvent>((event, emit) async{

      // get data of nowPlayingMovies
      final result = await getNowPlayingMoviesUseCase.execute();
      emit(const MovieState(requestState: RequestState.loaded));
      result.fold((error)=> emit( MovieState(nowPlayingMessage: error.message , requestState: RequestState.error)), (data){
        return emit(MovieState(nowPlayingMovies: data , requestState: RequestState.loaded));
      });
    },);

  }


}