import 'package:flutter/material.dart';
import 'package:movies_app/core/colors.dart';

class MovieItem extends StatelessWidget{
  String? rate;
  String? imageUrl;
  MovieItem({required this.rate,required this.imageUrl});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.orange,
        borderRadius: BorderRadius.circular(16)
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.network(
            imageUrl ?? "",
            fit: BoxFit.fill,
            width: 189,
            height: 279,
                    ),
          ),
           Container(
            decoration:  BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color:  AppColors.lowOpacityBlack
            ),
            width: 65,
            height: 32,
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                 Text(
                   rate ?? "",
                   style: Theme.of(context).textTheme.bodySmall,
                 ),
                Icon(
                  Icons.star_rounded,
                  size: 22,
                  color: AppColors.yellow,
                )
              ],
            ),
          )
    ]
      ),

    );
  }
}