import 'package:http/http.dart' as http;
import 'dart:convert';
import 'search/movie_model.dart';

class ApiService {
  static Future<List<Movie>> fetchMovies() async {
    try {
      final response = await http.get(Uri.parse('https://limitlessorganization.org/api/movie.php'));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        if (data is Map<String, dynamic> && data.containsKey("movies")) {
          List<dynamic> moviesList = data["movies"];
          return moviesList.map((json) => Movie.fromJson(json)).toList();
        }
      }
      return [];
    } catch (e) {
      print("Error : $e");
      return [];
    }
  }
}
