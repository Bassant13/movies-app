import 'package:flutter/material.dart';
import 'package:movies_app/ui/widgets/homescreen_widget/animated.dart';
import 'package:movies_app/ui/widgets/homescreen_widget/movies.dart';

import 'package:provider/provider.dart';
import 'package:carousel_slider/carousel_slider.dart';


class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Animated(),
          getmovies(),
        ],
      ),

    );
  }
}
