import 'package:flutter/material.dart';
import 'package:movies_app/core/colors.dart';

class MovieItem extends StatelessWidget{
   String? rate;
   String? imageUrl;
   Function()? onClick;
   MovieItem({super.key, required this.rate,required this.imageUrl,this.onClick});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16)
      ),
      child: InkWell(
        onTap: onClick,
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
              imageUrl ?? "",
              fit: BoxFit.fill,
             // width: 189,
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
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                   Text(
                     rate ?? "",
                     style: Theme.of(context).textTheme.bodySmall,
                   ),
                  const Icon(
                    Icons.star_rounded,
                    size: 22,
                    color: AppColors.button,
                  )
                ],
              ),
            )
            ]
        ),
      ),

    );
  }
}