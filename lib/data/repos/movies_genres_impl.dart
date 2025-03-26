import '../../domain/model/movie_genre.dart';
import '../../domain/repos/movies_genres_repo.dart';
import '../data_source/movies_genres_online_data_source.dart';

class MoviesGenresImpl implements MoviesGenresRepo{
 MoviesGenresOnlineDataSource _moviesGenresOnlineDataSource;
  MoviesGenresImpl(this._moviesGenresOnlineDataSource);

  @override
  Future<List<MovieGenre>> getMoviesGenres() {
   return _moviesGenresOnlineDataSource.getMoviesGenres();
  }

}