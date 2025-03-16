import 'package:flutter/material.dart';
import 'package:movies_app/core/colors.dart';

class CustomRedButton extends StatelessWidget{
  String text;
  Widget? widget;
  Function()? onClick;
  CustomRedButton({required this.text, this.widget, required this.onClick});
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(AppColors.red),
          foregroundColor: MaterialStateProperty.all(AppColors.white),

        ),
        onPressed: onClick,
        child:  Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
            ),
            widget ?? const Text(""),
          ],
        )
    );
  }
}