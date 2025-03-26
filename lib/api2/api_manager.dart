import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../data2/model/genre_response/GenreResponse.dart';
// import '../data2/model/movies_response/MoviesResponse.dart';

class ApiManager{
   final _dio = Dio(
    BaseOptions(
      baseUrl:  "https://api.themoviedb.org",
      connectTimeout: Duration(seconds: 120),

    )
  );
  ApiManager._(){
    _dio.interceptors.add(
     PrettyDioLogger(
       requestHeader: true,
       requestBody: true,
       responseBody: true,
       responseHeader: false,
       error: true,
       compact: true,
       maxWidth: 90,
       enabled: true,
     )
    );
  }
  static ApiManager? _apiManager;
  static ApiManager getInstance(){
    return _apiManager ??= ApiManager._();
  }
  Future<GenreResponse?> getMovieGenre() async{
    var response = await _dio.get(
      "/3/genre/movie/list",
      queryParameters: {
        "apiKey":"029169251629658186c292459fed273d",
        "language":"en"

      }
    );
    var genreResponse = GenreResponse.fromJson(response.data);
    return genreResponse;
  }
//    Future<MoviesResponse?> getMovies(num? genreId) async{
//      var response = await _dio.get(
//          "/3/discover/movie",
//          queryParameters: {
//            "apiKey":"86054f2c845a86ddfcb8a037a38bae21",
//            "genres": genreId
//          }
//      );
//      var moviesResponse = MoviesResponse.fromJson(response.data);
//      return moviesResponse;
//    }
}