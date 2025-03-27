import 'package:flutter/material.dart';
import 'package:movies_app/core/colors.dart';

// ignore: must_be_immutable
class CustomOutlinedButton extends StatelessWidget{
  String text;
  Widget? widget;
  Function()? onClick;
  CustomOutlinedButton({required this.text, this.widget, required this.onClick});
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(AppColors.black),
          foregroundColor: MaterialStateProperty.all(AppColors.yellow),
          side: MaterialStateProperty.all(
              BorderSide(
                width: 2,
                color: AppColors.yellow
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