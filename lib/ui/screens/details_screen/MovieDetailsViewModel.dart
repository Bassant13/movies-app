import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
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
                    child: Text("Watch", style: TextStyle(fontSize: 18,color: Colors.white)),
                  ),

                  SizedBox(height: 20),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [

                      GestureDetector(
                        onTap: viewModel.toggleFavorite,
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: Color(0xff282A28), // خلفية داكنة
                            borderRadius: BorderRadius.circular(20), // زوايا دائرية
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.favorite,
                                color: viewModel.isFavorite ? Colors.yellow : Colors.white, // لون القلب أصفر عند التفضيل
                                size: 24,
                              ),
                              SizedBox(width: 5),
                              Text(
                                "15", // عدد الإعجابات (يمكن تغييره بناءً على البيانات)
                                style: TextStyle(color: Colors.white, fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {

                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: Color(0xff282A28),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            children: [
                              Icon(Icons.timelapse, color: Colors.yellow, size: 24),
                              SizedBox(width: 5),
                              Text("90", style: TextStyle(color: Colors.white, fontSize: 16)),
                            ],
                          ),
                        ),
                      ),

                      GestureDetector(
                        onTap: () {

                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: Color(0xff282A28), // خلفية داكنة
                            borderRadius: BorderRadius.circular(20), // زوايا دائرية
                          ),
                          child: Row(
                            children: [
                              Icon(Icons.share, color: Colors.yellow, size: 24),
                              SizedBox(width: 5),
                              Text("Share", style: TextStyle(color: Colors.white, fontSize: 16)),
                            ],
                          ),
                        ),
                      ),
                    ],
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
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
