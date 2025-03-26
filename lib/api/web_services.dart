
import 'package:movies_app/domain/model/movie_genre.dart';
import 'package:retrofit/retrofit.dart';

abstract class WebServices{
  @GET("/api.themoviedb.org/3/genre/movie/list")
  
  Future<List<MovieGenre>> getMoviesGenres();
}