
import '../../domain/model/movie_genre.dart';

abstract class MoviesGenresOnlineDataSource{
  Future<List<MovieGenre>>  getMoviesGenres();
}