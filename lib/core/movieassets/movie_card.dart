
import 'package:flutter/material.dart';
import 'movie_model.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;
  final bool small;
  final bool isBig;

  MovieCard({required this.movie, this.small = false, this.isBig = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.network(
              movie.imageUrl,
              width: isBig ? 250 : (small ? 100 : 150),
              height: isBig ? 350 : (small ? 140 : 200),
              fit: BoxFit.cover,
            ),
          ),


          Positioned(
            top: 8,
            left: 8,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 6, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.7),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Icon(Icons.star, color: Colors.yellow, size: 16),
                  SizedBox(width: 4),
                  Text("${movie.rating}", style: TextStyle(color: Colors.white)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
