
import 'package:movies_app/domain/repos/movies_genres_repo.dart';

import '../model/movie_genre.dart';

class MovieGenreUseCase{
  final MoviesGenresRepo _moviesGenresRepo;
  MovieGenreUseCase(this._moviesGenresRepo);

Future<List<MovieGenre>> invoke(){
  return _moviesGenresRepo.getMoviesGenres();
}

}