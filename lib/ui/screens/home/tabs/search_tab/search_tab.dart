import 'package:flutter/material.dart';

import 'package:movies_app/ui/screens/details_screen/MovieDetailsViewModel.dart';
import 'package:provider/provider.dart';
import '../../../../../core/movieassets/api_service.dart';
import '../../../../../core/movieassets/movies_view_model.dart';
import '../../../../../core/movieassets/search/movie_model.dart';


class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<Movie> movies = [];
  List<Movie> filteredMovies = [];
  bool isLoading = true;
  bool noResults = false;
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    loadMovies();
  }

  Future<void> loadMovies() async {
    movies = await ApiService.fetchMovies();
    setState(() {
      filteredMovies = List.from(movies);
      isLoading = false;
    });
  }

  void searchMovies(String query) {
    List<Movie> results = movies
        .where((movie) => movie.title.toLowerCase().contains(query.toLowerCase()))
        .toList();

    setState(() {
      filteredMovies = results;
      noResults = results.isEmpty && query.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    final moviesViewModel = Provider.of<MoviesViewModel>(context);
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Search", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              controller: searchController,
              onChanged: searchMovies,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: "Search...",
                hintStyle: const TextStyle(color: Colors.grey),
                prefixIcon: const Icon(Icons.search, color: Colors.white),
                filled: true,
                fillColor: Colors.grey[900],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),

          if (isLoading)
            const Expanded(child: Center(child: CircularProgressIndicator()))
          else if (noResults)
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("images/run.png", width: 200),
                    const SizedBox(height: 10),

                  ],
                ),
              ),
            )
          else
            Expanded(
              child: GridView.builder(

                padding: const EdgeInsets.all(10),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.7,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: filteredMovies.length,
                itemBuilder: (context, index) {
                  final wmovie = moviesViewModel.movies[index];
                  final movie = filteredMovies[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MovieDetailsScreen(movie: wmovie),
                        ),
                      );
                    },
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            movie.imageUrl,
                            width: double.infinity,
                            height: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          top: 5,
                          left: 5,
                          child: Container(
                            padding: const EdgeInsets.all(5),
                            color: Colors.black54,
                            child: Row(
                              children: [
                                const Icon(Icons.star, color: Colors.yellow, size: 16),
                                const SizedBox(width: 3),
                                Text(
                                  movie.rating.toString(),
                                  style: const TextStyle(color: Colors.white, fontSize: 14),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );

                },
              ),
            ),
        ],
      ),
    );
  }
}
