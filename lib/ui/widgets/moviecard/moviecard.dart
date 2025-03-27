import 'package:flutter/material.dart';


import '../../../core/movieassets/movie_model.dart';
import '../../screens/details_screen/MovieDetailsViewModel.dart';


class MovieCard extends StatelessWidget {
  final Movie movie;

  const MovieCard({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MovieDetailsScreen(movie: movie)),
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.grey[900],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Stack(
          children: [

            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                movie.imageUrl,
                height: double.infinity,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),

            Positioned(
              top: 8,
              left: 8,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Icon(Icons.star, color: Colors.yellow[700], size: 16),
                    SizedBox(width: 4),
                    Text(movie.rating.toString(), style: TextStyle(color: Colors.white)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
