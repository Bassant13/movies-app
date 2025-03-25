import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import '../../../../../core/movieassets/movie_card.dart';
import '../../../../../core/movieassets/movies_view_model.dart';


class MoviesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MoviesViewModel(),
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text("Movies", style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.black,
          elevation: 0,
        ),
        body: Consumer<MoviesViewModel>(
          builder: (context, viewModel, child) {
            return Column(
              children: [

                SizedBox(
                  height: 50,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: viewModel.categories.length,
                    itemBuilder: (context, index) {
                      final category = viewModel.categories[index];
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        child: ChoiceChip(
                          label: Text(category, style: TextStyle(color: Colors.white)),
                          selected: viewModel.selectedCategory == category,
                          selectedColor: Colors.yellow[700],
                          backgroundColor: Colors.grey[800],
                          onSelected: (_) {
                            viewModel.fetchMoviesByCategory(category);
                          },
                        ),
                      );
                    },
                  ),
                ),

                Expanded(
                  child: viewModel.selectedCategory.isEmpty
                      ? SizedBox()
                      : viewModel.isLoading
                      ? Center(child: CircularProgressIndicator(color: Colors.yellow[700])) // 🟡 مؤشر تحميل
                      : viewModel.movies.isEmpty
                      ? Center(
                    child: Text(
                      "no movies",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  )
                      : GridView.builder(
                    padding: EdgeInsets.all(10),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.7,
                    ),
                    itemCount: viewModel.movies.length,
                    itemBuilder: (context, index) {
                      final movie = viewModel.movies[index];
                      return MovieCard(movie: movie);
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}


