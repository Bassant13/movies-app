import 'package:flutter/material.dart';
import '../core/colors.dart';

class InputField extends StatefulWidget {
  final String lable;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Function validate;
  void Function(String)? onClick;
  final TextEditingController? controller;
  final bool isPassword;
  final bool isObscure;
  InputField(
      {super.key,
        this.lable = "",
        required this.validate,
        this.prefixIcon,
        this.suffixIcon,
        this.controller,
        this.isPassword = false,
        this.isObscure = false,
        this.onClick});

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onFieldSubmitted: widget.onClick,
      validator: (value) => widget.validate(value),
      controller: widget.controller,
      obscureText: widget.isPassword ? _obscureText : false,
      cursorColor: AppColors.text,
      decoration: InputDecoration(
        hintText: widget.lable,
        hintStyle: Theme.of(context).textTheme.bodyMedium,
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.isPassword  ?IconButton(
      icon: Icon(
      _obscureText ? Icons.visibility_off : Icons.visibility,
        color: AppColors.text,
      ),
      onPressed: () {
        setState(() {
          _obscureText = !_obscureText;
        });
      },
    )
        : null,
        filled: true,
        fillColor: AppColors.secondary,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: AppColors.greyScreen),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: AppColors.greyScreen),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
            color: AppColors.secondary,
          ),
        ),
      ),
    );
  }
}
