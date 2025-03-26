import 'package:flutter/material.dart';
import 'package:movies_app/core/colors.dart';

class CustomYellowButton extends StatelessWidget{
  String text;
  Widget? widget;
  Function()? onClick;
  CustomYellowButton({required this.text, this.widget, required this.onClick});
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
       style: ButtonStyle(
         backgroundColor: MaterialStateProperty.all(AppColors.button),
         foregroundColor: MaterialStateProperty.all(AppColors.primary),

       ),
        onPressed: onClick,
        child:  Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            widget ?? const Text(""),
            Text(
              text,
            )
          ],
        )
    );
  }
}