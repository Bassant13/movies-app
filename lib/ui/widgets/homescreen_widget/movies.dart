import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';


import 'package:provider/provider.dart';

import '../../../core/movieassets/movie_card.dart';
import '../../../core/movieassets/movies_view_model.dart';
import '../../screens/details_screen/MovieDetailsViewModel.dart';


class getmovies extends StatelessWidget {
  const getmovies({super.key});

  @override
  Widget build(BuildContext context) {
    final moviesViewModel = Provider.of<MoviesViewModel>(context);
    return Container(
      color: Colors.black.withOpacity(0.7),
      child: Column(
        children: [
          SizedBox(height: 70),
          Image.asset('assets/images/avbaliable.png', width: 354, height: 120),
          SizedBox(height: 20),
          moviesViewModel.movies.isEmpty
              ? Center(child: CircularProgressIndicator())
              : CarouselSlider.builder(
            itemCount: moviesViewModel.movies.length,
            options: CarouselOptions(
              height: 234,
              enlargeCenterPage: true,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 3),
              viewportFraction: 0.6,
              onPageChanged: (index, reason) {
                moviesViewModel.updateCurrentIndex(index);
              },
            ),
            itemBuilder: (context, index, realIndex) {
              bool isCentered = index == moviesViewModel.currentIndex;
              return MovieCard(movie: moviesViewModel.movies[index], isBig: isCentered);
            },
          ),
          SizedBox(height: 20),
          Image.asset('assets/images/WatchNow.png', width: 267, height: 93),
          SizedBox(height: 10),
          SizedBox(
            height: 140,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: moviesViewModel.movies.length,
              itemBuilder: (context, index) {
                final movie = moviesViewModel.movies[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MovieDetailsScreen(movie: movie),
                      ),
                    );
                  },
                  child: MovieCard(movie: movie, small: true),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
