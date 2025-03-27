import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/details_model/movie_details_view_model.dart';
import '../../../core/movieassets/movie_model.dart';

class MovieDetailsScreen extends StatelessWidget {
  final Movie movie;
  MovieDetailsScreen({required this.movie});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => MovieDetailsViewModel(movie),
      child: Consumer<MovieDetailsViewModel>(
        builder: (context, viewModel, child) {
          return Scaffold(
            backgroundColor: Colors.black,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              iconTheme: IconThemeData(color: Colors.white),
            ),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.network(
                          movie.imageUrl,
                          width: double.infinity,
                          height: 300,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        top: 120,
                        left: MediaQuery.of(context).size.width / 2 - 30,
                        child: GestureDetector(
                          onTap: viewModel.launchTrailer,
                          child: Image.asset('assets/images/Group21.png', width: 60, height: 60),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text(
                    movie.title,
                    style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10),
                  Text("${movie.year}", style: TextStyle(color: Colors.grey, fontSize: 16)),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.star, color: Colors.yellow, size: 24),
                      SizedBox(width: 5),
                      Text(movie.rating.toString(), style: TextStyle(color: Colors.white, fontSize: 18)),
                    ],
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: viewModel.launchTrailer,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      padding: EdgeInsets.symmetric(horizontal: 100, vertical: 12),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                    child: Text("Watch", style: TextStyle(fontSize: 18, color: Colors.white)),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      movie.details,
                      style: TextStyle(color: Colors.white, fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 20),
                  _buildScreenshotsSection(),
                  SizedBox(height: 20),
                  _buildCastSection(),
                  SizedBox(height: 20),

                  SizedBox(height: 20),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  static Widget _buildScreenshotsSection() {
    List<String> screenshots = [
      'https://sm.ign.com/ign_ap/gallery/m/movie-stil/movie-stills-mayday_z3k8.jpg',
      'https://film-grab.com/wp-content/uploads/2020/04/08-752.jpg',
      'https://film-grab.com/wp-content/uploads/2017/11/36-94.jpg'
    ];
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Screenshots", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          Column(
            children: screenshots.map((url) => Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  url,
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: double.infinity,
                      height: 200,
                      color: Colors.grey[800],
                      child: Center(
                        child: Icon(Icons.broken_image, color: Colors.white, size: 50),
                      ),
                    );
                  },
                ),
              ),
            )).toList(),
          ),
        ],
      ),
    );
  }

  static Widget _buildCastSection() {
    List<Map<String, String>> cast = [
      {'name': 'Hayley Atwell', 'character': 'Captain Carter'},
      {'name': 'Elizabeth Olsen', 'character': 'Wanda Maximoff'},
      {'name': 'Rachel McAdams', 'character': 'Dr. Christine Palmer'},
      {'name': 'Charlize Theron', 'character': 'Clea'}
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Text("Cast", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
        ),
        SizedBox(height: 10),
        Column(
          children: cast.map((actor) => Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xff282A28),
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.all(10),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.grey,
                    child: Icon(Icons.person, color: Colors.white),
                  ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Name: ${actor['name']}", style: TextStyle(color: Colors.white, fontSize: 14)),
                      Text("Character: ${actor['character']}", style: TextStyle(color: Colors.grey, fontSize: 12)),
                    ],
                  ),
                ],
              ),
            ),
          )).toList(),
        ),
      ],
    );
  }
}
