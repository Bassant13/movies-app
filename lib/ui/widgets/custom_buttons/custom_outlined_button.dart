import 'package:flutter/material.dart';
import 'package:movies_app/core/colors.dart';

class CustomOutlinedButton extends StatelessWidget{
  String text;
  Widget? widget;
  Function()? onClick;
  CustomOutlinedButton({required this.text, this.widget, required this.onClick});
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(AppColors.primary),
          foregroundColor: MaterialStateProperty.all(AppColors.button),
          side: MaterialStateProperty.all(
              BorderSide(
                width: 2,
                color: AppColors.button
              )
          )
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