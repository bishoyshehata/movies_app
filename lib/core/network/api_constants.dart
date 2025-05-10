class ApiConstants {
  static const baseUrl = 'https://api.themoviedb.org/3';
  static const apiKey = 'ef65df26ebe4de8454fa7b7fd867c421';

  //home
  static const nowPlayingMoviePath= "$baseUrl/movie/popular?api_key=$apiKey";
  static const popularMoviePath= '$baseUrl/movie/popular?api_key=$apiKey';
  static const topRatedMoviePath= "$baseUrl/movie/top_rated?api_key=$apiKey";
  // movie details
  static  movieDetailsPath(int movieId)=> "$baseUrl/movie/$movieId?api_key=$apiKey";
  static  movieRecommendationPath(int movieId)=> "$baseUrl/movie/$movieId/recommendations?api_key=$apiKey";

  static const baseImageUrl= "https://image.tmdb.org/t/p/w500";
  static String imageUrl(String path) => "$baseImageUrl$path";

}