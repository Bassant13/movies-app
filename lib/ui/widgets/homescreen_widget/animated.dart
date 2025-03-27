import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/movieassets/movies_view_model.dart';


class Animated extends StatefulWidget {
  const Animated({super.key});

  @override
  State<Animated> createState() => _AnimatedState();
}

class _AnimatedState extends State<Animated> {
  @override
  Widget build(BuildContext context) {
    final moviesViewModel = Provider.of<MoviesViewModel>(context);
    return AnimatedSwitcher(
      duration: Duration(milliseconds: 600),
      child: moviesViewModel.movies.isEmpty
          ? Container(color: Colors.black)
          : Image.network(
        moviesViewModel.movies[moviesViewModel.currentIndex].imageUrl,
        key: ValueKey(moviesViewModel.currentIndex),
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
      ),
    );
  }
}
