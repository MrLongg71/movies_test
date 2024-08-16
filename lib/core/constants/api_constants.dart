class ApiConstants {

  static const int limitRequest = 20;
  static const String version = '3';
  static const String getTrendingMoviesOfDay = '$version/trending/movie/day';
  static const String getMovies = '$version/movie';
  static const String searchMovies = '$version/search/movie';

  //base endpoint image url
  static const String basePosterUrl = 'https://image.tmdb.org/t/p/w500';
  static const String baseBackdropUrl = 'https://image.tmdb.org/t/p/w1280';
}
