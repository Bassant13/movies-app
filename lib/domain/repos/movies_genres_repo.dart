import 'package:movies_app/domain/model/movie_genre.dart';

abstract class MoviesGenresRepo{
  Future<List<MovieGenre>> getMoviesGenres();

}