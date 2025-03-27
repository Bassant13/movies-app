import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import '../movieassets/movie_model.dart';


class MovieDetailsViewModel extends ChangeNotifier {
  final Movie movie;
  bool isFavorite = false;

  MovieDetailsViewModel(this.movie) {
    _loadFavoriteStatus();
  }


  Future<void> _loadFavoriteStatus() async {
    final prefs = await SharedPreferences.getInstance();
    isFavorite = prefs.getBool(movie.title) ?? false;
    notifyListeners();
  }

  Future<void> toggleFavorite() async {
    final prefs = await SharedPreferences.getInstance();
    isFavorite = !isFavorite;
    prefs.setBool(movie.title, isFavorite);
    notifyListeners();
  }


  void launchTrailer() async {
    if (movie.trailerUrl.isNotEmpty) {
      final Uri url = Uri.parse(movie.trailerUrl);
      if (await canLaunchUrl(url)) {
        await launchUrl(url, mode: LaunchMode.externalApplication);
      }
    }
  }
}
