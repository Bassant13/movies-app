import 'package:flutter/material.dart';
import 'package:movies_app/ui/widgets/movie_item.dart';

class MoviesListView extends StatelessWidget{
  int crossAxisCount;
  String? rate;
  String? imageUrl;
  Function()? onClick;
  MoviesListView({
    super.key,
    this.crossAxisCount = 2,
    required this.rate,
    required this.imageUrl
  });
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: .6
      ),
        itemBuilder: (context,index){
          return MovieItem(
              rate: rate,
              imageUrl: imageUrl,
              onClick: onClick,
          );
      }
    );
  }
}
