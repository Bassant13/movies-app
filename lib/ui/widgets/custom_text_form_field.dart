import 'package:flutter/material.dart';
import 'package:movies_app/core/colors.dart';

class CustomTextFormField extends StatefulWidget{
  String hint;
  String? Function(String?)? validator;
  TextEditingController controller ;
  IconData iconName;
  bool isPassword;

  CustomTextFormField({
    required this.hint,
    required this.controller,
    this.validator,
    this.isPassword = false,
    required this.iconName
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Theme.of(context).textTheme.bodyMedium!.color,
      controller: widget.controller,
      validator: widget.validator,
      obscureText: widget.isPassword? !isVisible : false,
      style: Theme.of(context).textTheme.bodyMedium,

      decoration: InputDecoration(
        hintText: widget.hint,
        hintStyle: Theme.of(context).textTheme.bodyMedium,
        prefixIcon: Icon(
          widget.iconName,
          size: 25,
          color: Theme.of(context).textTheme.bodyMedium!.color,
        ),

        suffixIcon: widget.isPassword? IconButton(
          onPressed: () {
            setState(() {
              isVisible = !isVisible;
            });
          },
          icon: Icon(isVisible? Icons.visibility : Icons.visibility_off,
            size: 25,
            color: Theme.of(context).textTheme.bodyMedium!.color,
          )
          ,) : null,
        enabledBorder:  OutlineInputBorder(
          borderRadius:  BorderRadius.circular(15),
          borderSide: BorderSide.none
        ),
        focusedBorder: InputBorder.none,
        filled: true,
        fillColor: AppColors.darkGray,
      ),

    );
  }
}