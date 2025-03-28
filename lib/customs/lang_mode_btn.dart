import 'package:flutter/material.dart';
import '../core/app_assets/app_images/images.dart';
import '../core/colors.dart';
class LangModeBtn extends StatelessWidget {
  LangModeBtn({super.key, required this.mode});
  bool mode;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 30,
        width: 73,
        decoration: BoxDecoration(
            border: Border.all(color: AppColors.yellow, width: 2),
            borderRadius: BorderRadius.circular(30)),
        child: _onSelectMode(
          context,
          mode: mode,
        ));
  }

  Widget _onSelectMode(BuildContext context, {required bool mode}) {
    return mode == false
        ? Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Container(
          decoration: BoxDecoration(
            border: Border.all(
                width: 3, color:  AppColors.yellow),
            shape: BoxShape.circle,
            color:  AppColors.yellow,
          ),
          child: Image.asset(AppImages.usaIcon)),
      Image.asset(AppImages.egIcon),
    ])
        : Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset(
          AppImages.usaIcon,
        ),
        Container(
            decoration: BoxDecoration(
              border: Border.all(
                  width: 3, color:  AppColors.yellow),
              shape: BoxShape.circle,
              color:  AppColors.yellow,
            ),
            child: Image.asset(
              AppImages.egIcon,
            )),
      ],
    );
  }
}
