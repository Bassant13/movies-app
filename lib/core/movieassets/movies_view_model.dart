import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'movie_model.dart';

class MoviesViewModel extends ChangeNotifier {
  List<Movie> movies = [];
  List<String> categories = [];
  String selectedCategory = "All";
  int currentIndex = 0;
  bool isLoading = false;

  MoviesViewModel() {
    fetchCategories();
  }

  Future<void> fetchCategories() async {
    isLoading = true;
    notifyListeners();

    try {
      final response = await http.get(Uri.parse('https://limitlessorganization.org/api/movie.php'));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        categories = List<String>.from(data["categories"] ?? []);
        categories.insert(0, "All");

        movies = (data["movies"] as List).map((json) => Movie.fromJson(json)).toList();
      }
    } catch (e) {
      print(" $e");
    }

    isLoading = false;
    notifyListeners();
  }

  void updateCurrentIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }

  Future<void> fetchMoviesByCategory(String category) async {
    if (category == selectedCategory) return;
    isLoading = true;
    selectedCategory = category;
    movies = [];
    notifyListeners();

    try {
      final url = category == "All"
          ? 'https://limitlessorganization.org/api/movie.php'
          : 'https://limitlessorganization.org/api/movie.php?category=$category';

      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final rawData = response.body;
        print(" $category: $rawData");

        final data = json.decode(rawData);

        if (data is Map<String, dynamic> && data.containsKey("movies")) {
          movies = (data["movies"] as List).map((json) => Movie.fromJson(json)).toList();
        } else if (data is List) {
          movies = data.map((json) => Movie.fromJson(json)).toList();
        } else {
          movies = [];
        }
      }
    } catch (e) {
      print(" Error  $category: $e");
    }

    isLoading = false;
    notifyListeners();
  }
}
